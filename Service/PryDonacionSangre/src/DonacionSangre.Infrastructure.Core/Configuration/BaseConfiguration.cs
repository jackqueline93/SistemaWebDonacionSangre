
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DonacionSangre.Infrastructure.Core.Configuration
{
    public static class BaseConfiguration
    {
        public static string GetConfigurationString(string value)
        {
            return ConfigurationManager.AppSettings[value];
        }

        public static int GetConfigurationInt(string value)
        {
            return int.Parse(GetConfigurationString(value));
        }
    }
}
