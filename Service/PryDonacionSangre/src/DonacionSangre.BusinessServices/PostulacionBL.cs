using AutoMapper;
using DonacionSangre.BusinessEntity;
using DonacionSangre.DataModel.BDContext;
using DonacionSangre.DataModel.UnitOfWork;
using DonacionSangre.Infrastructure.Core.ExceptionHandling;
using DonacionSangre.Infrastructure.Core.Function;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DonacionSangre.BusinessServices
{
    public interface IPostulacionBL
    {
        IEnumerable<AvisoBE> BuscarAviso(int idTipoSangre, int idDepartamento, int idCiudad);
        int Registrar(PostulacionBE entidad);
    }

    public class PostulacionBL : IPostulacionBL
    {
        private readonly IUnitOfWork unitOfWork;

        public PostulacionBL()
        {
            unitOfWork = new UnitOfWork();
        }

        public IEnumerable<AvisoBE> BuscarAviso(int idTipoSangre, int idDepartamento, int idCiudad)
        {
            var lista = unitOfWork.AvisoRepository.GetWithInclude(x => (x.idSangre.Equals(idTipoSangre) || idTipoSangre.Equals(0))
                                                                    && (x.idDepartamento.Equals(idDepartamento) || idDepartamento.Equals(0))
                                                                    && (x.idCiudad.Equals(idCiudad) || idCiudad.Equals(0))
                                                                    && x.postulacion.Count() < x.cantidad
                                                                , "postulacion"
                                                                ).ToList();

            var filtro = lista.Where(x => x.fechaVigencia >= DateTime.Now.Date
                                    //&& (x.nombre.ToUpper().Contains(nombre?.ToUpper()) || string.IsNullOrEmpty(nombre))
                                    )?.OrderByDescending(x => x.fechaVigencia);
            return Mapper.Map<IEnumerable<aviso>, IEnumerable<AvisoBE>>(filtro);
        }

        public int Registrar(PostulacionBE entidad)
        {
            if (entidad == null)
                throw new ApiBusinessException("No hay datos a registrar.");

            var postulacion = Mapper.Map<PostulacionBE, postulacion>(entidad);

            var aviso = unitOfWork.AvisoRepository.GetWithInclude(x => x.idAviso.Equals(entidad.IdAviso)
                                                                    && x.postulacion.Count() < x.cantidad
                                                                , "postulacion"
                                                                ).FirstOrDefault();

            if (aviso == null)
                throw new ApiBusinessException("Aviso no existe o se completo la cantidad de donantes.");

            if (aviso.idUsuarioSolicitante.Equals(entidad.IdUsuarioDonante))
            {
                throw new ApiBusinessException("No puede donar a su mismo aviso.");
            }

            foreach (var item in aviso.postulacion)
            {
                if (item.idUsuarioDonante.Equals(entidad.IdUsuarioDonante))
                {
                    throw new ApiBusinessException("Solo puede donar una vez.");
                }
            }

            unitOfWork.PostulacionRepository.Insert(postulacion);
            unitOfWork.Save();

            EnviarCorreoSolicitante(aviso, entidad.IdUsuarioDonante);

            return postulacion.idPostulacion;
        }

        private void EnviarCorreoSolicitante(aviso aviso, int idUsuarioDonante)
        {
            try
            {
                var solicitante = unitOfWork.UsuarioRepository.GetByID(aviso.idUsuarioSolicitante);
                var donante = unitOfWork.UsuarioRepository.GetByID(idUsuarioDonante);

                var mensaje = new StringBuilder();
                mensaje.AppendFormat("Aviso : {0}", aviso.nombre);
                mensaje.Append("</br><b>Datos de Donante:</b> </br>");
                mensaje.AppendFormat("Correo : {0}</br>", donante.correo);
                mensaje.AppendFormat("Nombre : {0} {1}</br>", donante.nombre, donante.apellido);
                mensaje.AppendFormat("DNI : {0}</br>", donante.dni);
                mensaje.AppendFormat("Telefono : {0}</br>", donante.celular);

                ComunUtil.SendMail(solicitante.correo, "", "Nuevo donante para su aviso", mensaje.ToString());
            }
            catch (Exception ex)
            {
                LogUtil.Error(ex.Message, ex);
            }
        }

    }
}
