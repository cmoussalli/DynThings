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
using DynThings.Data.Models.ReportsModels;

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
            ResultInfo.Result res = UnitOfWork.resultInfo.GetResultByID(1);
            if (ModelState.IsValid)
            {
                res = UnitOfWork.repoEndpoints.Add(endpoint.Title, endpoint.TypeID, endpoint.DeviceID);
                return Json(res);
            }
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
            ResultInfo.Result res = UnitOfWork.resultInfo.GetResultByID(1);
            if (ModelState.IsValid)
            {
                res = UnitOfWork.repoEndpoints.Edit(endpoint.ID, endpoint.Title, endpoint.TypeID);
                return Json(res);
            }
            return Json(res);
        }
        #endregion

        #region DeletePV
        [HttpGet]
        public PartialViewResult DeletePV(long id)
        {
            Endpoint endpoint = UnitOfWork.repoEndpoints.Find(id);
            return PartialView("_Delete", endpoint);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult DeletePV([Bind(Include = "ID,Title")] Endpoint endpoint)
        {
            ResultInfo.Result res = UnitOfWork.resultInfo.GetResultByID(1);
            if (ModelState.IsValid)
            {
                res = UnitOfWork.repoEndpoints.Delete(endpoint.ID);
                return Json(res);
            }
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

        #region EndPoint Keys
        [HttpGet]
        public PartialViewResult EndPointKeysPV(long id)
        {
            Endpoint endpoint = UnitOfWork.repoEndpoints.Find(id);
            return PartialView("_Details_Keys", endpoint);
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


        #region DataServices
        [HttpGet]
        public ActionResult AVG_Month(long endPointID)
        {
            HighChartsModel hc = new HighChartsModel();
            hc.Title = "Monthly Average";
            hc.SubTitle = "Extra Text Here";


            List<string> xa = new List<string>();
            string xa1 = "Jan";
            string xa2 = "Feb";
            string xa3 = "Mar";
            string xa4 = "Apr";
            xa.Add(xa1);
            xa.Add(xa2);
            xa.Add(xa3);
            xa.Add(xa4);

            hc.XAxisList = xa;
            hc.XAxisList.Add("May");

            hc.ToolTip = "*C";


            yAxis ya = new yAxis { Value = 0, Width = 1, Color = "#808080" };
            List<yAxis> yas = new List<yAxis>();
            yas.Add(ya);
            hc.YAxisList=yas;

            hc.YAxisTitle = "Temprature";

            legend legend = new legend(layout.vertical, hAlign.right, vAlign.middle, 0);
            hc.Legend = legend;

            serie s1 = new serie();
            s1.Name = "Ozaiba";
            

            

            List<int> result = new List<int>();
            int x1 = 11;
            int x2 = 22;
            int x3 = 33;
            int x4 = 22;
            result.Add(x1);
            result.Add(x2);
            result.Add(x3);
            result.Add(x4);

            s1.Data = result;
            List<serie> series = new List<serie>();
            series.Add(s1);

            hc.Series = series ;

            return PartialView("_HighChart",hc);
        }
        #endregion
    }
}
