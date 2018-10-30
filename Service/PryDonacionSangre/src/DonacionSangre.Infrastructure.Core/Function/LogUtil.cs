
using NLog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DonacionSangre.Infrastructure.Core.Function
{
    public static class LogUtil
    {

        private static readonly Logger _logger;

        private const string _defaultLogger = "TaskLogger";

        static LogUtil()
        {
            // LogManager.Configuration = new XmlLoggingConfiguration(HttpContext.Current.Server.MapPath("~/ConfigLog/NLog.config"));
            _logger = LogManager.GetLogger(_defaultLogger); // LogManager.GetCurrentClassLogger(); //LogManager.GetLogger(_defaultLogger) ?? LogManager.GetCurrentClassLogger();
        }


        /// <summary>
        /// Metodo escribe un mensaje el archivo LOG tipo DEBUG
        /// </summary>
        /// <param name="message">Mensaje</param>       
        public static void Debug(string message)
        {
            if (!_logger.IsDebugEnabled) return;
            _logger.Debug(message);
        }

        /// <summary>
        /// Metodo escribe un mensaje el archivo LOG tipo INFORMATIVO
        /// </summary>
        /// <param name="message">Mensaje</param>
        public static void Info(string message)
        {
            if (!_logger.IsInfoEnabled) return;
            _logger.Info(message);
        }

        /// <summary>
        /// Metodo escribe un mensaje el archivo LOG tipo ADVERTENCIA
        /// </summary>
        /// <param name="message">Mensaje</param>
        public static void Warn(string message)
        {
            if (!_logger.IsWarnEnabled) return;
            _logger.Warn(message);
        }

        /// <summary>
        /// Metodo escribe un mensaje el archivo LOG tipo ERROR, con la descripcion de error adicional
        /// </summary>
        /// <param name="error">Mensaje de error</param>
        /// <param name="exception">Exception</param>
        public static void Error(string error, Exception exception = null)
        {
            if (!_logger.IsErrorEnabled) return;
            _logger.Error(error, exception);
        }

        public static void Error(string message)
        {
            if (!_logger.IsErrorEnabled) return;
            _logger.Error(message);
        }

        public static void Error(string message, params object[] args)
        {
            if (!_logger.IsErrorEnabled) return;
            _logger.Error(message, args);
        }

        /// <summary>
        /// Metodo escribe un mensaje el archivo LOG tipo FATAL
        /// </summary>
        /// <param name="message">Mensaje</param>
        public static void Fatal(string message)
        {
            if (!_logger.IsFatalEnabled) return;
            _logger.Warn(message);
        }

        /// <summary>
        /// Metodo escribe un mensaje el archivo LOG tipo SEGUIMIENTO
        /// </summary>
        /// <param name="message">Mensaje</param>
        public static void Trace(string message)
        {
            if (!_logger.IsTraceEnabled) return;
            _logger.Trace(message);
        }

        public static void Trace(string message, params object[] args)
        {
            if (!_logger.IsTraceEnabled) return;
            _logger.Trace(message, args);
        }
    }
}
