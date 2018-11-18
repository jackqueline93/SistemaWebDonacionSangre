using AutoMapper;
using DonacionSangre.BusinessEntity;
using DonacionSangre.DataModel.BDContext;
using DonacionSangre.DataModel.UnitOfWork;
using DonacionSangre.Infrastructure.Core.ExceptionHandling;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DonacionSangre.BusinessServices
{
    public interface IPostulacionBL
    {
        IEnumerable<AvisoBE> BuscarAviso(int idTipoSangre);
        int Registrar(PostulacionBE entidad);
    }

    public class PostulacionBL : IPostulacionBL
    {
        private readonly IUnitOfWork unitOfWork;

        public PostulacionBL()
        {
            unitOfWork = new UnitOfWork();
        }

        public IEnumerable<AvisoBE> BuscarAviso(int idTipoSangre)
        {
            var lista = unitOfWork.AvisoRepository.GetWithInclude(x => (x.idSangre.Equals(idTipoSangre) || idTipoSangre.Equals(0))
                                                                    && x.postulacion.Count() < x.cantidad
                                                                , "postulacion"
                                                                ).ToList();

            var filtro = lista.Where(x => x.fechaVigencia >= DateTime.Now.Date);
            return Mapper.Map<IEnumerable<aviso>, IEnumerable<AvisoBE>>(lista);
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

            return postulacion.idPostulacion;
        }


    }
}
