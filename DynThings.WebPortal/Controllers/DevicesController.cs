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

namespace DynThings.WebPortal.Controllers
{
    public class DevicesController : Controller
    {
        private DynThingsEntities db = new DynThingsEntities();

        #region ActionResult: Views
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Details(int id)
        {
            Device device = UnitOfWork.repoDevices.Find(id);
            return View(device);
        }

        #endregion

        #region PartialViewResult: Partial Views

        #region DetailsPV
        public PartialViewResult DetailsPV(Guid guid)
        {
            Device device = UnitOfWork.repoDevices.Find(guid);
            return PartialView("_Details_Main", device);
        }
        #endregion

        #region ListPV
        [HttpGet]
        public PartialViewResult GetListPV(string searchfor = null, int page = 1, int recordsperpage = 2)
        {
            PagedList.IPagedList devs = db.Devices
                .Where(e => searchfor == null || e.Title.Contains(searchfor))
                .OrderBy(e => e.Title).ToList()
                .ToPagedList(page, Helpers.Configs.validateRecordsPerMaster(recordsperpage));
            return PartialView("_List", devs);
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
        public ActionResult AddPV([Bind(Include = "Title")] Device device)
        {
            ResultInfo.Result res = UnitOfWork.resultInfo.GetResultByID(1);
            if (ModelState.IsValid)
            {
                res = UnitOfWork.repoDevices.Add(device.Title);
                return Json(res);
            }
            return Json(res);
        }
        #endregion

        #region EditPV : Title
        [HttpGet]
        public PartialViewResult EditPV(Guid guid)
        {
            Device device = UnitOfWork.repoDevices.Find(guid);
            return PartialView("_Edit", device);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditPV([Bind(Include = "ID,Title")] Device device)
        {
            ResultInfo.Result res = UnitOfWork.resultInfo.GetResultByID(1);
            if (ModelState.IsValid)
            {
                res = UnitOfWork.repoDevices.Edit(device.ID, device.Title);
                return Json(res);
            }
            return Json(res);
        }
        #endregion

        #region DeletePV
        [HttpGet]
        public PartialViewResult DeletePV(long id)
        {
            Device device = UnitOfWork.repoDevices.Find(id);
            return PartialView("_Delete", device);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult DeletePV([Bind(Include = "ID,Title")] Device device)
        {
            ResultInfo.Result res = UnitOfWork.resultInfo.GetResultByID(1);
            if (ModelState.IsValid)
            {
                res = UnitOfWork.repoDevices.Delete(device.ID);
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
            PagedList.IPagedList locs = UnitOfWork.repoDevices.GetPagedList("", 1, 10);
            return PartialView("lookup/Index", locs);
        }
        #endregion
        #region Lookup List Div
        [HttpGet]
        public PartialViewResult LookupListPV(string searchfor = null, int page = 1, int recordsperpage = 0)
        {
            PagedList.IPagedList locs = UnitOfWork.repoDevices.GetPagedList(searchfor, page, Config.DefaultRecordsPerChild);
            return PartialView("lookup/List", locs);
        }
        #endregion
        #endregion
    }
}
