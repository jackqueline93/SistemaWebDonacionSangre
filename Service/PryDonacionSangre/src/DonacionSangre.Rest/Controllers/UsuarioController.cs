using DonacionSangre.BusinessServices;
using System.Web.Http;

namespace DonacionSangre.Rest.Controllers
{
    [RoutePrefix("api/usuarios")]
    public class UsuarioController : ApiController
    {
        private readonly IUsuarioBL usuarioBL;
        public UsuarioController()
        {
            usuarioBL = new UsuarioBL();
        }

        [HttpGet]
        [Route("{idUsuario}")]
        public IHttpActionResult Obtener(int idUsuario)
        {
            var entidad = usuarioBL.Obtener(idUsuario);

            return Ok(entidad);
            //return Ok(new ApiResult() { Data = entidad, OperationCode = HttpStatusCode.OK.GetHashCode() });
        }
    }
}