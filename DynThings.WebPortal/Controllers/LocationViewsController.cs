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

namespace DynThings.WebPortal.Controllers
{
    public class LocationViewsController : BaseController
    {
        #region ActionResult: Views

        #region Get LocationViews List
        [HttpGet]
        public ActionResult Index()
        {
            if ( ValidateUserPermissions(true, true) == false)
            {
                return RedirectToAction("Login","Account");
            }
            return View();
        }
        #endregion

        #region Find
        public ActionResult Monitor(long id)
        {
            if (ValidateUserPermissions(true, true) == false)
            {
                return RedirectToAction("Login", "Account");
            }
            LocationView locationView = UnitOfWork_Repositories.repoLocationViews.Find(id);
            return View("Monitor", locationView);
        }
        #endregion

        #region Details
        public ActionResult Details(long id)
        {
            if (ValidateUserPermissions(true, true) == false)
            {
                return RedirectToAction("Login", "Account");
            }
            LocationView locationView = UnitOfWork_Repositories.repoLocationViews.Find(id);
            return View("Details", locationView);
        }
        #endregion

        #endregion


        #region Get Partial Views

        #region ListPV
        [HttpGet]
        public PartialViewResult ListCardsPV(string searchfor = null, int page = 1, int recordsperpage = 0)
        {
            IPagedList views = UnitOfWork_Repositories.repoLocationViews.GetPagedList(searchfor, page, Helpers.Configs.validateRecordsPerMaster(recordsperpage));
            return PartialView("_ListCards", views);
        }

        [HttpGet]
        public PartialViewResult ListGridPV(string searchfor = null, int page = 1, int recordsperpage = 0)
        {
            IPagedList views = UnitOfWork_Repositories.repoLocationViews.GetPagedList(searchfor, page, Helpers.Configs.validateRecordsPerMaster(recordsperpage));
            return PartialView("_ListGrid", views);
        }
        #endregion

        #region AddPV
        [HttpGet]
        public PartialViewResult AddPV()
        {
            ViewBag.LocationViewTypeID = new SelectList(UnitOfWork_Repositories.repoLocationViewTypes.GetList(), "ID", "Title", 1);
            return PartialView("_Add");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddPV([Bind(Include = "Title,LocationViewTypeID")] LocationView locationView)
        {
            ResultInfo.Result res = ResultInfo.GetResultByID(1);
            if (ModelState.IsValid)
            {
                res = UnitOfWork_Repositories.repoLocationViews.Add(locationView.Title, locationView.LocationViewTypeID, "1");
            }
            return Json(res);
        }
        #endregion

        #region EditPV : Title
        [HttpGet]
        public PartialViewResult EditTitlePV(long id)
        {
            LocationView locationView = UnitOfWork_Repositories.repoLocationViews.Find(id);
            return PartialView("_EditTitle", locationView);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditTitlePV([Bind(Include = "ID,Title")] LocationView locationView)
        {
            ResultInfo.Result res = ResultInfo.GetResultByID(1);
            if (ModelState.IsValid)
            {
                res = UnitOfWork_Repositories.repoLocationViews.Edit(locationView.ID, locationView.Title, "1");
            }
            return Json(res);
        }
        #endregion

        #region EditPV : MapInfo
        [HttpGet]
        public PartialViewResult EditMapPV(long id)
        {
            LocationView locationView = UnitOfWork_Repositories.repoLocationViews.Find(id);
            return PartialView("_EditMap", locationView);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditMapPV([Bind(Include = "ID,X,Y,Z")] LocationView locationView)
        {
            ResultInfo.Result res = ResultInfo.GetResultByID(1);
            if (ModelState.IsValid)
            {
                res = UnitOfWork_Repositories.repoLocationViews.Edit(locationView.ID, 3, locationView.X, locationView.Y, locationView.Z, "1");
            }
            return Json(res);
        }
        #endregion

        #region EditComponents

        #region LocationsListPV
        [HttpGet]
        public PartialViewResult LocationsByLocationViewIDListGridPV(string searchfor = null, long locationViewID = 0, int page = 1, int recordsperpage = 0)
        {
            IPagedList views = UnitOfWork_Repositories.repoLocations.GetPagedList(searchfor, locationViewID, page, Helpers.Configs.validateRecordsPerMaster(recordsperpage));
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
                res = UnitOfWork_Repositories.repoLocationViews.AttachLocation(locationViewID, locationID, userID);
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
                res = UnitOfWork_Repositories.repoLocationViews.DeattachLocation(locationViewID, locationID, userID);
            }
            return Json(res);
        }
        #endregion


        #endregion

        #region DeletePV
        [HttpGet]
        public PartialViewResult DeletePV(int id)
        {
            LocationView locationView = UnitOfWork_Repositories.repoLocationViews.Find(id);
            return PartialView("_Delete", locationView);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult DeletePV([Bind(Include = "ID,Title")] LocationView locationView)
        {
            ResultInfo.Result res = ResultInfo.GetResultByID(1);
            if (ModelState.IsValid)
            {
                res = UnitOfWork_Repositories.repoLocationViews.Delete(locationView.ID);
                return Json(res);
            }
            return Json(res);
        }
        #endregion

        #region Monitor Components
        [HttpGet]
        public PartialViewResult GetPVLocationViewMap(int id)
        {
            LocationView locationView = UnitOfWork_Repositories.repoLocationViews.Find(id);
            return PartialView("_LocationViewMap", locationView);
        }

        [HttpGet]
        public PartialViewResult GetPVLocationViewLocation(int id)
        {
            Location location = UnitOfWork_Repositories.repoLocations.Find(id);
            return PartialView("_Location", location);
        }

        //[HttpGet]
        //public PartialViewResult GetPVLocationViewEndPointMain(long endPointID)
        //{
        //    Endpoint endPoint = UnitOfWork_Repositories.repoEndpoints.Find(endPointID);
        //    return PartialView("_EndPointMain", endPoint);
        //}

        //[HttpGet]
        //public PartialViewResult GetPVLocationViewEndPointHistory(long endPointID)
        //{
        //    IPagedList IOs = UnitOfWork_Repositories.repoEndpointIOs.GetPagedList(endPointID, 1, 3);
        //    return PartialView("_EndPointHistory", IOs);
        //}

        //[HttpGet]
        //public PartialViewResult GetEndPointCommandsByEndPointGUIDPV(long endPointID)
        //{
        //    IPagedList endCmds = UnitOfWork_Repositories.repoEndPointCommands.GetPagedListByEndPointID("", endPointID, 1, 3);
        //    return PartialView("_EndPointCommands", endCmds);
        //}
        #endregion



        [HttpGet]
        public PartialViewResult GetLocationThingsListPV(string searchfor = null,long locationID = 0, int page = 1, int recordsperpage = 0)
        {
            IPagedList things = UnitOfWork_Repositories.repoThings.GetPagedList(searchfor,locationID,page, Helpers.Configs.validateRecordsPerMaster(recordsperpage));
            return PartialView("_LocationThingsList", things);
        }

        [HttpGet]
        public PartialViewResult GetLocationThingEndsListPV(string searchfor = "", long ?locationID = null,long ?thingID = null,long ?thingTypeID = null,long ?endpointTypeID = null,long ?endpointID = null, int page = 1, int recordsperpage = 0)
        {
            IPagedList things = UnitOfWork_Repositories.repoThings.GetThingEndsList("",null,null,null,null,null, page, Helpers.Configs.validateRecordsPerMaster(recordsperpage));
            return PartialView("_ThingEnds", things);
        }


        #endregion







    }
}
