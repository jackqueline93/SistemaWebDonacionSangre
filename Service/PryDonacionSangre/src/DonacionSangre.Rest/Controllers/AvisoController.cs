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
        [Route("")]
        public IHttpActionResult ObtenerAvisoPorUsuario()
        {
            var idUsuario = GetIdUser();
            var lista = avisoBL.ObtenerAvisoPorUsuario(idUsuario);
            return Ok(new ApiResult() { Data = lista, OperationCode = HttpStatusCode.OK.GetHashCode() });
        }

        [Authorize]
        [HttpGet]
        [Route("{id}")]
        public IHttpActionResult ObtenerAvisoPorId(int id)
        {
            var idUsuario = GetIdUser();
            var entidad = avisoBL.ObtenerAvisoPorId(id, idUsuario);
            return Ok(new ApiResult() { Data = entidad, OperationCode = HttpStatusCode.OK.GetHashCode() });
        }

        [Authorize]
        [HttpPost]
        [Route("")]
        public IHttpActionResult Registrar(AvisoBE avisoBE)
        {
            avisoBE.IdUsuarioSolicitante = GetIdUser();
            var id = avisoBL.Registrar(avisoBE);
            return Ok(new ApiResult() { Data = new { IdAviso = id }, OperationCode = HttpStatusCode.OK.GetHashCode() });
        }

        [Authorize]
        [HttpPut]
        [Route("{id}")]
        public IHttpActionResult Modificar(int id, AvisoBE avisoBE)
        {
            avisoBL.Modificar(id, avisoBE);
            return Ok(new ApiResult() { OperationCode = HttpStatusCode.OK.GetHashCode() });
        }

        [Authorize]
        [HttpDelete]
        [Route("{id}")]
        public IHttpActionResult Eliminar(int id)
        {
            avisoBL.Eliminar(id);
            return Ok(new ApiResult() { OperationCode = HttpStatusCode.OK.GetHashCode() });
        }

        [Authorize]
        [HttpGet]
        [Route("{id}/postulante")]
        public IHttpActionResult ListarPostulante(int id)
        {
            var entidad = avisoBL.ListarPostulante(id);
            return Ok(new ApiResult() { Data = entidad, OperationCode = HttpStatusCode.OK.GetHashCode() });
        }

        [Authorize]
        [HttpGet]
        [Route("{idUsuarioDonante}/donante")]
        public IHttpActionResult ListarAvisosPorDonante(int idUsuarioDonante)
        {
            var entidad = avisoBL.ListarAvisosPorDonante(idUsuarioDonante);
            return Ok(new ApiResult() { Data = entidad, OperationCode = HttpStatusCode.OK.GetHashCode() });
        }

    }
}
