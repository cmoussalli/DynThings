using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using DynThings.WebPortal;
using DynThings.WebPortal.Models;
using DynThings.WebPortal.Models.ViewModels;


namespace DynThings.WebPortal.Controllers
{
    public class MonitorController : Controller
    {
        private DynThingsEntities db = new DynThingsEntities();

        [HttpGet]
        public ActionResult MonitorViewsList()
        {
            List<LocationView> locationViews = db.LocationViews.ToList();
            List<Monitor> monitors = new List<Monitor>();

            foreach (LocationView view in locationViews)
            {
            Monitor monit = GetMonitor(view);
                monitors.Add(monit);
            }

            return View(monitors);


        }

        // GET: Monitor
        public ActionResult MonitorView(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LocationView locationView = db.LocationViews.Find(id);


            if (locationView == null)
            {
                return HttpNotFound();
            }

            Monitor monitor = GetMonitor(locationView);

            return View(monitor);


        }

        [HttpGet]
        public PartialViewResult GetPVMonitorMap(int id)
        {
            LocationView locationView = db.LocationViews.Find(id);
            Monitor monitor = GetMonitor(locationView);

            return PartialView("_MonitorViewMap", monitor);
        }

       
        [HttpGet]
        public PartialViewResult GetPVMonitorLocation(int id)
        {
            Location location = db.Locations.Find(id);
            MonitorLocation monitorLocation = GetMonitorLocation(location);

            return PartialView("_MonitorLocation", monitorLocation);
        }

        [HttpGet]
        public PartialViewResult GetPVMonitorEndPointActions(Guid guid)
        {
            Endpoint endPoint = db.Endpoints.First(e=> e.GUID == guid);
            MonitorEndPoint monitorEndPoint = GetMonitorEndPoint(endPoint);

            return PartialView("_MonitorEndPointActions", monitorEndPoint);
        }



        #region Helpers: Models to ViewModels 
        private Monitor GetMonitor(LocationView locationView)
        {
            Monitor monit = new Monitor();

            //Fill Monitor values
            monit.ID = locationView.ID;
            monit.Title = locationView.Title;
            monit.IsActive = (bool)locationView.IsActive;
            monit.locationViewType = locationView.LocationViewType;
            monit.OwnerID = locationView.OwnerID;
            monit.X = locationView.X;
            monit.Y = locationView.Y;
            monit.Z = locationView.Z;


            List<LinkLocationsLocationView> linksLocations = db.LinkLocationsLocationViews.Where(l => l.LocationViewID == locationView.ID).ToList();
            List<long> ids = new List<long>();
            foreach (LinkLocationsLocationView lnk in linksLocations)
            {
                ids.Add((long)lnk.LocationID);
            }

            monit.MLocations = db.Locations.Where(l => l.ID > 0 && ids.Contains(l.ID)).ToList();

            return monit;
        }

        private MonitorLocation GetMonitorLocation(Location location)
        {
            MonitorLocation monitLocation = new MonitorLocation();

            //Fill MonitorLocation values
            monitLocation.ID = location.ID;
            monitLocation.GUID = location.GUID;
            monitLocation.Title = location.Title;
            monitLocation.LongitudeY = location.LongitudeY;
            monitLocation.LatitudeX = location.LatitudeX;
            monitLocation.isActive = location.isActive;
            monitLocation.Status = location.Status;
            monitLocation.IconID = location.IconID;


            List<LinkEndpointsLocation> linksEndPoints = db.LinkEndpointsLocations.Where(l => l.LocationID == location.ID).ToList();
            List<long> ids = new List<long>();
            foreach (LinkEndpointsLocation lnk in linksEndPoints)
            {
                ids.Add((long)lnk.EndpointID);
            }

            monitLocation.endPoints = db.Endpoints.Where(e => e.ID > 0 && ids.Contains(e.ID)).ToList();

            return monitLocation;
        }

        private MonitorEndPoint GetMonitorEndPoint(Endpoint endPoint)
        {
            MonitorEndPoint monitEndPoint= new MonitorEndPoint();

            //Fill MonitorEndPoint values
            monitEndPoint.ID = endPoint.ID;
            monitEndPoint.GUID = endPoint.GUID;
            monitEndPoint.Title = endPoint.Title;
            monitEndPoint.KeyPass = endPoint.KeyPass;
            monitEndPoint.PinCode = endPoint.PinCode;
            monitEndPoint.TypeID = endPoint.TypeID;
            monitEndPoint.cssColor = endPoint.CssColor;


            //List<LinkEndpointsLocation> linksEndPoints = db.LinkEndpointsLocations.Where(l => l.LocationID == location.ID).ToList();
            //List<long> ids = new List<long>();
            //foreach (LinkEndpointsLocation lnk in linksEndPoints)
            //{
            //    ids.Add((long)lnk.EndpointID);
            //}

            monitEndPoint.endPointIOs = db.EndPointIOs.Where(e => e.EndPointID == endPoint.ID).OrderByDescending(e => e.TimeStamp).ToList();

            return monitEndPoint;
        }

        #endregion
    }


}