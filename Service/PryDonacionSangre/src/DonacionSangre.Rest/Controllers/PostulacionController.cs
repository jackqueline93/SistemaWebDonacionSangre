using DonacionSangre.BusinessServices;
using DonacionSangre.Infrastructure.Rest;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
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

    }
}
