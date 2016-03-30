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

namespace DynThings.WebPortal.Controllers
{
    public class LocationsController : Controller
    {
        private DynThingsEntities db = new DynThingsEntities();

        #region ActionResult: Views
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Details(int id)
        {
            Location loc = UnitOfWork.repoLocations.Find(id);
            return View(loc);
        }

        #endregion

        #region PartialViewResult: Partial Views

        #region DetailsPV : Main
        public PartialViewResult DetailsMainPV(int id)
        {
            Location locs = UnitOfWork.repoLocations.Find(id);
            return PartialView("_Details_Main", locs);
        }
        #endregion

        #region DetailsPV : GeoLocation
        public PartialViewResult DetailsGeoLocationPV(int id)
        {
            Location locs = UnitOfWork.repoLocations.Find(id);
            return PartialView("_Details_GeoLocation", locs);
        }

        #endregion

        #region ListPV
        [HttpGet]
        public PartialViewResult ListPV(string searchfor = null, int page = 1, int recordsperpage = 0)
        {
            PagedList.IPagedList locs = UnitOfWork.repoLocations.GetPagedList(searchfor, page, Helpers.Configs.validateRecordsPerMaster(recordsperpage));
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
            UnitOfWork.repoLocations.Add(location.Title);
            return Content("Ok");
        }
        #endregion

        #region EditPV
        #region Edit : Main
        [HttpGet]
        public PartialViewResult EditMainPV(int id)
        {
            Location location = UnitOfWork.repoLocations.Find(id);
            return PartialView("_EditMain", location);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditMainPV([Bind(Include = "ID,Title,IsActive")] Location location)
        {
            if (ModelState.IsValid)
            {
                UnitOfWork.repoLocations.EditMain(location.ID, location.Title, location.isActive);
            }
            else
            {
                return Content("Error");
            }
            return Content("Ok");
        }
        #endregion

        #region Edit : GeoLocation
        [HttpGet]
        public PartialViewResult EditGeoLocationPV(int id)
        {
            Location location = UnitOfWork.repoLocations.Find(id);
            return PartialView("_EditGeoLocation", location);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditGeoLocationPV([Bind(Include = "ID,LongitudeY,LatitudeX")] Location location)
        {
            if (ModelState.IsValid)
            {
                UnitOfWork.repoLocations.EditGeoLocation(location.ID, location.LongitudeY, location.LatitudeX);
            }
            else
            {
                return Content("Error");
            }
            return Content("Ok");
        }
        #endregion

        #endregion

        #endregion

        #region LookUP
        #region Lookup Main Div
        [HttpGet]
        public PartialViewResult LookupPV(string searchfor = null, int page = 1, int recordsperpage = 0)
        {
            PagedList.IPagedList locs = UnitOfWork.repoLocations.GetPagedList("", 1, 10);
            return PartialView("lookup/Index", locs);
        }
        #endregion
        #region Lookup List Div
        [HttpGet]
        public PartialViewResult LookupListPV(string searchfor = null, int page = 1, int recordsperpage = 0)
        {
            PagedList.IPagedList locs = UnitOfWork.repoLocations.GetPagedList(searchfor, page, Config.DefaultRecordsPerChild);
            return PartialView("lookup/List", locs);
        }
        #endregion
        #endregion



        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
