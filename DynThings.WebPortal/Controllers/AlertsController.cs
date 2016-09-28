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

namespace DynThings.WebPortal.Controllers
{
    public class AlertsController : BaseController
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
            Alert Alert = Data.Repositories.UnitOfWork_Repositories.repoAlerts.Find(id);
            return View(Alert);
        }

        #endregion

        #region PartialViewResult: Partial Views

        #region DetailsPV
        public PartialViewResult DetailsMainPV(long id)
        {
            Alert Alert = Data.Repositories.UnitOfWork_Repositories.repoAlerts.Find(id);
            return PartialView("_Details_Main", Alert);
        }

        public PartialViewResult DetailsSchedulePV(long id)
        {
            Alert Alert = Data.Repositories.UnitOfWork_Repositories.repoAlerts.Find(id);
            return PartialView("_Details_Schedule", Alert);
        }

        #endregion

        #region ListPV
        [HttpGet]
        public PartialViewResult ListPV(string searchfor = null, int page = 1, int recordsperpage = 0)
        {
            PagedList.IPagedList ends = Data.Repositories.UnitOfWork_Repositories.repoAlerts.GetPagedList(searchfor, page, Helpers.Configs.validateRecordsPerMaster(recordsperpage));
            return PartialView("_List", ends);
        }
        #endregion

        #region AddPV
        [HttpGet]
        public PartialViewResult AddPV()
        {
            return PartialView("_Add");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddPV([Bind(Include = "Title")] Alert Alert)
        {
            ResultInfo.Result res = ResultInfo.GetResultByID(1);
            res = UnitOfWork_Repositories.repoAlerts.Add(Alert.Title);
            return Json(res);
        }
        #endregion

        #region Edit:MainPV
        [HttpGet]
        public PartialViewResult EditMainPV(long id)
        {
            Alert Alert = UnitOfWork_Repositories.repoAlerts.Find(id);
            return PartialView("_Edit_Main", Alert);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditMainPV([Bind(Include = "ID,Title,IsActive")] Alert Alert)
        {
            ResultInfo.Result res = ResultInfo.GetResultByID(1);
            if (ModelState.IsValid)
            {
                res = UnitOfWork_Repositories.repoAlerts.EditMain(Alert.ID, Alert.Title, (bool)Alert.IsActive);
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
            Alert Alert = UnitOfWork_Repositories.repoAlerts.Find(id);
            return PartialView("_Delete", Alert);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult DeletePV([Bind(Include = "ID,Title")] Alert Alert)
        {
            ResultInfo.Result res = ResultInfo.GetResultByID(1);
            if (ModelState.IsValid)
            {
                res = UnitOfWork_Repositories.repoAlerts.Delete(Alert.ID);
                return Json(res);
            }
            return Json(res);
        }
        #endregion


        #region AlertConditions
        #region AlertConditions: ListPV
        [HttpGet]
        public PartialViewResult AlertConditionsListPV(long alertID, string searchfor = null, int page = 1, int recordsperpage = 0)
        {
            PagedList.IPagedList cons = Data.Repositories.UnitOfWork_Repositories.repoAlerts.GetConditionsPagedList(alertID, searchfor, page, Helpers.Configs.validateRecordsPerMaster(recordsperpage));
            return PartialView("_Conditions_List", cons);
        }
        #endregion

        #region AlertConditions: AlertConditionAddPV
        [HttpGet]
        public PartialViewResult AlertConditionAddPV()
        {
            ViewBag.ThingID = new SelectList(UnitOfWork_Repositories.repoThings.GetList(false), "ID", "Title");
            ViewBag.IOTypeID = new SelectList(UnitOfWork_Repositories.repoIOTypes.GetList(false), "ID", "Title");
            ViewBag.EndPointTypeID = new SelectList(UnitOfWork_Repositories.repoEndpointTypes.GetList(), "ID", "Title");
            ViewBag.ConditionTypeID = new SelectList(UnitOfWork_Repositories.repoAlertConditionTypes.GetList(), "ID", "Title");
            return PartialView("_Conditions_Add");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AlertConditionAddPV([Bind(Include = "AlertID,ThingID,IOTypeID,EndPointTypeID,ConditionTypeID,ConditionValue,IsMust")] AlertCondition alertCondition)
        {
            ResultInfo.Result res = ResultInfo.GetResultByID(1);
            if (ModelState.IsValid)
            {
                res = UnitOfWork_Repositories.repoAlerts.AddCondition(alertCondition.AlertID
                    , alertCondition.ThingID
                    , alertCondition.IOTypeID
                    , alertCondition.EndPointTypeID
                    , alertCondition.ConditionTypeID
                    , alertCondition.ConditionValue
                    , alertCondition.IsMust);
                return Json(res);
            }
            return Json(res);
        }
        #endregion

        #region AlertConditions: AlertConditionEditPV
        [HttpGet]
        public PartialViewResult AlertConditionEditPV(long id)
        {
            AlertCondition con = UnitOfWork_Repositories.repoAlerts.FindCondition(id);
            ViewBag.ThingID = new SelectList(UnitOfWork_Repositories.repoThings.GetList(false), "ID", "Title", con.ThingID);
            ViewBag.IOTypeID = new SelectList(UnitOfWork_Repositories.repoIOTypes.GetList(false), "ID", "Title", con.IOTypeID);
            ViewBag.EndPointTypeID = new SelectList(UnitOfWork_Repositories.repoEndpointTypes.GetList(), "ID", "Title", con.EndPointTypeID);
            ViewBag.ConditionTypeID = new SelectList(UnitOfWork_Repositories.repoAlertConditionTypes.GetList(), "ID", "Title", con.ConditionTypeID);
            return PartialView("_Conditions_Edit", con);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AlertConditionEditPV([Bind(Include = "ID,AlertID,ThingID,IOTypeID,EndPointTypeID,ConditionTypeID,ConditionValue,IsMust")] AlertCondition alertCondition)
        {
            ResultInfo.Result res = ResultInfo.GetResultByID(1);
            if (ModelState.IsValid)
            {
                res = UnitOfWork_Repositories.repoAlerts.EditCondition(alertCondition.ID
                    , alertCondition.ThingID
                    , alertCondition.IOTypeID
                    , alertCondition.EndPointTypeID
                    , alertCondition.ConditionTypeID
                    , alertCondition.ConditionValue
                    , alertCondition.IsMust);
                return Json(res);
            }
            return Json(res);
        }
        #endregion

        #region AlertConditions: AlertConditionDeletePV
        [HttpGet]
        public PartialViewResult AlertConditionDeletePV(long id)
        {
            if (!User.IsInRole("Admin"))
            {
                ResultInfo.Result rm = Core.ResultInfo.GetResultByID(1);
                return PartialView("_PVResult", rm);
            }
            AlertCondition con = UnitOfWork_Repositories.repoAlerts.FindCondition(id);
            return PartialView("_Conditions_Delete", con);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult AlertConditionDeletePV([Bind(Include = "ID")] AlertCondition alertCondition)
        {
            ResultInfo.Result res = ResultInfo.GetResultByID(1);
            if (ModelState.IsValid)
            {
                res = UnitOfWork_Repositories.repoAlerts.DeleteCondition(alertCondition.ID);
                return Json(res);
            }
            return Json(res);
        }
        #endregion

        #endregion

        #region AlertUsers
        #region AlertUsers: ListPV
        [HttpGet]
        public PartialViewResult AlertUsersListPV(long alertID, string searchfor = null, int page = 1, int recordsperpage = 0)
        {
            PagedList.IPagedList usrs = Data.Repositories.UnitOfWork_Repositories.repoAlerts.GetUsersPagedList(alertID, searchfor, page, Helpers.Configs.validateRecordsPerMaster(recordsperpage));
            return PartialView("_AlertUsers_List", usrs);
        }
        #endregion

        #region AlertUsers: AlertUserDetach

        [HttpPost]
        [Authorize(Roles = "Admin")]
        public ActionResult AlertUserDetach(long alertID, string userID)
        {
            ResultInfo.Result res = ResultInfo.GetResultByID(1);
            res = UnitOfWork_Repositories.repoAlerts.DeattachUser(alertID,userID);

            return Json(res);
        }
        #endregion

        #region AlertUsers: AlertUserAttach

        [HttpPost]
        [Authorize(Roles = "Admin")]
        public ActionResult AlertUserAttach(long alertID, string userID)
        {
            ResultInfo.Result res = ResultInfo.GetResultByID(1);
            res = UnitOfWork_Repositories.repoAlerts.AttachUser(alertID, userID);

            return Json(res);
        }
        #endregion

        #endregion



        #endregion
    }
}