using System;
using System.Globalization;
using System.Net.Mail;
using System.Text;

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

        public static void SendMail(string mailTo, string mailCc, string subject, string mailBody)
        {
            SendMail(mailTo, mailCc, "info@donacionsangre.com", "Donación sangre", subject, mailBody);
        }

        public static void SendMail(string mailTo, string mailCc, string mailFrom, string mailFromDisplay, string subject, string mailBody)
        {
            string[] stringSeparators = new string[] { ",", ";" };
            var host = string.Empty;
            var credentialUser = string.Empty;
            var credentialPassword = string.Empty;
            var port = 0;

            using (var mail = new MailMessage())
            {
                mail.Body = mailBody;
                mail.IsBodyHtml = true;

                var vTo = mailTo.Split(stringSeparators, StringSplitOptions.RemoveEmptyEntries);
                foreach (var item in vTo)
                    mail.To.Add(item.Trim());

                if (!string.IsNullOrEmpty(mailCc))
                {
                    var vcc = mailCc.Split(stringSeparators, StringSplitOptions.RemoveEmptyEntries);
                    foreach (var item in vcc)
                        mail.CC.Add(item.Trim());
                }

                mail.From = new MailAddress(mailFrom, mailFromDisplay, Encoding.UTF8);
                mail.Subject = subject;
                mail.SubjectEncoding = Encoding.UTF8;
                mail.Priority = MailPriority.Normal;

                using (var smtp = new SmtpClient())
                {
                    //smtp.EnableSsl = true;
                    smtp.Send(mail);
                }
            }
        }
    }
}
