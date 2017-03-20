using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DynThings.Core;

namespace DynThings.Services
{
    public class MailServices
    {
        public void sendMail(string to,string subject,string body)
        {
            Mails.MailsConfig config = new Mails.MailsConfig();
            config = Config.MailsConfig;
            Core.Mails.SendMail(config,to,subject,body);
        }
    }
}
