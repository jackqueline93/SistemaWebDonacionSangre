using System;
using System.Globalization;

namespace DonacionSangre.Infrastructure.Core.Function
{
    public static class ComunUtil
    {
        public static DateTime ConvertirFecha(string fecha)
        {
            return Convert.ToDateTime(fecha, new CultureInfo("es-ES"));
        }

        public static string ConvertirFecha(DateTime? fecha)
        {
            return fecha == null || fecha.Equals(DateTime.MinValue) ? string.Empty : fecha?.ToString("dd/MM/yyyy");
        }
    }
}
