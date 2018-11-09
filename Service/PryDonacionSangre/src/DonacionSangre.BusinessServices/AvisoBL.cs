using AutoMapper;
using DonacionSangre.BusinessEntity;
using DonacionSangre.DataModel.BDContext;
using DonacionSangre.DataModel.UnitOfWork;
using System.Collections.Generic;

namespace DonacionSangre.BusinessServices
{
    public interface IAvisoBL
    {
        IEnumerable<AvisoBE> ObtenerAvisoPorUsuario(int idUsuario);
        void Registrar(AvisoBE entidad);
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
            var lista = unitOfWork.AvispRepository.GetMany(x => x.idUsuarioSolicitante.Equals(idUsuario));
            return Mapper.Map<IEnumerable<aviso>, IEnumerable<AvisoBE>>(lista);
        }

        public void Registrar(AvisoBE entidad)
        {
            var aviso = Mapper.Map<AvisoBE, aviso>(entidad);
            unitOfWork.AvispRepository.Insert(aviso);
            unitOfWork.Save();
        }
    }
}
