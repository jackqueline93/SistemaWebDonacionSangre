using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DonacionSangre.Infrastructure.Core
{
    public class ApiResult
    {
        public ApiResult()
        {
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
        public string TypeMessage { get; }
    }
}
