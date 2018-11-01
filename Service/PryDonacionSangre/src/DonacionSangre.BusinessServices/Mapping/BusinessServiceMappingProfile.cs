using DonacionSangre.BusinessEntity;
using DonacionSangre.DataModel.BDContext;

namespace DonacionSangre.BusinessServices.Mapping
{
    public class BusinessServiceMappingProfile : AutoMapper.Profile
    {
        public BusinessServiceMappingProfile()
        {
            CreateMap<usuario, UsuarioBE>();
        }
    }
}
