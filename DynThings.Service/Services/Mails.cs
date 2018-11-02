using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DynThings.Core;
using DynThings.Data.Models;
using DynThings.Data.Repositories;
using ResultInfo;

namespace DynThings.Service
{
    public class Mails
    {

        Core.Mails.MailsConfig mailConfig = new Core.Mails.MailsConfig();
        UnitOfWork_Repositories uow = new UnitOfWork_Repositories();

        public Core.Mails.MailsConfig GetMailConfigs()
        {
            Core.Mails.MailsConfig result;
            result =  Core.Config.MailsConfig;
            return result;
        }

        public List<UserNotification> GetPendingMailsList(int recordsCount)
        {
            try
            {
                List<UserNotification> result = uow.repoUserNotification.GetPendingEmails(recordsCount);
            return result;
            }
            catch(Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public ResultInfo.Result SendPendingEmails(int maxPendingMailsCount)
        {
            Result result = Result.GenerateFailedResult();
            try
            {
                mailConfig = GetMailConfigs();
                List<UserNotification> pendingNotifications = GetPendingMailsList(maxPendingMailsCount);
                if (pendingNotifications.Count > 0)
                {
                    foreach (UserNotification noti in pendingNotifications)
                    {
                    Core.Mails.SendMail(mailConfig,noti.AspNetUser.Email,"Alert from DynThings",noti.Txt);
                        uow.repoUserNotification.SetMailIsSent(noti.ID);
                    }

                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }

            return result;
        }
    }
}
