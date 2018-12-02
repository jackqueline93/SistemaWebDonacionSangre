using DonacionSangre.BusinessEntity;
using DonacionSangre.BusinessServices;
using DonacionSangre.Infrastructure.Core;
using DonacionSangre.Infrastructure.Core.Function;
using DonacionSangre.Infrastructure.Rest;
using System.Collections.Generic;
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

        [Authorize]
        [HttpPost]
        [Route("donante")]
        public IHttpActionResult RegistrarDonante(UsuarioBE entidad)
        {
            var idUsuario = GetIdUser();
            usuarioBL.RegistrarDonante(idUsuario, entidad);
            return Ok(new ApiResult() { OperationCode = HttpStatusCode.OK.GetHashCode() });
        }

        [Authorize]
        [HttpPost]
        [Route("donante/cuestionario")]
        public IHttpActionResult RegistrarCuestionarioDonante(IEnumerable<FormularioBE> formulario)
        {
            var idUsuario = GetIdUser();
            usuarioBL.RegistrarCuestionarioDonante(formulario, idUsuario);
            return Ok(new ApiResult() { OperationCode = HttpStatusCode.OK.GetHashCode() });
        }
    }
}