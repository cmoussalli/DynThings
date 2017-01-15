using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DynThings.Data.Repositories;

namespace DynThings.WebPortal.Controllers
{
    public class NotificationsController : BaseController
    {
        UnitOfWork_Repositories uof_repos = new UnitOfWork_Repositories();

        // GET: Notifications
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult NotificationsModal()
        {
            return View("_NotificationsModal");
        }
    }
}