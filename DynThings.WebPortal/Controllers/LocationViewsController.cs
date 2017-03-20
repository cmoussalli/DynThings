/////////////////////////////////////////////////////////////////
// Created by : Caesar Moussalli                               //
// TimeStamp  : 31-1-2016                                      //
// Content    : Handel the LocationViews Actions               //
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
using DynThings.Data.Models;
using DynThings.Data.Repositories;
using PagedList;
using DynThings.Core;
using DynThings.Data.Models.ViewModels;
using Microsoft.AspNet.SignalR;
using Microsoft.AspNet.SignalR.Hubs;
using DynThings.WebPortal;

namespace DynThings.WebPortal.Controllers
{
    public class LocationViewsController : BaseController
    {
        UnitOfWork_Repositories uof_repos = new UnitOfWork_Repositories();

        #region ActionResult: Views

        #region Get LocationViews List
        [HttpGet]
        public ActionResult Index()
        {
            if (ValidateUserPermissions(true, true) == false)
            {
                return RedirectToAction("Login", "Account");
            }
            return View();
        }
        #endregion

        #region Monitor
        public ActionResult Monitor(long id)
        {
            if (ValidateUserPermissions(true, true) == false)
            {
                return RedirectToAction("Login", "Account");
            }
            LocationView locationView = uof_repos.repoLocationViews.Find(id);
            return View("Monitor", locationView);
        }
        #endregion

        #region Details
        public ActionResult Details(long id)
        {
            if (ValidateUserPermissions(true, false) == false)
            {
                return RedirectToAction("Login", "Account");
            }
            LocationView locationView = uof_repos.repoLocationViews.Find(id);
            return View("Details", locationView);
        }
        #endregion

        #endregion

        #region Get Partial Views :: Customize

        #region ListPV
        [HttpGet]
        public PartialViewResult ListCardsPV(string searchfor = null, int page = 1, int recordsperpage = 0)
        {
            IPagedList views = uof_repos.repoLocationViews.GetPagedList(searchfor, page, Helpers.Configs.validateRecordsPerMaster(recordsperpage));
            return PartialView("_ListCards", views);
        }

        [HttpGet]
        public PartialViewResult ListGridPV(string searchfor = null, int page = 1, int recordsperpage = 0)
        {
            IPagedList views = uof_repos.repoLocationViews.GetPagedList(searchfor, page, Helpers.Configs.validateRecordsPerMaster(recordsperpage));
            return PartialView("_ListGrid", views);
        }
        #endregion

        #region AddPV
        [HttpGet]
        public PartialViewResult AddPV()
        {
            if (ValidateUserPermissions(true, false) == false)
            {
                ResultInfo.Result result = ResultInfo.GenerateNotAuthorizedResult("Not Authorized", "Your account don't have the required security permission");
                return PartialView("_PVResult",result);
            }
            ViewBag.LocationViewTypeID = new SelectList(uof_repos.repoLocationViewTypes.GetList(), "ID", "Title", 1);
            return PartialView("_Add");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddPV([Bind(Include = "Title,LocationViewTypeID")] LocationView locationView)
        {
            ResultInfo.Result res = ResultInfo.GetResultByID(1);
            if (ModelState.IsValid)
            {
                res = uof_repos.repoLocationViews.Add(locationView.Title, locationView.LocationViewTypeID, "1");
            }
            return Json(res);
        }
        #endregion

        #region EditPV : Title
        [HttpGet]
        public PartialViewResult EditMainPV(long id)
        {
            LocationView locationView = uof_repos.repoLocationViews.Find(id);
            ViewBag.LocationViewTypeID = new SelectList(uof_repos.repoLocationViewTypes.GetList(), "ID", "Title", locationView.LocationViewTypeID);
            return PartialView("_EditMain", locationView);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditMainPV([Bind(Include = "ID,Title,LocationViewTypeID")] LocationView locationView)
        {
            ResultInfo.Result res = ResultInfo.GetResultByID(1);
            if (ModelState.IsValid)
            {
                res = uof_repos.repoLocationViews.Edit(locationView.ID, locationView.Title, locationView.LocationViewTypeID);
            }
            return Json(res);
        }
        #endregion

        #region EditPV : MapInfo
        [HttpGet]
        public PartialViewResult EditMapPV(long id)
        {
            LocationView locationView = uof_repos.repoLocationViews.Find(id);
            return PartialView("_EditMap", locationView);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditMapPV([Bind(Include = "ID,X,Y,Z")] LocationView locationView)
        {
            ResultInfo.Result res = ResultInfo.GetResultByID(1);
            if (ModelState.IsValid)
            {
                res = uof_repos.repoLocationViews.Edit(locationView.ID, 3, locationView.X, locationView.Y, locationView.Z, "1");
            }
            return Json(res);
        }
        #endregion

        #region EditComponents

        #region LocationsListPV
        [HttpGet]
        public PartialViewResult LocationsByLocationViewIDListGridPV(string searchfor = null, long locationViewID = 0, int page = 1, int recordsperpage = 0)
        {
            IPagedList views = uof_repos.repoLocations.GetPagedList(searchfor, locationViewID, page, Helpers.Configs.validateRecordsPerMaster(recordsperpage));
            return PartialView("_LocationsList", views);
        }
        #endregion

        #region AttachLocation
        [HttpPost]
        public ActionResult AttachLocation(long locationViewID, long locationID, string userID)
        {
            ResultInfo.Result res = ResultInfo.GetResultByID(1);
            if (ModelState.IsValid)
            {
                res = uof_repos.repoLocationViews.AttachLocation(locationViewID, locationID, userID);
            }
            return Json(res);
        }
        #endregion

        #region DeAttachLocation
        [HttpPost]
        public ActionResult DeAttachLocation(long locationViewID, long locationID, string userID)
        {
            ResultInfo.Result res = ResultInfo.GetResultByID(1);
            if (ModelState.IsValid)
            {
                res = uof_repos.repoLocationViews.DeattachLocation(locationViewID, locationID, userID);
            }
            return Json(res);
        }
        #endregion


        #endregion

        #region DeletePV
        [HttpGet]
        public PartialViewResult DeletePV(int id)
        {
            LocationView locationView = uof_repos.repoLocationViews.Find(id);
            return PartialView("_Delete", locationView);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult DeletePV([Bind(Include = "ID,Title")] LocationView locationView)
        {
            ResultInfo.Result res = ResultInfo.GetResultByID(1);
            if (ModelState.IsValid)
            {
                res = uof_repos.repoLocationViews.Delete(locationView.ID);
                return Json(res);
            }
            return Json(res);
        }
        #endregion



        #endregion


        #region Get Partial Views :: Monitor

        #region Left Panel
        [HttpGet]
        public PartialViewResult GetMonitorLocationsListPV(long locationViewID,string searchfor)
        {
            IPagedList locs = uof_repos.repoLocationViews.Find(locationViewID).Locations.Where(l => l.Title.Contains(searchfor)).OrderBy(x => x.Title).ToPagedList(1,50);
            return PartialView("_MonitorView_List_Location", locs);
        }


        #endregion //Details Panel

        #region Map
        [HttpGet]
        public PartialViewResult GetPVLocationViewMap(int id)
        {
            LocationView locationView = uof_repos.repoLocationViews.Find(id);
            return PartialView("_LocationViewMap", locationView);
        }
        #endregion //Map

        #region Right Panel
        #region Main
        [HttpGet]
        public PartialViewResult GetPVLocationViewLocation(int id)
        {
            Location location = uof_repos.repoLocations.Find(id);
            return PartialView("_Location", location);
        }

        [HttpGet]
        public PartialViewResult GetLocationThingsListPV(string searchfor = null, long locationID = 0, int page = 1, int recordsperpage = 0)
        {
            IPagedList things = uof_repos.repoThings.GetPagedList(searchfor, locationID, page, Helpers.Configs.validateRecordsPerMaster(recordsperpage));
            return PartialView("_LocationThingsList", things);
        }

        #endregion //Main

        #region Inputs
        [HttpGet]
        public PartialViewResult GetLocationThingEndsListPV(string searchfor = "", long? locationID = null, long? thingID = null, long? thingTypeID = null, long? endpointTypeID = null, long? endpointID = null, int page = 1, int recordsperpage = 0)
        {
            IPagedList things = uof_repos.repoThings.GetThingEndsList(searchfor, locationID, thingID, null, null, null, page, Helpers.Configs.validateRecordsPerMaster(recordsperpage));
            return PartialView("_ThingEnds_List", things);
        }

        [HttpGet]
        public PartialViewResult GetLocationThingEndPV( long thingID,  long endpointTypeID)
        {
            ThingEnd thingend = uof_repos.repoThings.GetThingEnd(thingID,endpointTypeID);
            return PartialView("_ThingEnd", thingend);
        }

        #endregion //Inputs

        #region Commands
        [HttpGet]
        public PartialViewResult GetLocationCommandsListPV(string searchfor = "", long? locationID = null, long? thingID = 0, int page = 1, int recordsperpage = 0)
        {
            IPagedList commands = uof_repos.repoEndPointCommands.GetPagedListByLocationID(searchfor, long.Parse(locationID.ToString()), long.Parse(thingID.ToString()), page, Helpers.Configs.validateRecordsPerMaster(recordsperpage));
            return PartialView("_ThingsCommands_List", commands);
        }
        #endregion //Commands

        #region Logs
        [HttpGet]
        public PartialViewResult GetLocationLogsListPV(string searchfor = "", long? locationID = null, long? thingID = 0, int page = 1, int recordsperpage = 0)
        {
            IPagedList commands = uof_repos.repoEndpointIOs.GetLogsPagedList(searchfor, long.Parse(locationID.ToString()), long.Parse(thingID.ToString()), page, 25);
            return PartialView("_ThingsLogs_List", commands);
        }
        #endregion //Commands

        #endregion //Right Panel

        #region Details Panel
        [HttpGet]
        public PartialViewResult GetThingEndDetailsPV(long thingID, long thingEndTypeID)
        {
            ThingEnd thingEnd = uof_repos.repoThings.GetThingEnd(thingID, thingEndTypeID);
            return PartialView("_ThingEnd_Details", thingEnd);
        }


        #endregion //Details Panel

        #endregion // Monitor





    }
}
