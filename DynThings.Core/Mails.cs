using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace DynThings.Core
{
    public static class Mails
    {
        public static ResultInfo.Result SendMail(MailsConfig mailsConfig, string to, string subject, string body)
        {
            ResultInfo.Result result = ResultInfo.GenerateErrorResult("");
            try
            {
                MailMessage mail = new MailMessage(mailsConfig.Sender, to);
                SmtpClient client = new SmtpClient();
                client.Port = mailsConfig.Port;
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                client.UseDefaultCredentials = false;
                client.Host = mailsConfig.Host;
                mail.IsBodyHtml = false;
                mail.Subject = subject;
                mail.Body = body;
                client.Send(mail);
                result = ResultInfo.GenerateOKResult();
            }
            catch (Exception ex)
            {
                result = ResultInfo.GenerateErrorResult("Mail send Failed", ex.Message);
            }
            return result;
        }

        public class MailsConfig
        {
            public string Host { get; set; }
            public int Port { get; set; }
            public string Sender { get; set; }
        }

    }
}
