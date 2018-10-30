using System;
using System.Net;
using System.Runtime.Serialization;

namespace DonacionSangre.Infrastructure.Core.ExceptionHandling
{
    [Serializable]
    public class ApiBusinessException : ApplicationException
    {
        public ApiBusinessException()
        {

        }

        public ApiBusinessException(string message)
            : base(message)
        {

        }

        public ApiBusinessException(string format, params object[] args)
            : base(string.Format(format, args))
        {

        }
        public ApiBusinessException(string message, Exception exception)
            : base(message, exception)
        {

        }

    }
}
