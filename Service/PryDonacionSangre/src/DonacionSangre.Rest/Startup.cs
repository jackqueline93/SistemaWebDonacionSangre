using System;
using System.Threading.Tasks;
using Microsoft.Owin;
using Owin;
using DonacionSangre.Rest.App_Start;
using System.Web.Http;

[assembly: OwinStartup(typeof(DonacionSangre.Rest.Startup))]

namespace DonacionSangre.Rest
{
    public class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            // Useful for Swagger implemetation
            //GlobalConfiguration.Configure((configuration) => { configuration.MapHttpAttributeRoutes(); });

            HttpConfiguration config = new HttpConfiguration()
            {
                // Add this line to enable detail mode in release
                IncludeErrorDetailPolicy = IncludeErrorDetailPolicy.Always
            };
            WebApiConfig.Register(config);
            AuthConfig.Configure(app);
            MappingConfig.Register();

            app.UseWebApi(config);
        }
    }
}
