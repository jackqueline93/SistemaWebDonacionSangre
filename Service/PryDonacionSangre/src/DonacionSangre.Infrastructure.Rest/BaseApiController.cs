using System.Linq;
using System.Net.Http;
using System.Security.Claims;
using System.Web.Http;

namespace DonacionSangre.Infrastructure.Rest
{
    public class BaseApiController : ApiController
    {
        private readonly ClaimsPrincipal principal;
        private string GetValueToken(string type)
        {
            var result = string.Empty;
            ClaimsPrincipal principal = Request.GetRequestContext().Principal as ClaimsPrincipal;
            if (principal != null)
                result = principal.Claims.First(c => c.Type == type).Value;

            return result;
        }
        
        protected string GetToken()
        {
            var token = Request.Headers.Authorization.Parameter;
            return token;
        }
        protected string GetUser()
        {
            return GetValueToken(ClaimTypes.Name);
        }
    }
}
