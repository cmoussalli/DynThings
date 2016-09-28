using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DynThings.Core;
using System.Data.SqlClient;
using System.Configuration;
using System.Reflection;
using System.Web.Configuration;

namespace DynThings.WebPortal.Controllers
{
    public class SetupController : Controller
    {
        // GET: Setup
        public ActionResult Index()
        {
            //if (ValidateUserPermissions(false, false) == false)
            //{
            //    return RedirectToAction("Login", "Account");
            //}
            return View();
        }

        #region Welcome
        public PartialViewResult GetWelcomePV()
        {
            return PartialView("_Welcome");
        }
        #endregion

        #region Database
        [HttpGet]
        public PartialViewResult DatabaseConfigPV()
        {
            SetupModels.DatabaseSetup dbMdl = Core.Database.DatabaseConnectionSetup;
            return PartialView("_Database", dbMdl);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult DatabaseConfigPV([Bind(Include = "Server,DatabaseName,User,Password")] Core.SetupModels.DatabaseSetup dbSetup)
        {
            ResultInfo.Result res = ResultInfo.GenerateErrorResult("Binding Error");
            if (ModelState.IsValid)
            {
                res = Core.Database.SetDatabaseConnection(dbSetup);
                return Json(res);
            }
            return Json(res);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult DatabaseConfigTest([Bind(Include = "Server,DatabaseName,User,Password")] Core.SetupModels.DatabaseSetup dbSetup)
        {
            ResultInfo.Result res = ResultInfo.GenerateErrorResult("Binding Error");
            if (ModelState.IsValid)
            {
                res = Core.Database.TestDatabaseConnection(dbSetup);
                return Json(res);
            }
            return Json(res);
        }

        #endregion

        #region Config
        [HttpGet]
        public PartialViewResult PlatformConfigPV()
        {
            ViewBag.TimeZone = new SelectList(StaticMenus.GetRegionalTimeOptions(), 0);
            return PartialView("_Config");
        }
        #endregion

        #region Publish
        [HttpGet]
        public PartialViewResult PublishPV()
        {
            return PartialView("_Publish");
        }
        #endregion


    }
}