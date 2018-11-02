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
using DynHighCharts;
using ResultInfo;

namespace DynThings.WebPortal.Controllers
{
    
    public class EndpointsController : BaseController
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
            Endpoint endpoint = uof_repos.repoEndpoints.Find(id);
            return View(endpoint);
        }

        #endregion

        #region PartialViewResult: Partial Views

        

        #region ListPV
        [HttpGet]
        public PartialViewResult ListPV(string searchfor = null, int page = 1, int recordsperpage = 0)
        {
            PagedList.IPagedList ends = uof_repos.repoEndpoints.GetPagedList(searchfor, page, Helpers.Configs.validateRecordsPerMaster(recordsperpage));
            return PartialView("_List", ends);
        }
        #endregion

        #region AddPV
        [HttpGet]
        public PartialViewResult AddPV()
        {
            ViewBag.TypeID = new SelectList(uof_repos.repoEndpointTypes.GetList(), "ID", "Title", 1);
            ViewBag.DeviceID = new SelectList(uof_repos.repoDevices.GetList(), "ID", "Title", 1);
            ViewBag.ThingID = new SelectList(uof_repos.repoThings.GetList(false), "ID", "Title", 1);
            return PartialView("_Add");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddPV([Bind(Include = "Title,TypeID,DeviceID,ThingID,IsNumericOnly,MinValue,MaxValue,LowRange,HighRange")] Endpoint endpoint)
        {
            Result res = Result.GenerateFailedResult();
            if (ModelState.IsValid)
            {
                res = uof_repos.repoEndpoints.Add(endpoint.Title, endpoint.TypeID, endpoint.DeviceID,endpoint.ThingID, endpoint.IsNumericOnly, endpoint.MinValue, endpoint.MaxValue, endpoint.LowRange, endpoint.HighRange);
                return Json(res);
            }
            return Json(res);
        }
        #endregion

        #region EditPV
        [HttpGet]
        public PartialViewResult EditPV(long id)
        {
            Endpoint endpoint = uof_repos.repoEndpoints.Find(id);
            ViewBag.TypeID = new SelectList(uof_repos.repoEndpointTypes.GetList(), "ID", "Title", endpoint.TypeID);
            ViewBag.DeviceID = new SelectList(uof_repos.repoDevices.GetList(), "ID", "Title", endpoint.DeviceID);
            ViewBag.ThingID = new SelectList(uof_repos.repoThings.GetList(false), "ID", "Title", endpoint.ThingID);
            return PartialView("_Edit", endpoint);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditPV([Bind(Include = "ID,Title,TypeID,DeviceID,ThingID,IsNumericOnly,MinValue,MaxValue,LowRange,HighRange")] Endpoint endpoint)
        {
            Result res = Result.GenerateFailedResult();
            if (ModelState.IsValid)
            {
                res = uof_repos.repoEndpoints.Edit(endpoint.ID, endpoint.Title, endpoint.TypeID,endpoint.ThingID,endpoint.IsNumericOnly,endpoint.MinValue,endpoint.MaxValue,endpoint.LowRange,endpoint.HighRange);
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
                Result rm = Result.GenerateFailedResult();
                return PartialView("_PVResult",rm);
            }
            Endpoint endpoint = uof_repos.repoEndpoints.Find(id);
            return PartialView("_Delete", endpoint);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult DeletePV([Bind(Include = "ID,Title")] Endpoint endpoint)
        {
            Result res = Result.GenerateFailedResult();
            if (ModelState.IsValid)
            {
                res = uof_repos.repoEndpoints.Delete(endpoint.ID);
                return Json(res);
            }
            return Json(res);
        }
        #endregion

        #region EndPoint MainDetails
        public PartialViewResult DetailsPV(long id)
        {
            Endpoint endpoint = uof_repos.repoEndpoints.Find(id);
            return PartialView("_Details_Main", endpoint);
        }

        #endregion

        #region EndPoint Connectivity
        public PartialViewResult EndPointConnectivityPV(long id)
        {
            Endpoint endpoint = uof_repos.repoEndpoints.Find(id);
            return PartialView("_Details_Connectivity", endpoint);
        }

        #endregion

        #region EndPoint History
        [HttpGet]
        public PartialViewResult GetPVEndPointHistory(long endPointID, int page = 1, int recordsperpage = 0)
        {
            IPagedList IOs = uof_repos.repoEndpointIOs.GetPagedList(endPointID, page, Helpers.Configs.validateRecordsPerChild(Config.DefaultRecordsPerChild));
            return PartialView("_Details_History", IOs);

        }

        #endregion

        #region EndPoint Commands
        [HttpGet]
        public PartialViewResult EndPointCommandsListByEndPointIDPV(string searchfor = null, long EndPointID = 0, int page = 1, int recordsperpage = 0)
        {
            PagedList.IPagedList cmds = uof_repos.repoEndPointCommands.GetPagedListByEndPointID(searchfor, EndPointID, page, Helpers.Configs.validateRecordsPerMaster(recordsperpage));
            return PartialView("_Details_Commands", cmds);
        }
        #endregion

        #region EndPoint DevKeys
        [HttpGet]
        public PartialViewResult DevKeysPV(long id)
        {
            Endpoint endpoint = uof_repos.repoEndpoints.Find(id);
            return PartialView("_Details_DevKeys", endpoint);
        }
        #endregion

        #region EndPoint Keys
        [HttpGet]
        public PartialViewResult EditDevKeysPV(long id)
        {
            Endpoint endpoint = uof_repos.repoEndpoints.Find(id);
            return PartialView("_Edit_DevKeys", endpoint);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditDevKeysPV([Bind(Include = "ID,GUID,KeyPass")] Endpoint endpoint)
        {
            Result res = Result.GenerateFailedResult();
            if (ModelState.IsValid)
            {
                res = uof_repos.repoEndpoints.EditDevKeys(endpoint.ID, endpoint.GUID, endpoint.KeyPass);
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
            PagedList.IPagedList ends = uof_repos.repoEndpoints.GetPagedList("", 1, 10);
            return PartialView("lookup/Index", ends);
        }
        #endregion
        #region Lookup List Div
        [HttpGet]
        public PartialViewResult LookupListPV(string searchfor = null, int page = 1, int recordsperpage = 0)
        {
            PagedList.IPagedList ends = uof_repos.repoEndpoints.GetPagedList(searchfor, page, Config.DefaultRecordsPerChild);
            return PartialView("lookup/List", ends);
        }
        #endregion
        #endregion


        #region Reports
        [HttpGet]
        public ActionResult Rpt_Month(long endPointID,string year)
        {
            Chart chrt = uof_reports.rptEndpoints.IOs_Monthly(endPointID,year);
            return PartialView("_HighChart", chrt);
        }

        [HttpGet]
        public ActionResult Rpt_Day(long endPointID)
        {
            Chart chrt = uof_reports.rptEndpoints.IOs_Daily(endPointID);
            return PartialView("_HighChart", chrt);
        }

        [HttpGet]
        public ActionResult Rpt_Hour(long endPointID)
        {
            Chart chrt = uof_reports.rptEndpoints.IOs_Hour(endPointID);
            return PartialView("_HighChart", chrt);
        }

        [HttpGet]
        public ActionResult Rpt_Minute(long endPointID)
        {
            Chart chrt = uof_reports.rptEndpoints.IOs_Minute(endPointID);
            return PartialView("_HighChart", chrt);
        }
        #endregion






    }
}
