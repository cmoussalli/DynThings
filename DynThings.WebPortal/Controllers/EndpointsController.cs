/////////////////////////////////////////////////////////////////
// Created by : Caesar Moussalli                               //
// TimeStamp  : 31-1-2016                                      //
// Content    : Handel the Endpoints Actions                  //
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
            PagedList.IPagedList ends = UnitOfWork.repoEndpoints.GetPagedList(searchfor, page, Helpers.Configs.validateRecordsPerMaster(recordsperpage));
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
            ResultInfo.Result res = UnitOfWork.repoEndpoints.Add(endpoint.Title, endpoint.TypeID, endpoint.DeviceID);
            return Json(res);
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
            ResultInfo.Result res = UnitOfWork.repoEndpoints.Edit(endpoint.ID, endpoint.Title, endpoint.TypeID);
            return Json(res);
        }
        #endregion


        #region EndPoint History
        [HttpGet]
        public PartialViewResult GetPVEndPointHistory(long endPointID, int page = 1, int recordsperpage = 0)
        {
            IPagedList IOs = UnitOfWork.repoEndpointIOs.GetPagedList(endPointID, page, Helpers.Configs.validateRecordsPerChild(Config.DefaultRecordsPerChild));
            return PartialView("_EndPointHistory", IOs);

        }

        //[HttpGet]
        //public PartialViewResult GetPVEndPointHistory(long endPointID,int page= 1,int recordsperpage = 0)
        //{
        //    IPagedList IOs = UnitOfWork.repoEndpointIOs.GetPagedList("",endPointID,1, page, Helpers.Configs.validateRecordsPerChild(Config.DefaultRecordsPerChild));
        //    return PartialView("_EndPointHistory", IOs);

        //}
        #endregion

        #region EndPoint Commands
        [HttpGet]
        public PartialViewResult EndPointCommandsListByEndPointIDPV(string searchfor = null, long EndPointID = 0, int page = 1, int recordsperpage = 0)
        {
            PagedList.IPagedList cmds = UnitOfWork.repoEndPointCommands.GetPagedListByEndPointID(searchfor, EndPointID, page, Helpers.Configs.validateRecordsPerMaster(recordsperpage));
            return PartialView("_Details_Commands", cmds);
        }
        #endregion

        #endregion


        #region LookUP
        #region Lookup Main Div
        [HttpGet]
        public PartialViewResult LookupPV(string searchfor = null, int page = 1, int recordsperpage = 0)
        {
            PagedList.IPagedList ends = UnitOfWork.repoEndpoints.GetPagedList("", 1, 10);
            return PartialView("lookup/Index", ends);
        }
        #endregion
        #region Lookup List Div
        [HttpGet]
        public PartialViewResult LookupListPV(string searchfor = null, int page = 1, int recordsperpage = 0)
        {
            PagedList.IPagedList ends = UnitOfWork.repoEndpoints.GetPagedList(searchfor, page, Config.DefaultRecordsPerChild);
            return PartialView("lookup/List", ends);
        }
        #endregion
        #endregion

    }
}
