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
            Thing Thing = Data.Repositories.UnitOfWork_Repositories.repoThings.Find(id);
            return View(Thing);
        }

        #endregion

        #region PartialViewResult: Partial Views

        #region DetailsPV
        public PartialViewResult DetailsPV(long id)
        {
            Thing Thing = Data.Repositories.UnitOfWork_Repositories.repoThings.Find(id);
            return PartialView("_Details_Main", Thing);
        }

        #endregion

        #region ListPV
        [HttpGet]
        public PartialViewResult ListPV(string searchfor = null, int page = 1, int recordsperpage = 0)
        {
            PagedList.IPagedList tngs = Data.Repositories.UnitOfWork_Repositories.repoThings.GetPagedList(searchfor, page, Helpers.Configs.validateRecordsPerMaster(recordsperpage));
            return PartialView("_List", tngs);
        }
        #endregion

        #region AddPV
        [HttpGet]
        public PartialViewResult AddPV()
        {
            ViewBag.UTC_Diff = new SelectList(StaticMenus.GetRegionalTimeOptions(), Config.App_TimeZone);
            ViewBag.CategoryID = new SelectList(UnitOfWork_Repositories.repoThingCategorys.GetList(), "ID", "Title", 0);
            return PartialView("_Add");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddPV([Bind(Include = "Title,CategoryID,UTC_Diff")] Thing Thing)
        {
            ResultInfo.Result res = ResultInfo.GetResultByID(1);
            if (ModelState.IsValid)
            {
                res = UnitOfWork_Repositories.repoThings.Add(Thing.Title, Thing.CategoryID, Thing.UTC_Diff, currentUser.Id);
                return Json(res);
            }
            return Json(res);
        }
        #endregion

        #region EditPV
        [HttpGet]
        public PartialViewResult EditPV(long id)
        {
            Thing Thing = UnitOfWork_Repositories.repoThings.Find(id);
            ViewBag.UTC_Diff = new SelectList(StaticMenus.GetRegionalTimeOptions(), Thing.UTC_Diff);
            ViewBag.CategoryID = new SelectList(UnitOfWork_Repositories.repoThingCategorys.GetList(), "ID", "Title", Thing.CategoryID);
            return PartialView("_Edit", Thing);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditPV([Bind(Include = "ID,Title,CategoryID,UTC_Diff")] Thing Thing)
        {
            ResultInfo.Result res = ResultInfo.GetResultByID(1);
            if (ModelState.IsValid)
            {
                res = UnitOfWork_Repositories.repoThings.Edit(Thing.ID, Thing.Title, Thing.CategoryID, Thing.UTC_Diff);
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
            Thing Thing = UnitOfWork_Repositories.repoThings.Find(id);
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
                res = UnitOfWork_Repositories.repoThings.Delete(Thing.ID);
                return Json(res);
            }
            return Json(res);
        }
        #endregion


        //#region Thing History
        //[HttpGet]
        //public PartialViewResult GetPVThingHistory(long ThingID, int page = 1, int recordsperpage = 0)
        //{
        //    IPagedList IOs = Data.Repositories.UnitOfWork_Repositories.repoThingIOs.GetPagedList(ThingID, page, Helpers.Configs.validateRecordsPerChild(Config.DefaultRecordsPerChild));
        //    return PartialView("_Details_History", IOs);

        //}

        //#endregion

        //#region Thing Commands
        //[HttpGet]
        //public PartialViewResult ThingCommandsListByThingIDPV(string searchfor = null, long ThingID = 0, int page = 1, int recordsperpage = 0)
        //{
        //    PagedList.IPagedList cmds = Data.Repositories.UnitOfWork_Repositories.repoThingCommands.GetPagedListByThingID(searchfor, ThingID, page, Helpers.Configs.validateRecordsPerMaster(recordsperpage));
        //    return PartialView("_Details_Commands", cmds);
        //}
        //#endregion

        //#region Thing DevKeys
        //[HttpGet]
        //public PartialViewResult DevKeysPV(long id)
        //{
        //    Thing Thing = Data.Repositories.UnitOfWork_Repositories.repoThings.Find(id);
        //    return PartialView("_Details_DevKeys", Thing);
        //}
        //#endregion

        //#region Thing Keys
        //[HttpGet]
        //public PartialViewResult EditDevKeysPV(long id)
        //{
        //    Thing Thing = Data.Repositories.UnitOfWork_Repositories.repoThings.Find(id);
        //    return PartialView("_Edit_DevKeys", Thing);
        //}

        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public ActionResult EditDevKeysPV([Bind(Include = "ID,GUID,KeyPass")] Thing Thing)
        //{
        //    ResultInfo.Result res = ResultInfo.GetResultByID(1);
        //    if (ModelState.IsValid)
        //    {
        //        res = UnitOfWork_Repositories.repoThings.EditDevKeys(Thing.ID, Thing.GUID, Thing.KeyPass);
        //        return Json(res);
        //    }
        //    return Json(res);
        //}

        //#endregion

        #endregion


        #region LookUP
        #region Lookup Main Div
        [HttpGet]
        public PartialViewResult LookupPV(string searchfor = null, int page = 1, int recordsperpage = 0)
        {
            PagedList.IPagedList ends = Data.Repositories.UnitOfWork_Repositories.repoThings.GetPagedList("", 1, 10);
            return PartialView("lookup/Index", ends);
        }
        #endregion
        #region Lookup List Div
        [HttpGet]
        public PartialViewResult LookupListPV(string searchfor = null, int page = 1, int recordsperpage = 0)
        {
            PagedList.IPagedList ends = Data.Repositories.UnitOfWork_Repositories.repoThings.GetPagedList(searchfor, page, Config.DefaultRecordsPerChild);
            return PartialView("lookup/List", ends);
        }
        #endregion
        #endregion


        #region Reports

        [HttpGet]
        public ActionResult Rpt_Hour(long ThingID, long endPointTypeID)
        {
            Chart chrt = UnitOfWork_Reports.rptThings.IOs_Hour(ThingID, endPointTypeID);
            return PartialView("Reports/Charts/InputValues_BasicLine", chrt);
        }

        [HttpGet]
        public ActionResult Rpt_Minute(long ThingID, long endPointTypeID)
        {
            Chart chrt = UnitOfWork_Reports.rptThings.IOs_Minute(ThingID, endPointTypeID);
            return PartialView("Reports/Charts/InputValues_BasicLine", chrt);
        }


        [HttpGet]
        public ActionResult Rpt_IOsHistory(long ThingID, long endPointTypeID, DateTime fromDate, DateTime toDate, int page = 1, int recordsperpage = 0)
        {
            IPagedList IOs = UnitOfWork_Repositories.repoThings.GetThingEndIOs(ThingID, endPointTypeID, fromDate, toDate, page, Helpers.Configs.validateRecordsPerMaster(recordsperpage));
            return PartialView("Reports/Grids/HistoryIOs", IOs);


            #endregion


        }
    }
}
