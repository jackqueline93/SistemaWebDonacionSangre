using DonacionSangre.Infrastructure.Core;
using DonacionSangre.Infrastructure.Core.ExceptionHandling;
using System;
using System.Data.SqlClient;
using System.Net;
using System.Net.Http;
using System.Threading;
using System.Threading.Tasks;
using System.Web.Http;

namespace DonacionSangre.Rest.Result
{
    public class ApiExceptionResult : IHttpActionResult
    {
        private HttpRequestMessage _request;
        private Exception _exception;
        private HttpResponseMessage _response;
        private ApiResult _result;

        public ApiExceptionResult(HttpRequestMessage request, Exception exception)
        {
            this._request = request;
            this._exception = exception;
        }

        public Task<HttpResponseMessage> ExecuteAsync(CancellationToken cancellationToken)
        {
            if (this._exception is NotImplementedException)
            {
                _result = GetApiResult();
                this._response = this._request.CreateResponse(HttpStatusCode.NotImplemented, _result);
            }
            else if (this._exception is ApiBusinessException)
            {
                _result = GetApiResult(false);
                _result.OperationCode = 900;
                this._response = this._request.CreateResponse(HttpStatusCode.OK, _result);
            }
            else if (this._exception is SqlException)
            {
                _result = GetApiResult();
                this._response = this._request.CreateResponse(HttpStatusCode.InternalServerError, _result);
            }
            else if (this._exception is Exception)
            {
                _result = GetApiResult();
                this._response = this._request.CreateResponse(HttpStatusCode.InternalServerError, _result);
            }
            else
            {
                _result = GetApiResult();
                this._response = this._request.CreateResponse(HttpStatusCode.InternalServerError, _result);
            }

            this._response.RequestMessage = this._request;

            return Task.FromResult(_response);
        }

        private ApiResult GetApiResult(bool withError = true)
        {

            var errorDataModel = new ErrorDataResponse
            {
                Message = _exception.Message,
                InnerException = _exception.InnerException,
                StackTrace = _exception.StackTrace,
                ErrorReference = _exception.Data["ErrorReference"] != null ? _exception.Data["ErrorReference"].ToString() : string.Empty,
                DateTime = DateTime.UtcNow
            };

            _result = new ApiResult()
            {
                Data = withError ? errorDataModel : null,
                Message = _exception.Message ?? "Api: Error interno",
                OperationCode = (int)HttpStatusCode.InternalServerError
            };
            return _result;
        }
    }
}