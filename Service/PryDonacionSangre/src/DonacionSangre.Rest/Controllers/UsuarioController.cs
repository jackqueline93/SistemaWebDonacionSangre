using DonacionSangre.BusinessServices;
using DonacionSangre.Infrastructure.Core;
using DonacionSangre.Infrastructure.Rest;
using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;

namespace DonacionSangre.Rest.Controllers
{
    [RoutePrefix("api/usuarios")]
    public class UsuarioController : BaseApiController
    {
        private IAuthenticationManager Authentication
        {
            get
            {
                return Request.GetOwinContext().Authentication;
            }
        }

        private readonly IUsuarioBL usuarioBL;
        public UsuarioController()
        {
            usuarioBL = new UsuarioBL();
        }

        [Authorize]
        [HttpPost]
        [Route("logout")]
        public IHttpActionResult CerrarSession()
        {
            var userName = GetUser();
            this.Authentication.SignOut();
            this.Authentication.SignOut(Microsoft.AspNet.Identity.DefaultAuthenticationTypes.ExternalCookie);
            HttpContext.Current.GetOwinContext().Authentication.SignOut(Microsoft.AspNet.Identity.DefaultAuthenticationTypes.ExternalCookie);
            this.Authentication.SignOut(Microsoft.AspNet.Identity.DefaultAuthenticationTypes.ExternalBearer);
            HttpContext.Current.GetOwinContext().Authentication.SignOut(Microsoft.AspNet.Identity.DefaultAuthenticationTypes.ExternalBearer);
            this.Authentication.SignOut(Microsoft.AspNet.Identity.DefaultAuthenticationTypes.ApplicationCookie);
            HttpContext.Current.GetOwinContext().Authentication.SignOut(Microsoft.AspNet.Identity.DefaultAuthenticationTypes.ApplicationCookie);
            this.Authentication.SignOut(Microsoft.AspNet.Identity.DefaultAuthenticationTypes.TwoFactorCookie);
            this.Authentication.SignOut(Microsoft.AspNet.Identity.DefaultAuthenticationTypes.TwoFactorRememberBrowserCookie);

            return Ok(new ApiResult { Data = null, Message = string.Format("User: {0} finish session", userName), OperationCode = (int)HttpStatusCode.OK });
        }

        [Authorize]
        [HttpGet]
        [Route("claims")]
        public IHttpActionResult ObtenerPorCorreo()
        {
            var correo = GetUser();
            var entidad = usuarioBL.ObtenerPorCorreo(correo);
            return Ok(new ApiResult() { Data = entidad, OperationCode = HttpStatusCode.OK.GetHashCode() });
        }

        [Authorize]
        [HttpGet]
        [Route("{idUsuario}")]
        public IHttpActionResult ObtenerPorId(int idUsuario)
        {
            var entidad = usuarioBL.ObtenerPorId(idUsuario);
            return Ok(new ApiResult() { Data = entidad, OperationCode = HttpStatusCode.OK.GetHashCode() });
        }
    }
}