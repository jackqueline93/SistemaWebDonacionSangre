using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace DonacionSangre.Infrastructure.Core
{
    public class ApiResult
    {
        public ApiResult()
        {
            Message = string.Empty;
        }

        public ApiResult(int operationCode, object data = null)
        {
            OperationCode = operationCode;
            Data = data;
        }

        public ApiResult(string message, int operationCode)
        {
            Message = message;
            OperationCode = operationCode;
        }

        public ApiResult(string message, int operationCode, object data = null)
        {
            Message = message;
            OperationCode = operationCode;
            Data = data;
        }

        public object Data { get; set; }
        public string Message { get; set; }
        public int OperationCode { get; set; }
        public string TypeMessage
        {
            get
            {
                switch (OperationCode)
                {
                    case (int)HttpStatusCode.OK:
                        return "success";
                    case 900:
                        return "info";
                    case (int)HttpStatusCode.InternalServerError:
                        return "error";
                    default:
                        return null;
                }
            }
        }
    }
}
