using DonacionSangre.BusinessEntity;
using DonacionSangre.BusinessServices;
using DonacionSangre.Infrastructure.Core;
using DonacionSangre.Infrastructure.Rest;
using System.Net;
using System.Web.Http;

namespace DonacionSangre.Rest.Controllers
{
    [RoutePrefix("api/usuarios")]
    public class UsuarioController : BaseApiController
    {
        private readonly IUsuarioBL usuarioBL;
        public UsuarioController()
        {
            usuarioBL = new UsuarioBL();
        }

        [HttpPost]
        [Route("")]
        public IHttpActionResult Registar(UsuarioBE entidad)
        {
            usuarioBL.Registrar(entidad);
            return Ok(new ApiResult() { OperationCode = HttpStatusCode.OK.GetHashCode() });
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