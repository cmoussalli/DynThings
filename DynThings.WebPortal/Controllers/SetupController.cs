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
using DynThingsCentral.WebAPI.Client;
using DynThings.Data.Repositories;
using DynThings.WebPortal;

namespace DynThings.WebPortal.Controllers
{
    public class SetupController : Controller
    {

        // GET: Setup
        public ActionResult Index()
        {
            try
            {
                UnitOfWork_Repositories uof_repos = new UnitOfWork_Repositories();
                if (Config.PlatformTitle != "")
                {
                    string url = FullyQualifiedApplicationPath();
                    CentralClient.Statistics.SubmitStatistics(Config.PlatformKey
                                , Config.PlatformTitle
                                , Config.DeploymentTimeStamp
                                , ""
                                , float.Parse("0.01")
                                , url
                                , uof_repos.repoLocationViews.GetCount()
                                , uof_repos.repoLocations.GetCount()
                                , uof_repos.repoThings.GetCount()
                                , uof_repos.repoDevices.GetCount()
                                , uof_repos.repoEndpoints.GetCount()
                                , uof_repos.repoDynUsers.GetCount()
                                , Server.MachineName
                                , ""
                                , ""
                                , 0
                                );

                    return View("complete");
                }
            }
            catch
            {

            }
            return View();
        }

        public string FullyQualifiedApplicationPath()
        {
            //Return variable declaration
            var appPath = string.Empty;

            //Getting the current context of HTTP request
            var context = HttpContext;

            //Checking the current context content
            if (context != null)
            {
                //Formatting the fully qualified website url/name
                appPath = string.Format("{0}://{1}{2}{3}",
                                        context.Request.Url.Scheme,
                                        context.Request.Url.Host,
                                        context.Request.Url.Port == 80
                                            ? string.Empty
                                            : ":" + context.Request.Url.Port,
                                        context.Request.ApplicationPath);
            }

            if (!appPath.EndsWith("/"))
                appPath += "/";

            return appPath;

        }

        public ActionResult Complete()
        {

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
            SetupModels.DatabaseSetup dbMdl = new SetupModels.DatabaseSetup();

            try
            { 
                dbMdl = Core.Database.DatabaseConnectionSetup;
            }
            catch
            {
            }
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
        //[ValidateAntiForgeryToken]
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
            SetupModels.PlatformConfig conf = new SetupModels.PlatformConfig();
            try
            {
            UnitOfWork_Repositories uof_repos = new UnitOfWork_Repositories();
            conf = uof_repos.repoDynSettings.GetSetupPlatformConfig();
            ViewBag.TimeZone = new SelectList(StaticMenus.GetRegionalTimeOptions(), conf.TimeZone);
            }
            catch
            {
                ViewBag.TimeZone = new SelectList(StaticMenus.GetRegionalTimeOptions(), 0);
            }
            return PartialView("_Config", conf);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult PlatformConfigPV([Bind(Include = "Title,DevelopmentMode,PublicAccess,PublicSignUp,TimeZone")] Core.SetupModels.PlatformConfig config)
        {
            ResultInfo.Result res = ResultInfo.GenerateErrorResult("Binding Error");
            if (ModelState.IsValid)
            {
                Core.Config.Setup(config.Title, config.PublicAccess, config.PublicSignUp, config.TimeZone, config.DevelopmentMode);
                res = ResultInfo.GenerateOKResult("Saved");
                return Json(res);
            }
            return Json(res);
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