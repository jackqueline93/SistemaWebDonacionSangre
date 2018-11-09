using DonacionSangre.BusinessEntity;
using DonacionSangre.DataModel.BDContext;

namespace DonacionSangre.BusinessServices.Mapping
{
    public class BusinessServiceMappingProfile : AutoMapper.Profile
    {
        public BusinessServiceMappingProfile()
        {
            CreateMap<usuario, UsuarioBE>();
            CreateMap<UsuarioBE, usuario>();

            CreateMap<aviso, AvisoBE>();
            CreateMap<AvisoBE, aviso>();

            CreateMap<postulacion, PostulacionBE>();
            CreateMap<PostulacionBE, postulacion>();

            CreateMap<tipoSangre, ItemBE>()
                .ForMember(x => x.Codigo, y => y.MapFrom(z => z.idSangre.ToString()))
                .ForMember(x => x.Descripcion, y => y.MapFrom(z => z.nombre));

        }
    }
}
