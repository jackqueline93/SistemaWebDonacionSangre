using DonacionSangre.BusinessEntity;
using DonacionSangre.DataModel.BDContext;
using DonacionSangre.Infrastructure.Core.Function;

namespace DonacionSangre.BusinessServices.Mapping
{
    public class BusinessServiceMappingProfile : AutoMapper.Profile
    {
        public BusinessServiceMappingProfile()
        {
            CreateMap<usuario, UsuarioBE>();
            CreateMap<UsuarioBE, usuario>();

            CreateMap<aviso, AvisoBE>()
                .ForMember(x => x.FechaVigencia, y => y.MapFrom(z => ComunUtil.ConvertirFecha(z.fechaVigencia)));
            CreateMap<AvisoBE, aviso>()
                .ForMember(x => x.fechaVigencia, y => y.MapFrom(z => ComunUtil.ConvertirFecha(z.FechaVigencia)));

            CreateMap<postulacion, PostulacionBE>();
            CreateMap<PostulacionBE, postulacion>();

            CreateMap<tipoSangre, ItemBE>()
                .ForMember(x => x.Codigo, y => y.MapFrom(z => z.idSangre.ToString()))
                .ForMember(x => x.Descripcion, y => y.MapFrom(z => z.nombre));

        }
    }
}
