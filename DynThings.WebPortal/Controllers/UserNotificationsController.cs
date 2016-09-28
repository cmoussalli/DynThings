using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DynThings.WebPortal.Controllers
{
    public class UserNotificationsController : Controller
    {
        // GET: UserNotifications
        public ActionResult Index()
        {
            return View();
        }
    }
}