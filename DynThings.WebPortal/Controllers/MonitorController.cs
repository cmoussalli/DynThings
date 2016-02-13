/////////////////////////////////////////////////////////////////
// Created by : Caesar Moussalli                               //
// TimeStamp  : 31-1-2016                                      //
// Content    : Handel the Monitor Actions                     //
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
using DynThings.WebPortal;
using DynThings.Data.Models;
using DynThings.Data.Repositories;
using PagedList;

namespace DynThings.WebPortal.Controllers
{
    public class MonitorController : Controller
    {
        #region Get Monitors List
        [HttpGet]
        public ActionResult MonitorViewsList()
        {
            List<LocationView> monitors = UnitOfWork.repoLocationViews.GetList();
            return View(monitors);
        }
        #endregion

        #region Get Monitor
        public ActionResult MonitorView(long id)
        {
            LocationView monitor = UnitOfWork.repoLocationViews.Find(id);
            return View(monitor);
        }
        #endregion

        #region Get Partial Views
        [HttpGet]
        public PartialViewResult GetPVMonitorMap(int id)
        {
            LocationView monitor = UnitOfWork.repoLocationViews.Find(id);
            return PartialView("_MonitorViewMap", monitor);
        }


        [HttpGet]
        public PartialViewResult GetPVMonitorLocation(int id)
        {
            Location location = UnitOfWork.repoLocations.Find(id);
            return PartialView("_MonitorLocation", location);
        }

       
        [HttpGet]
        public PartialViewResult GetPVMonitorEndPointMain(Guid guid)
        {
            Endpoint endPoint = UnitOfWork.repoEndpoints.Find(guid);
            return PartialView("_MonitorEndPointMain", endPoint);
        }

        [HttpGet]
        public PartialViewResult GetPVMonitorEndPointHistory(Guid guid)
        {
            IPagedList IOs = UnitOfWork.repoEndpointIOs.GetPagedList(guid,1,5);
            return PartialView("_MonitorEndPointHistory", IOs);
        }

        #endregion


    }


}