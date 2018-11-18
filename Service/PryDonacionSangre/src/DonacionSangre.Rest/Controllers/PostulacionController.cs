﻿using DonacionSangre.BusinessEntity;
using DonacionSangre.BusinessServices;
using DonacionSangre.Infrastructure.Core;
using DonacionSangre.Infrastructure.Rest;
using System.Net;
using System.Web.Http;

namespace DonacionSangre.Rest.Controllers
{
    [RoutePrefix("api/postulaciones")]
    public class PostulacionController : BaseApiController
    {
        private readonly IPostulacionBL postulacionBL;
        public PostulacionController()
        {
            postulacionBL = new PostulacionBL();
        }

        [Authorize]
        [HttpGet]
        [Route("{idTipoSangre?}")]
        public IHttpActionResult BuscarAviso(int idTipoSangre = 0)
        {
            var lista = postulacionBL.BuscarAviso(idTipoSangre);
            return Ok(new ApiResult() { Data = lista, OperationCode = HttpStatusCode.OK.GetHashCode() });
        }

        [Authorize]
        [HttpPost]
        [Route("")]
        public IHttpActionResult Registrar(PostulacionBE entidad)
        {
            entidad.IdUsuarioDonante = GetIdUser();
            var id = postulacionBL.Registrar(entidad);
            return Ok(new ApiResult() { Data = new { idPostulacion = id }, OperationCode = HttpStatusCode.OK.GetHashCode() });
        }

    }
}
