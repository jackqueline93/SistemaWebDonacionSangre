using DonacionSangre.BusinessEntity;
using DonacionSangre.BusinessServices;
using DonacionSangre.Infrastructure.Core;
using DonacionSangre.Infrastructure.Rest;
using System.Net;
using System.Web.Http;

namespace DonacionSangre.Rest.Controllers
{
    [RoutePrefix("api/avisos")]
    public class AvisoController : BaseApiController
    {
        private readonly IAvisoBL avisoBL;
        public AvisoController()
        {
            avisoBL = new AvisoBL();
        }

        [Authorize]
        [HttpGet]
        [Route("usuario")]
        public IHttpActionResult ObtenerAvisoPorUsuario()
        {
            var idUsuario = GetIdUser();
            var lista = avisoBL.ObtenerAvisoPorUsuario(idUsuario);
            return Ok(new ApiResult() { Data = lista, OperationCode = HttpStatusCode.OK.GetHashCode() });
        }

        [Authorize]
        [HttpPost]
        [Route("usuario")]
        public IHttpActionResult Registrar(AvisoBE avisoBE)
        {
            avisoBE.IdUsuarioSolicitante = GetIdUser();
            avisoBL.Registrar(avisoBE);
            return Ok(new ApiResult() { OperationCode = HttpStatusCode.OK.GetHashCode() });
        }
    }
}
