using DonacionSangre.Rest.Result;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http.ExceptionHandling;

namespace DonacionSangre.Rest.HandlerTrace
{
    public class ApiExceptionHandler : IExceptionHandler
    {
        public async Task HandleAsync(ExceptionHandlerContext context, System.Threading.CancellationToken cancellationToken)
        {
            await Task.Run(() =>
            {
                context.Result = new ApiExceptionResult(context.Request, context.Exception);
            }, cancellationToken);
        }
    }
}