using AutoMapper;
using DonacionSangre.BusinessEntity;
using DonacionSangre.DataModel.BDContext;
using DonacionSangre.DataModel.UnitOfWork;
using System.Collections.Generic;

namespace DonacionSangre.BusinessServices
{
    public interface IGeneralBL
    {
        IEnumerable<ItemBE> ObtenerTipoSangre();
        IEnumerable<ItemBE> ObtenerDepartamento();
    }

    public class GeneralBL : IGeneralBL
    {
        private readonly IUnitOfWork unitOfWork;
        public GeneralBL()
        {
            unitOfWork = new UnitOfWork();
        }

        public IEnumerable<ItemBE> ObtenerTipoSangre()
        {
            var lista = unitOfWork.GeneralRepository.GetTipoSangre();
            return Mapper.Map<IEnumerable<tipoSangre>, IEnumerable<ItemBE>>(lista);
        }

        public IEnumerable<ItemBE> ObtenerDepartamento()
        {
            var lista = unitOfWork.GeneralRepository.GetDepartamento();
            return Mapper.Map<IEnumerable<departamento>, IEnumerable<ItemBE>>(lista);
        }
    }
}
