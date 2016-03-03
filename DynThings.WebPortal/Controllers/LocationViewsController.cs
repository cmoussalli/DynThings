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
    public class LocationViewsController : Controller
    {
        #region ActionResult: Views

        #region Get LocationViews List
        [HttpGet]
        public ActionResult Index()
        {
            //IPagedList views = UnitOfWork.repoLocationViews.GetPagedList("", 1, 5);
            return View();
        }
        #endregion

        #region Find
        public ActionResult Monitor(long id)
        {
            LocationView locationView = UnitOfWork.repoLocationViews.Find(id);
            return View("MonitorView", locationView);
        }
        #endregion
        #endregion

        #region Get Partial Views

        #region ListPV
        [HttpGet]
        public PartialViewResult ListCardsPV(string searchfor = null, int page = 1, int recordsperpage = 0)
        {
            IPagedList views = UnitOfWork.repoLocationViews.GetPagedList(searchfor, page, Helpers.Configs.validateRecordsPerMaster(recordsperpage));
            return PartialView("_ListCards", views);
        }

        [HttpGet]
        public PartialViewResult ListGridPV(string searchfor = null, int page = 1, int recordsperpage = 0)
        {
            IPagedList views = UnitOfWork.repoLocationViews.GetPagedList(searchfor, page, Helpers.Configs.validateRecordsPerMaster(recordsperpage));
            return PartialView("_ListGrid", views);
        }
        #endregion

        #region AddPV
        [HttpGet]
        public PartialViewResult AddPV()
        {
            ViewBag.LocationViewTypeID = new SelectList(UnitOfWork.repoLocationViewTypes.GetList(), "ID", "Title",1);
            return PartialView("_Add");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddPV([Bind(Include = "Title,LocationViewTypeID")] LocationView locationView)
        {
            UnitOfWork.repoLocationViews.Add(locationView.Title, locationView.LocationViewTypeID,"1");
            return Content("Ok");
        }
        #endregion

        #region EditPV
        [HttpGet]
        public PartialViewResult EditTitlePV(long id)
        {
            LocationView locationView = UnitOfWork.repoLocationViews.Find(id);
            return PartialView("_EditTitle", locationView);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditTitlePV([Bind(Include = "ID,Title,TypeID,DeviceID")] LocationView locationView)
        {
            if (ModelState.IsValid)
            {
                UnitOfWork.repoLocationViews.Edit(locationView.ID, locationView.Title,"1");
                return Content("Ok");
            }
            return Content("Failed");
        }
        #endregion

        #region Monitor Components
        [HttpGet]
        public PartialViewResult GetPVLocationViewMap(int id)
        {
            LocationView locationView = UnitOfWork.repoLocationViews.Find(id);
            return PartialView("_LocationViewMap", locationView);
        }


        [HttpGet]
        public PartialViewResult GetPVLocationViewLocation(int id)
        {
            Location location = UnitOfWork.repoLocations.Find(id);
            return PartialView("_Location", location);
        }


        [HttpGet]
        public PartialViewResult GetPVLocationViewEndPointMain(Guid guid)
        {
            Endpoint endPoint = UnitOfWork.repoEndpoints.Find(guid);
            return PartialView("_EndPointMain", endPoint);
        }

        [HttpGet]
        public PartialViewResult GetPVLocationViewEndPointHistory(Guid guid)
        {
            IPagedList IOs = UnitOfWork.repoEndpointIOs.GetPagedList(guid, 1, 3);
            return PartialView("_EndPointHistory", IOs);
        }
        

        [HttpGet]
        public PartialViewResult GetPVLocationViewEndPointCommands(Guid guid)
        {
            IPagedList endCmds = UnitOfWork.repoEndPointCommands.GetPagedListByEndPointGUID("",guid,1,0);
            return PartialView("_EndPointCommands", endCmds);
        }
        #endregion



#endregion







    }
}
