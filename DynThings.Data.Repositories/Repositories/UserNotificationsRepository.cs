/////////////////////////////////////////////////////////////////
// Created by : Caesar Moussalli                               //
// TimeStamp  : 31-1-2016                                      //
// Content    : Handle Thing CRUD                             //
// Notes      :                                                //
/////////////////////////////////////////////////////////////////
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DynThings.Data.Models;
using DynThings.Data.Models.ViewModels;
using PagedList;
using DynThings.Core;
using ResultInfo;

namespace DynThings.Data.Repositories
{
    public class UserNotificationsRepository
    {
        #region Constructor
        public UserNotificationsRepository(DynThingsEntities dbSource)
        {
            db = dbSource;
        }

        #endregion

        #region props
        public DynThingsEntities db;
        #endregion

        #region Edit
        public ResultInfo.Result SetMailIsSent(long id)
        {
            try
            {
                UserNotification noti = db.UserNotifications.Find(id);
                noti.IsEmailSent = true;
                db.SaveChanges();
                return Result.GenerateOKResult("Saved",noti.ID.ToString());
            }
            catch
            {
                return Result.GenerateFailedResult();
            }
        }

        #endregion

        #region Get PagedList
        public IPagedList GetPagedList(string search, string userID, int pageNumber, int recordsPerPage)
        {
            IPagedList notis = db.UserNotifications
              .Where(e => search == null || e.Txt.Contains(search) && e.UserID == userID)
              .OrderByDescending(e => e.ID).ToList()
              .ToPagedList(pageNumber, recordsPerPage);
            return notis;
        }
        #endregion


        public List<UserNotification> GetUnreadNotifications( string userID, long lastReceivedID)
        {
            List<UserNotification> notis = db.UserNotifications
              .Where(e => e.ID > lastReceivedID && e.UserID == userID && e.IsRead < 2)
              .Take(20)
              .OrderByDescending(e => e.ID).ToList();

            return notis;
        }

        public List<UserNotification> GetUnseenNotifications(string userID, long lastReceivedID)
        {
            List<UserNotification> notis = db.UserNotifications
              .Where(e => e.ID > lastReceivedID && e.UserID == userID)
              .OrderByDescending(e => e.ID).ToList();

            return notis;
        }

        public ResultInfo.Result SetNotificationAsRead(long notificationID)
        {
            ResultInfo.Result res = Result.GenerateFailedResult("Error");
            try
            {
                UserNotification noti = db.UserNotifications.Find(notificationID);
                noti.IsRead = 2;
                db.SaveChanges();
                res = Result.GenerateOKResult();
            }
            catch (Exception ex)
            {
                res = Result.GenerateFailedResult(ex.Message);
            }
            return res;
        }

        public List<UserNotification> GetPendingEmails(int recordsCount)
        {
            List<UserNotification> result = db.UserNotifications.Where(n => n.IsEmailSent == false).Take(recordsCount).ToList();

            return result;
                
        }




    }
}
