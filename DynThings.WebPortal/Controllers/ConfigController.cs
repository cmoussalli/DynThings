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
    [Authorize]
    public class ConfigController : Controller
    {

        // GET: Config
        public ActionResult Index()
        {
            DynSetting config = UnitOfWork.repoDynSettings.GetConfig();
            return View();
        }


        public PartialViewResult MainPV()
        {
            DynSetting config = UnitOfWork.repoDynSettings.GetConfig();
            return PartialView("_Main", config);
        }


        #region EditPV
        [HttpGet]
        public PartialViewResult GridsPV()
        {
            DynSetting config = UnitOfWork.repoDynSettings.GetConfig();
            ViewBag.DefaultRecordsPerMaster = new SelectList(StaticMenus.GetGridRowsCount(),config.DefaultRecordsPerMaster.ToString());
            ViewBag.DefaultRecordsPerChild = new SelectList(StaticMenus.GetGridRowsCount(), config.DefaultRecordsPerChild.ToString());
            return PartialView("_Grids", config);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult GridsPV([Bind(Include = "DefaultRecordsPerMaster,DefaultRecordsPerChild")] DynSetting config)
        {
            ResultInfo.Result res = UnitOfWork.resultInfo.GetResultByID(1);
            if (ModelState.IsValid)
            {
                res =  UnitOfWork.repoDynSettings.SetGridRowsCount(config.DefaultRecordsPerMaster, config.DefaultRecordsPerChild);
                return Json(res);
            }
            return Json(res);
        }
        #endregion
    }
}