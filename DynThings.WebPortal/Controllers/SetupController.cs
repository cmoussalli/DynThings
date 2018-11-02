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
using DynThings.Data.Repositories;
using DynThings.WebPortal;
using DynThingsCentral.WebAPI.Client;
using DynThingsCentral.WebAPI.Models;
using ResultInfo;

namespace DynThings.WebPortal.Controllers
{
    public class SetupController : Controller
    {

        CentralClient client = new CentralClient();

        // GET: Setup
        public ActionResult Index()
        {
            try
            {
                UnitOfWork_Repositories uof_repos = new UnitOfWork_Repositories();
                if (Config.PlatformTitle != "")
                {
                    //string url = FullyQualifiedApplicationPath();
                    //APIHostStatistics apiHostStatistics = new APIHostStatistics();
                    //apiHostStatistics.DeploymentDate = Config.DeploymentTimeStamp.ToShortTimeString();
                    //apiHostStatistics.DevicesCount = uof_repos.repoDevices.GetCount();
                    //apiHostStatistics.EndpointsCount = uof_repos.repoEndpoints.GetCount();
                    //apiHostStatistics.LocationsCount = uof_repos.repoLocations.GetCount();
                    //apiHostStatistics.MotherboardSN = "";
                    //apiHostStatistics.PlatformIdentifier = Config.PlatformKey;
                    //apiHostStatistics.Release = float.Parse("0.01");
                    //apiHostStatistics.ServerMachineName = Server.MachineName;
                    //apiHostStatistics.ThingsCount = uof_repos.repoThings.GetCount();
                    //apiHostStatistics.Title = Config.PlatformTitle;
                    //apiHostStatistics.URL = Url.ToString();
                    //apiHostStatistics.UsersCount = uof_repos.repoDynUsers.GetCount();
                    //apiHostStatistics.ViewsCount = uof_repos.repoLocationViews.GetCount();


                    //await client.Statistics.SubmitHostStatistics(apiHostStatistics);

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
            Result res = Result.GenerateFailedResult("Binding Error");
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
            Result res = Result.GenerateFailedResult("Binding Error");
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
            Result res = Result.GenerateFailedResult("Binding Error");
            if (ModelState.IsValid)
            {
                Core.Config.Setup(config.Title, config.PublicAccess, config.PublicSignUp, config.TimeZone, config.DevelopmentMode);
                res = Result.GenerateOKResult("Saved");
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