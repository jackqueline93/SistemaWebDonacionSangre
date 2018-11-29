using AutoMapper;
using DonacionSangre.BusinessEntity;
using DonacionSangre.DataModel.BDContext;
using DonacionSangre.DataModel.UnitOfWork;
using System.Collections.Generic;

namespace DonacionSangre.BusinessServices
{
    public interface IGeneralBL
    {
        IEnumerable<ItemBE> ListarTipoSangre();
        IEnumerable<ItemBE> ListarDepartamento();
        IEnumerable<ItemBE> ListarCiudad(int idDepartamento);
    }

    public class GeneralBL : IGeneralBL
    {
        private readonly IUnitOfWork unitOfWork;
        public GeneralBL()
        {
            unitOfWork = new UnitOfWork();
        }

        public IEnumerable<ItemBE> ListarTipoSangre()
        {
            var lista = unitOfWork.GeneralRepository.GetTipoSangre();
            return Mapper.Map<IEnumerable<tipoSangre>, IEnumerable<ItemBE>>(lista);
        }

        public IEnumerable<ItemBE> ListarDepartamento()
        {
            var lista = unitOfWork.GeneralRepository.GetDepartamento();
            return Mapper.Map<IEnumerable<departamento>, IEnumerable<ItemBE>>(lista);
        }

        public IEnumerable<ItemBE> ListarCiudad(int idDepartamento)
        {
            var lista = unitOfWork.GeneralRepository.GetCiudad(idDepartamento);
            return Mapper.Map<IEnumerable<ciudad>, IEnumerable<ItemBE>>(lista);
        }


    }
}
