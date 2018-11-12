using DonacionSangre.BusinessServices;
using DonacionSangre.Infrastructure.Core;
using DonacionSangre.Infrastructure.Rest;
using System.Net;
using System.Web.Http;

namespace DonacionSangre.Rest.Controllers
{
    [RoutePrefix("api/general")]
    public class GeneralController : BaseApiController
    {
        private readonly IGeneralBL generalBL;
        public GeneralController()
        {
            generalBL = new GeneralBL();
        }

        [HttpGet]
        [Route("tipoSangre")]
        public IHttpActionResult ObtenerTipoSangre()
        {
            var lista = generalBL.ObtenerTipoSangre();
            return Ok(new ApiResult() { Data = lista, OperationCode = HttpStatusCode.OK.GetHashCode() });
        }

        [HttpGet]
        [Route("departamento")]
        public IHttpActionResult ObtenerDepartamento()
        {
            var lista = generalBL.ObtenerDepartamento();
            return Ok(new ApiResult() { Data = lista, OperationCode = HttpStatusCode.OK.GetHashCode() });
        }
    }
}
