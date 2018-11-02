/////////////////////////////////////////////////////////////////
// Created by : Caesar Moussalli                               //
// TimeStamp  : 31-1-2016                                      //
// Content    : Handel the Device Actions                      //
// Notes      :                                                //
//                                                             //
/////////////////////////////////////////////////////////////////
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using PagedList;
using DynThings.Data.Models;
using DynThings.Data.Repositories;
using DynThings.Core;
using ResultInfo;

namespace DynThings.WebPortal.Controllers
{
    public class DevicesController : BaseController
    {
        UnitOfWork_Repositories uof_repos = new UnitOfWork_Repositories();

        #region ActionResult: Views
        public ActionResult Index()
        {
            if (ValidateUserPermissions(true, false ) == false)
            {
                return RedirectToAction("Login", "Account");
            }
            return View();
        }

        public ActionResult Details(int id)
        {
            if (ValidateUserPermissions(true, false) == false)
            {
                return RedirectToAction("Login", "Account");
            }
            Device device = uof_repos.repoDevices.Find(id);
            return View("Details", device);
        }

        #endregion

        #region PartialViewResult: Partial Views

        #region DetailsPV
      
        public PartialViewResult DetailsPV(int id)
        {
            Device device = uof_repos.repoDevices.Find(id);
            return PartialView("_Details_Main", device);
        }
        #endregion

        #region ListPV
        [HttpGet]
        public PartialViewResult GetListPV(string searchfor = null, int page = 1, int recordsperpage = 2)
        {
            PagedList.IPagedList devs = uof_repos.repoDevices.GetPagedList(searchfor,  page, Helpers.Configs.validateRecordsPerMaster(recordsperpage));
            return PartialView("_List", devs);
        }
        #endregion

        #region AddPV
        [HttpGet]
        public PartialViewResult AddPV()
        {
            ViewBag.UTC_Diff = new SelectList(StaticMenus.GetRegionalTimeOptions(), Config.App_TimeZone);
            return PartialView("_Add");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddPV([Bind(Include = "Title,UTC_Diff,IsConnectedDelay")] Device device)
        {
            Result res = Result.GenerateFailedResult();
            if (ModelState.IsValid)
            {
                res = uof_repos.repoDevices.Add(device.Title,device.UTC_Diff, device.IsConnectedDelay);
                return Json(res);
            }
            return Json(res);
        }
        #endregion

        #region EditPV
        [HttpGet]
        public PartialViewResult EditPV(long id)
        {
            Device device = uof_repos.repoDevices.Find(id);
            ViewBag.UTC_Diff = new SelectList(StaticMenus.GetRegionalTimeOptions(), device.UTC_Diff);
            return PartialView("_Edit", device);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditPV([Bind(Include = "ID,Title,UTC_Diff,IsConnectedDelay")] Device device)
        {
            Result res = Result.GenerateFailedResult();
            if (ModelState.IsValid)
            {
                res = uof_repos.repoDevices.Edit(device.ID, device.Title,int.Parse(device.UTC_Diff.ToString()), device.IsConnectedDelay);
                return Json(res);
            }
            return Json(res);
        }
        #endregion

        #region DeletePV
        [HttpGet]
        public PartialViewResult DeletePV(long id)
        {
            Device device = uof_repos.repoDevices.Find(id);
            return PartialView("_Delete", device);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult DeletePV([Bind(Include = "ID,Title")] Device device)
        {
            Result res = Result.GenerateFailedResult();
            if (ModelState.IsValid)
            {
                res = uof_repos.repoDevices.Delete(device.ID);
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
            PagedList.IPagedList locs = uof_repos.repoDevices.GetPagedList("", 1, 10);
            return PartialView("lookup/Index", locs);
        }
        #endregion
        #region Lookup List Div
        [HttpGet]
        public PartialViewResult LookupListPV(string searchfor = null, int page = 1, int recordsperpage = 0)
        {
            PagedList.IPagedList locs = uof_repos.repoDevices.GetPagedList(searchfor, page, Config.DefaultRecordsPerChild);
            return PartialView("lookup/List", locs);
        }
        #endregion
        #endregion
    }
}
