using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DynThings.Core;
using DynThings.Data.Models;
using DynThings.Data.Repositories;

namespace DynThings.WebPortal.Controllers
{
    public class UserNotificationsController : BaseController
    {
        // GET: UserNotifications
        public ActionResult Index()
        {
            return View();
        }

        public PartialViewResult GetUnread(long lastRecievedID)
        {
            List<UserNotification> notis = UnitOfWork_Repositories.repoUserNotification.GetUnreadNotifications(currentUser.Id, lastRecievedID);
            return PartialView("_List",notis);
        }

        #region Set Notification as Unread
        [HttpPost]
        public ActionResult SetNotificationAsRead(long id)
        {
            ResultInfo.Result res = ResultInfo.GetResultByID(1);
            if (ModelState.IsValid)
            {
                res = UnitOfWork_Repositories.repoUserNotification.SetNotificationAsRead(id);
                return Json(res);
            }
            return Json(res);
        }
        #endregion

    }
}