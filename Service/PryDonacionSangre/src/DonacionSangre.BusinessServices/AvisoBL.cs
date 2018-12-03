using AutoMapper;
using DonacionSangre.BusinessEntity;
using DonacionSangre.DataModel.BDContext;
using DonacionSangre.DataModel.UnitOfWork;
using DonacionSangre.Infrastructure.Core.Constant;
using DonacionSangre.Infrastructure.Core.ExceptionHandling;
using DonacionSangre.Infrastructure.Core.Function;
using System;
using System.Collections.Generic;
using System.Linq;

namespace DonacionSangre.BusinessServices
{
    public interface IAvisoBL
    {
        IEnumerable<AvisoBE> ObtenerAvisoPorUsuario(int idUsuario);
        AvisoBE ObtenerAvisoPorId(int id, int idUsuario);
        int Registrar(AvisoBE entidad);
        bool Modificar(int id, AvisoBE entidad);
        bool Eliminar(int id);
        IEnumerable<UsuarioBE> ListarPostulante(int id);
        IEnumerable<AvisoBE> ListarAvisosPorDonante(int idUsuarioDonante);
    }
    public class AvisoBL : IAvisoBL
    {
        private readonly IUnitOfWork unitOfWork;

        public AvisoBL()
        {
            unitOfWork = new UnitOfWork();
        }

        public IEnumerable<AvisoBE> ObtenerAvisoPorUsuario(int idUsuario)
        {
            var lista = unitOfWork.AvisoRepository.GetWithInclude(x => x.idUsuarioSolicitante.Equals(idUsuario), "tipoSangre", "postulacion").ToList();
            //var lista = unitOfWork.AvisoRepository.GetMany(x => x.idUsuarioSolicitante.Equals(idUsuario));

            return Mapper.Map<IEnumerable<aviso>, IEnumerable<AvisoBE>>(lista);
        }

        public AvisoBE ObtenerAvisoPorId(int id, int idUsuario)
        {
            var entidad = unitOfWork.AvisoRepository.GetWithInclude(x => x.idAviso.Equals(id), "tipoSangre").FirstOrDefault();
            //var lista = unitOfWork.AvisoRepository.GetMany(x => x.idUsuarioSolicitante.Equals(idUsuario));

            return Mapper.Map<aviso, AvisoBE>(entidad);
        }

        public int Registrar(AvisoBE entidad)
        {
            var aviso = Mapper.Map<AvisoBE, aviso>(entidad);

            if (entidad == null)
                throw new ApiBusinessException("No hay datos a registrar.");

            unitOfWork.AvisoRepository.Insert(aviso);
            unitOfWork.Save();

            return aviso.idAviso;
        }

        public bool Modificar(int id, AvisoBE entidad)
        {
            var resultado = false;

            if (id <= 0)
                throw new ApiBusinessException("No existe id de aviso.");

            if (entidad == null)
                throw new ApiBusinessException("No hay datos a modificar.");

            var avisobd = unitOfWork.AvisoRepository.GetByID(id);
            if (avisobd != null)
            {
                if (avisobd.fechaVigencia < DateTime.Now.Date)
                    throw new ApiBusinessException("No se puede modificar porque el aviso tiene fecha vigente.");

                if (unitOfWork.PostulacionRepository.Exists(x => x.idAviso.Equals(avisobd.idAviso)))
                    throw new ApiBusinessException("No se puede modificar porque ya tiene postulantes.");

                avisobd.idSangre = entidad.IdSangre;
                avisobd.nombre = entidad.Nombre;
                avisobd.cantidad = entidad.Cantidad;
                avisobd.descripcion = entidad.Descripcion;
                avisobd.fechaVigencia = ComunUtil.ConvertirFecha(entidad.FechaVigencia);
                unitOfWork.AvisoRepository.Update(avisobd);
                unitOfWork.Save();
                resultado = true;
            }
            else
            {
                throw new ApiBusinessException("Aviso {0} no existe.", id);
            }

            return resultado;
        }

        public bool Eliminar(int id)
        {
            var resultado = false;

            if (id <= 0)
                throw new ApiBusinessException("No existe id de aviso.");

            var avisobd = unitOfWork.AvisoRepository.GetByID(id);
            if (avisobd != null)
            {
                if (unitOfWork.PostulacionRepository.Exists(x => x.idAviso.Equals(avisobd.idAviso)))
                    throw new ApiBusinessException("No se puede eliminar porque ya tiene postulantes.");

                unitOfWork.AvisoRepository.Delete(avisobd);
                unitOfWork.Save();
            }
            else
            {
                throw new ApiBusinessException("Aviso {0} no existe.", id);
            }

            return resultado;
        }

        public IEnumerable<UsuarioBE> ListarPostulante(int id)
        {
            var entidad = unitOfWork.PostulacionRepository.GetWithInclude(x => x.idAviso.Equals(id), "usuario").ToList();
            var postulante = from x in entidad
                             select x.usuario;

            return Mapper.Map<IEnumerable<usuario>, IEnumerable<UsuarioBE>>(postulante);
        }

        public IEnumerable<AvisoBE> ListarAvisosPorDonante(int idUsuarioDonante)
        {
            var entidad = unitOfWork.PostulacionRepository.GetWithInclude(x => x.idUsuarioDonante.Equals(idUsuarioDonante), "aviso").ToList();
            var avisos = from x in entidad
                         select x.aviso;

            return Mapper.Map<IEnumerable<aviso>, IEnumerable<AvisoBE>>(avisos);
        }
    }
}
