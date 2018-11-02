/////////////////////////////////////////////////////////////////
// Created by : Caesar Moussalli                               //
// TimeStamp  : 31-1-2016                                      //
// Content    : Handel the Locations Actions                   //
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
using DynThings.Core;
using DynThings.Data.Models;
using DynThings.Data.Repositories;
using PagedList;
using Microsoft.AspNet.Identity;
using ResultInfo;

namespace DynThings.WebPortal.Controllers
{
    public class LocationsController : BaseController
    {
        UnitOfWork_Repositories uof_repos = new UnitOfWork_Repositories();

        #region ActionResult: Views
        public ActionResult Index()
        {
            if (ValidateUserPermissions(false, false) == false)
            {
                return RedirectToAction("Login", "Account");
            }
            return View();
        }

        public ActionResult Details(int id)
        {
            if (ValidateUserPermissions(false, false) == false)
            {
                return RedirectToAction("Login", "Account");
            }
            Location loc = uof_repos.repoLocations.Find(id);
            return View(loc);
        }

        #endregion

        #region PartialViewResult: Partial Views

        #region ListPV
        [HttpGet]
        public PartialViewResult ListPV(string searchfor = null, int page = 1, int recordsperpage = 0)
        {
            PagedList.IPagedList locs = uof_repos.repoLocations.GetPagedList(searchfor, page, Helpers.Configs.validateRecordsPerMaster(recordsperpage));
            return PartialView("_List", locs);
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
        public ActionResult AddPV([Bind(Include = "Title")] Location location)
        {
            Result res = Result.GenerateFailedResult();
            if (ModelState.IsValid)
            {
                res = uof_repos.repoLocations.Add(location.Title);
                return Json(res);
            }
            return Json(res);
        }
        #endregion


        #region Details : Main
        [HttpGet]
        public PartialViewResult DetailsMainPV(int id)
        {
            Location location = uof_repos.repoLocations.Find(id);
            return PartialView("_Details_Main", location);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult DetailsMainPV([Bind(Include = "ID,Title,IsActive")] Location location)
        {
            Result res = Result.GenerateFailedResult();
            if (ModelState.IsValid)
            {
                res = uof_repos.repoLocations.EditMain(location.ID, location.Title, location.isActive);
                return Json(res);
            }
            return Json(res);
        }
        #endregion

        #region Details : GeoLocation
        [HttpGet]
        public PartialViewResult DetailsGeoLocationPV(int id)
        {
            Location location = uof_repos.repoLocations.Find(id);
            return PartialView("_Details_GeoLocation", location);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult DetailsGeoLocationPV([Bind(Include = "ID,LongitudeY,LatitudeX")] Location location)
        {
            Result res = Result.GenerateFailedResult();
            if (ModelState.IsValid)
            {
                res = uof_repos.repoLocations.EditGeoLocation(location.ID, location.LongitudeY, location.LatitudeX);
                return Json(res);
            }
            return Json(res);
        }
        #endregion




        #region Details : Location Devices

        #region DevicesContainerPV
        [HttpGet]
        public PartialViewResult DetailsDevicesContainerPV(long locationID = 0)
        {
            LocationView locationView = uof_repos.repoLocationViews.Find(locationID);
            return PartialView("_Details_Devices_Container", locationView);
        }
        #endregion

        #region DevicesListPV
        [HttpGet]
        public PartialViewResult DetailsDevicesListPV(string searchfor = null, long LocationID = 0, int page = 1, int recordsperpage = 0)
        {
            IPagedList devices = uof_repos.repoLocations.GetLocationDevicesPagedList(searchfor, LocationID, page, Helpers.Configs.validateRecordsPerMaster(recordsperpage));
            return PartialView("_Details_Devices_List", devices);
        }
        #endregion

        #region AttachDevice
        [HttpPost]
        public ActionResult AttachDevice(long LocationID, long DeviceID)
        {
            Result res = Result.GenerateFailedResult();
            if (ModelState.IsValid)
            {
                res = uof_repos.repoLocations.AttachDevice(LocationID, DeviceID, User.Identity.GetUserId());
                return Json(res);
            }
            return Json(res);
        }
        #endregion

        #region DeAttachDevice
        [HttpPost]
        public ActionResult DeAttachDevice(long linkID)
        {
            Result res = Result.GenerateFailedResult();
            if (ModelState.IsValid)
            {
                res = uof_repos.repoLocations.DeattachDevice(linkID, currentUser.Id);
                return Json(res);
            }
            return Json(res);
        }
        #endregion
        #endregion

        #region Location Things

        #region ThingsContainerPV
        [HttpGet]
        public PartialViewResult DetailsThingsContainerPV(long locationID = 0)
        {
            LocationView locationView = uof_repos.repoLocationViews.Find(locationID);
            return PartialView("_Details_Things_Container", locationView);
        }
        #endregion

        #region ThingsListPV
        [HttpGet]
        public PartialViewResult DetailsThingsListPV(string searchfor = null, long LocationID = 0, int page = 1, int recordsperpage = 0)
        {
            IPagedList Things = uof_repos.repoLocations.GetLocationThingsPagedList(searchfor, LocationID, page, Helpers.Configs.validateRecordsPerMaster(recordsperpage));
            return PartialView("_Details_Things_List", Things);
        }
        #endregion

        #region AttachThing
        [HttpPost]
        public ActionResult AttachThing(long LocationID, long ThingID)
        {
            Result res = Result.GenerateFailedResult();
            if (ModelState.IsValid)
            {
                res = uof_repos.repoLocations.AttachThing(LocationID, ThingID, User.Identity.GetUserId());
                return Json(res);
            }
            return Json(res);
        }
        #endregion

        #region DeAttachThing
        [HttpPost]
        public ActionResult DeAttachThing(long linkID)
        {
            Result res = Result.GenerateFailedResult();
            if (ModelState.IsValid)
            {
                res = uof_repos.repoLocations.DeattachThing(linkID, currentUser.Id);
                return Json(res);
            }
            return Json(res);
        }
        #endregion
        #endregion


        #region DeletePV
        [HttpGet]
        public PartialViewResult DeletePV(int id)
        {
            Location location = uof_repos.repoLocations.Find(id);
            return PartialView("_Delete", location);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult DeletePV([Bind(Include = "ID,Title,IsActive")] Location location)
        {
            Result res = Result.GenerateFailedResult();
            if (ModelState.IsValid)
            {
                res = uof_repos.repoLocations.Delete(location.ID);
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
            PagedList.IPagedList locs = uof_repos.repoLocations.GetPagedList("", 1, 10);
            return PartialView("lookup/Index", locs);
        }
        #endregion
        #region Lookup List Div
        [HttpGet]
        public PartialViewResult LookupListPV(string searchfor = null, int page = 1, int recordsperpage = 0)
        {
            PagedList.IPagedList locs = uof_repos.repoLocations.GetPagedList(searchfor, page, Config.DefaultRecordsPerChild);
            return PartialView("lookup/List", locs);
        }
        #endregion
        #endregion




    }
}
