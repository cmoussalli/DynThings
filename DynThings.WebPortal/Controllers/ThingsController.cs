using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using PagedList;
using System.Web.Mvc;
using DynThings.Core;
using DynThings.Data.Models;
using DynThings.Data.Repositories;
using DynThings.Data.Reports;
using DynThings.Data.Models.ReportsModels;
using DynHighCharts;

namespace DynThings.WebPortal.Controllers
{

    public class ThingsController : BaseController
    {
        UnitOfWork_Repositories uof_repos = new UnitOfWork_Repositories();
        UnitOfWork_Reports uof_reports = new UnitOfWork_Reports();

        #region ActionResult: Views
        public ActionResult Index()
        {
            if (ValidateUserPermissions(false, false) == false)
            {
                return RedirectToAction("Login", "Account");
            }
            return View();
        }


        public ActionResult Details(long id)
        {
            if (ValidateUserPermissions(false, false) == false)
            {
                return RedirectToAction("Login", "Account");
            }
            Thing Thing = uof_repos.repoThings.Find(id);
            return View(Thing);
        }

        #endregion

        #region PartialViewResult: Partial Views

        #region DetailsPV
        public PartialViewResult DetailsPV(long id)
        {
            Thing Thing = uof_repos.repoThings.Find(id);
            return PartialView("_Details_Main", Thing);
        }

        #endregion

        #region ListPV
        [HttpGet]
        public PartialViewResult ListPV(string searchfor = null, int page = 1, int recordsperpage = 0)
        {
            PagedList.IPagedList tngs = uof_repos.repoThings.GetPagedList(searchfor, page, Helpers.Configs.validateRecordsPerMaster(recordsperpage));
            return PartialView("_List", tngs);
        }
        #endregion

        #region AddPV
        [HttpGet]
        public PartialViewResult AddPV()
        {
            ViewBag.UTC_Diff = new SelectList(StaticMenus.GetRegionalTimeOptions(), Config.App_TimeZone);
            ViewBag.CategoryID = new SelectList(uof_repos.repoThingCategorys.GetList(), "ID", "Title", 0);
            return PartialView("_Add");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddPV([Bind(Include = "Title,CategoryID,UTC_Diff")] Thing Thing)
        {
            ResultInfo.Result res = ResultInfo.GetResultByID(1);
            if (ModelState.IsValid)
            {
                res = uof_repos.repoThings.Add(Thing.Title, Thing.CategoryID, Thing.UTC_Diff, currentUser.Id);
                return Json(res);
            }
            return Json(res);
        }
        #endregion

        #region EditPV
        [HttpGet]
        public PartialViewResult EditPV(long id)
        {
            Thing Thing = uof_repos.repoThings.Find(id);
            ViewBag.UTC_Diff = new SelectList(StaticMenus.GetRegionalTimeOptions(), Thing.UTC_Diff);
            ViewBag.CategoryID = new SelectList(uof_repos.repoThingCategorys.GetList(), "ID", "Title", Thing.CategoryID);
            return PartialView("_Edit", Thing);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditPV([Bind(Include = "ID,Title,CategoryID,UTC_Diff")] Thing Thing)
        {
            ResultInfo.Result res = ResultInfo.GetResultByID(1);
            if (ModelState.IsValid)
            {
                res = uof_repos.repoThings.Edit(Thing.ID, Thing.Title, Thing.CategoryID, Thing.UTC_Diff);
                return Json(res);
            }
            return Json(res);
        }
        #endregion

        #region DeletePV
        [HttpGet]
        public PartialViewResult DeletePV(long id)
        {
            if (!User.IsInRole("Admin"))
            {
                ResultInfo.Result rm = Core.ResultInfo.GetResultByID(1);
                return PartialView("_PVResult", rm);
            }
            Thing Thing = uof_repos.repoThings.Find(id);
            return PartialView("_Delete", Thing);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult DeletePV([Bind(Include = "ID,Title")] Thing Thing)
        {
            ResultInfo.Result res = ResultInfo.GetResultByID(1);
            if (ModelState.IsValid)
            {
                res = uof_repos.repoThings.Delete(Thing.ID);
                return Json(res);
            }
            return Json(res);
        }
        #endregion

        #endregion


        #region LookUP
        #region Lookup Main Div
        [HttpGet]
        public PartialViewResult LookupPV(string searchfor = null, int page = 1, int recordsperpage = 0)
        {
            PagedList.IPagedList ends = uof_repos.repoThings.GetPagedList("", 1, 10);
            return PartialView("lookup/Index", ends);
        }
        #endregion
        #region Lookup List Div
        [HttpGet]
        public PartialViewResult LookupListPV(string searchfor = null, int page = 1, int recordsperpage = 0)
        {
            PagedList.IPagedList ends = uof_repos.repoThings.GetPagedList(searchfor, page, Config.DefaultRecordsPerChild);
            return PartialView("lookup/List", ends);
        }
        #endregion
        #endregion


        #region Reports
        [HttpGet]
        public ActionResult Rpt_Minute(long ThingID, long endPointTypeID)
        {
            Chart chrt = uof_reports.rptThings.IOs_Minute(ThingID, endPointTypeID);
            return PartialView("Reports/Charts/InputValues_BasicLine", chrt);
        }

        [HttpGet]
        public ActionResult Rpt_Hour(long ThingID, long endPointTypeID)
        {
            Chart chrt = uof_reports.rptThings.IOs_Hour(ThingID, endPointTypeID);
            return PartialView("Reports/Charts/InputValues_BasicLine", chrt);
        }

        [HttpGet]
        public ActionResult Rpt_Day(long ThingID, long endPointTypeID)
        {
            Chart chrt = uof_reports.rptThings.IOs_Days(ThingID, endPointTypeID);
            return PartialView("Reports/Charts/InputValues_BasicLine", chrt);
        }

        [HttpGet]
        public ActionResult Rpt_Month(long ThingID, long endPointTypeID,long year)
        {
            Chart chrt = uof_reports.rptThings.IOs_Months(ThingID, endPointTypeID,year);
            return PartialView("Reports/Charts/InputValues_BasicLine", chrt);
        }


        [HttpGet]
        public ActionResult Rpt_IOsHistory(long ThingID, long endPointTypeID, DateTime fromDate, DateTime toDate, int page = 1, int recordsperpage = 0)
        {
            IPagedList IOs = uof_repos.repoThings.GetThingEndIOs(ThingID, endPointTypeID, fromDate, toDate.AddDays(1), page, Helpers.Configs.validateRecordsPerMaster(recordsperpage));
            return PartialView("Reports/Grids/HistoryIOs", IOs);


            #endregion


        }
    }
}
