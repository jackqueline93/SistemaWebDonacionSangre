using DonacionSangre.Rest.ActionFilters;
using DonacionSangre.Rest.HandlerTrace;
using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using System.Linq;
using System.Net.Http.Formatting;
using System.Web.Http;
using System.Web.Http.Cors;
using System.Web.Http.ExceptionHandling;

namespace DonacionSangre.Rest.App_Start
{
    public class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            //config.SuppressDefaultHostAuthentication();
            //config.Filters.Add(new HostAuthenticationFilter(OAuthDefaults.AuthenticationType));
            //config.Filters.Add(new AuthorizeAttribute());

            // Web API configuration and services
            config.EnableCors(new EnableCorsAttribute("*", "*", "*"));

            // Web API routes
            config.MapHttpAttributeRoutes();

            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );

            RegisterCamelCaseProperty(config);
            RegisterNullEmptyValue(config);
            RegisterHandlers(config);
        }
        public static void RegisterCamelCaseProperty(HttpConfiguration config)
        {
            config.Formatters.JsonFormatter.SerializerSettings.ContractResolver = new CamelCasePropertyNamesContractResolver();
            config.Formatters.JsonFormatter.UseDataContractJsonSerializer = false;
        }

        public static void RegisterNullEmptyValue(HttpConfiguration config)
        {
            var formatter = config.Formatters.OfType<JsonMediaTypeFormatter>().First();

            formatter.SerializerSettings = new JsonSerializerSettings
            {
                DateFormatString = "dd/MM/yyyy",
                NullValueHandling = NullValueHandling.Ignore,
                Formatting = Formatting.Indented,
                //DefaultValueHandling = DefaultValueHandling.IgnoreAndPopulate
                DefaultValueHandling = DefaultValueHandling.Populate
            };
            config.Formatters.Remove(config.Formatters.XmlFormatter);
        }

        private static void RegisterHandlers(HttpConfiguration config)
        {
            config.Services.Replace(typeof(IExceptionHandler), new ApiExceptionHandler());
            config.Filters.Add(new LoggingFilterAttribute());
        }
    }
}