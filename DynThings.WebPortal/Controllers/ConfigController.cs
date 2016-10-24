using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DynThings.Data.Models;
using DynThings.Data.Repositories;
using DynThings.Core;

namespace DynThings.WebPortal.Controllers
{
    [Authorize(Roles = "Admin")]
    public class ConfigController : Controller
    {

        // GET: Config
        public ActionResult Index()
        {
            DynSetting config = UnitOfWork_Repositories.repoDynSettings.GetConfig();
            return View("Index", config);
        }


        public PartialViewResult MainPV()
        {
            DynSetting config = UnitOfWork_Repositories.repoDynSettings.GetConfig();
            return PartialView("_Main", config);
        }


        #region GridsPV
        [HttpGet]
        public PartialViewResult GridsPV()
        {
            DynSetting config = UnitOfWork_Repositories.repoDynSettings.GetConfig();
            ViewBag.DefaultRecordsPerMaster = new SelectList(StaticMenus.GetGridRowsCount(),config.DefaultRecordsPerMaster.ToString());
            ViewBag.DefaultRecordsPerChild = new SelectList(StaticMenus.GetGridRowsCount(), config.DefaultRecordsPerChild.ToString());
            return PartialView("_Grids", config);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult GridsPV([Bind(Include = "DefaultRecordsPerMaster,DefaultRecordsPerChild")] DynSetting config)
        {
            ResultInfo.Result res = ResultInfo.GetResultByID(1);
            if (ModelState.IsValid)
            {
                res =  UnitOfWork_Repositories.repoDynSettings.SetGridRowsCount(config.DefaultRecordsPerMaster, config.DefaultRecordsPerChild);
                return Json(res);
            }
            return Json(res);
        }
        #endregion

        #region DevModePV
        [HttpGet]
        public PartialViewResult DevModePV()
        {
            DynSetting config = UnitOfWork_Repositories.repoDynSettings.GetConfig();
            return PartialView("_DevMode", config);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult DevModePV([Bind(Include = "DevelopmentMode")] DynSetting config)
        {
            ResultInfo.Result res = ResultInfo.GetResultByID(1);
            if (ModelState.IsValid)
            {
                res = UnitOfWork_Repositories.repoDynSettings.SetDevelopmentMode(config.DevelopmentMode);
                return Json(res);
            }
            return Json(res);
        }
        #endregion

        #region ResetPV
        [HttpGet]
        public PartialViewResult ResetPV()
        {
            DynSetting config = UnitOfWork_Repositories.repoDynSettings.GetConfig();
            return PartialView("_Reset", config);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ResetPV([Bind(Include = "PlatformKey")] DynSetting config)
        {
            ResultInfo.Result res = ResultInfo.GetResultByID(1);
            if (ModelState.IsValid)
            {
                res = UnitOfWork_Repositories.repoDynSettings.ResetPlatform();
                return Json(res);
            }
            return Json(res);
        }
        #endregion

    }
}