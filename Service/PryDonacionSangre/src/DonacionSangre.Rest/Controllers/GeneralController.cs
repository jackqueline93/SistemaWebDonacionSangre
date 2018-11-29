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
        public IHttpActionResult ListarTipoSangre()
        {
            var lista = generalBL.ListarTipoSangre();
            return Ok(new ApiResult() { Data = lista, OperationCode = HttpStatusCode.OK.GetHashCode() });
        }

        [HttpGet]
        [Route("departamento")]
        public IHttpActionResult ListarDepartamento()
        {
            var lista = generalBL.ListarDepartamento();
            return Ok(new ApiResult() { Data = lista, OperationCode = HttpStatusCode.OK.GetHashCode() });
        }

        [HttpGet]
        [Route("ciudad/{idDepartamento}")]
        public IHttpActionResult ListarCiudad(int idDepartamento)
        {
            var lista = generalBL.ListarCiudad(idDepartamento);
            return Ok(new ApiResult() { Data = lista, OperationCode = HttpStatusCode.OK.GetHashCode() });
        }
    }
}
