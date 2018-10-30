using DonacionSangre.BusinessServices.Mapping;

namespace DonacionSangre.Rest.App_Start
{
    public class MappingConfig
    {
        public static void Register()
        {
            AutoMapper.Mapper.Initialize(cfg =>
            {
                cfg.AddProfile<BusinessServiceMappingProfile>();

            });
        }
    }
}