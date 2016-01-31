using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using DynThings.WebPortal;
using DynThings.Data.Models;
using DynThings.Data.Repositories;

namespace DynThings.WebPortal.Controllers
{
    public class MonitorController : Controller
    {
        private DynThingsEntities db = new DynThingsEntities();
        public LocationViewsRepository repoLocationViews = new LocationViewsRepository();
        public LocationsRepository repoLocations = new LocationsRepository();

        [HttpGet]
        public ActionResult MonitorViewsList()
        {
            List<LocationView> monitors = repoLocationViews.GetAll();
            return View(monitors);
        }

        // GET: Monitor
        public ActionResult MonitorView(long id)
        {
            LocationView monitor = repoLocationViews.Find(id);
            return View(monitor);
        }

        [HttpGet]
        public PartialViewResult GetPVMonitorMap(int id)
        {
            LocationView monitor = repoLocationViews.Find(id);
            return PartialView("_MonitorViewMap", monitor);
        }


        [HttpGet]
        public PartialViewResult GetPVMonitorLocation(int id)
        {
            Location location = repoLocations.Find(id);
            return PartialView("_MonitorLocation", location);
        }

        //[HttpGet]
        //public PartialViewResult GetPVMonitorEndPointHistory(Guid guid)
        //{
        //    Endpoint endPoint = db.Endpoints.First(e=> e.GUID == guid);
        //    MonitorEndPoint monitorEndPoint = GetMonitorEndPoint(endPoint);

        //    return PartialView("_MonitorEndPointHistory", monitorEndPoint);
        //}

        //[HttpGet]
        //public PartialViewResult GetPVMonitorEndPointMain(Guid guid)
        //{
        //    Endpoint endPoint = db.Endpoints.First(e => e.GUID == guid);
        //    MonitorEndPoint monitorEndPoint = GetMonitorEndPoint(endPoint);

        //    return PartialView("_MonitorEndPointMain", monitorEndPoint);
        //}





    }


}