using System;

namespace DonacionSangre.Infrastructure.Core.ExceptionHandling
{
    public class ErrorDataResponse
    {
        public string Message { get; set; }
        public string ErrorReference { get; set; }
        public DateTime DateTime { get; set; }
        public string StackTrace { get; set; }
        public Exception InnerException { get; set; }
    }
}
