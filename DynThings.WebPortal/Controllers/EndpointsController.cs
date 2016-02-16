/////////////////////////////////////////////////////////////////
// Created by : Caesar Moussalli                               //
// TimeStamp  : 31-1-2016                                      //
// Content    : Handel the Endpopints Actions                  //
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
using DynThings.Data.Configurations;

namespace DynThings.WebPortal.Controllers
{
    public class EndpointsController : Controller
    {
        #region ActionResult: Views
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Details(long id)
        {
            Endpoint endpoint = UnitOfWork.repoEndpoints.Find(id);
            return View(endpoint);
        }

        #endregion

        #region PartialViewResult: Partial Views

        #region DetailsPV
        public PartialViewResult DetailsPV(long id)
        {
            Endpoint endpoint = UnitOfWork.repoEndpoints.Find(id);
            return PartialView("_Details_Main", endpoint);
        }

        #endregion

        #region ListPV
        [HttpGet]
        public PartialViewResult ListPV(string searchfor = null, int page = 1, int recordsperpage = 0)
        {
            PagedList.IPagedList ends = UnitOfWork.repoEndpoints.GetPagedList(searchfor, page, Helpers.Configs.validateRecordsPerMaster(recordsperpage) );
            return PartialView("_List", ends);
        }
        #endregion

        #region AddPV
        [HttpGet]
        public PartialViewResult AddPV()
        {

            ViewBag.TypeID = new SelectList(UnitOfWork.repoEndpointTypes.GetList(), "ID", "Title", 1);
            ViewBag.DeviceID = new SelectList(UnitOfWork.repoDevices.GetList(), "ID", "Title", 1);
            return PartialView("_Add");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddPV([Bind(Include = "Title,TypeID,DeviceID")] Endpoint endpoint)
        {
            UnitOfWork.repoEndpoints.Add(endpoint.Title, endpoint.TypeID, endpoint.DeviceID);
            return Content("Ok");
        }
        #endregion

        #region EditPV
        [HttpGet]
        public PartialViewResult EditPV(long id)
        {
            Endpoint endpoint = UnitOfWork.repoEndpoints.Find(id);
            ViewBag.TypeID = new SelectList(UnitOfWork.repoEndpointTypes.GetList(), "ID", "Title", endpoint.TypeID);
            ViewBag.DeviceID = new SelectList(UnitOfWork.repoDevices.GetList(), "ID", "Title", endpoint.DeviceID);
            return PartialView("_Edit", endpoint);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditPV([Bind(Include = "ID,Title,TypeID,DeviceID")] Endpoint endpoint)
        {
            if (ModelState.IsValid)
            {
                UnitOfWork.repoEndpoints.Edit(endpoint.ID, endpoint.Title, endpoint.TypeID);
                return RedirectToAction("Index");
            }
            ViewBag.TypeID = new SelectList(UnitOfWork.repoEndpointTypes.GetList(), "ID", "Title", endpoint.TypeID);
            ViewBag.DeviceID = new SelectList(UnitOfWork.repoDevices.GetList(), "ID", "Title", endpoint.DeviceID);
            return View(endpoint);
        }
        #endregion


        #region EndPoint History
        [HttpGet]
        public PartialViewResult GetPVEndPointHistory(Guid guid,int page= 1,int recordsperpage = 0)
        {
            IPagedList IOs = UnitOfWork.repoEndpointIOs.GetPagedList(guid, page, Helpers.Configs.validateRecordsPerChild(Config.DefaultRecordsPerChild));
            return PartialView("_EndPointHistory", IOs);
        }
        #endregion
        
        #endregion


    }
}
