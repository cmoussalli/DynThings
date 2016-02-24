using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DynThings.Data.Models;
using DynThings.Data.Repositories;
using DynThings.Data.Configurations;

namespace DynThings.WebPortal.Controllers
{
    public class CommandsController : Controller
    {
        #region ActionResult: Views
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Details(long id)
        {
            Command cmd = UnitOfWork.repoCommands.Find(id);
            return View(cmd);
        }
        #endregion

        #region PartialViewResult: Partial Views
        #region DetailsPV
        public PartialViewResult DetailsPV(long id)
        {
            Command command = UnitOfWork.repoCommands.Find(id);
            return PartialView("_Details_Main", command);
        }

        #endregion

        #region ListPV
        //Get List All
        [HttpGet]
        public PartialViewResult ListPV(string searchfor = null, int page = 1, int recordsperpage = 0)
        {
            PagedList.IPagedList cmds = UnitOfWork.repoCommands.GetPagedList(searchfor, page, Helpers.Configs.validateRecordsPerMaster(recordsperpage));
            return PartialView("_List", cmds);
        }

        //Get List by DeviceID
        [HttpGet]
        public PartialViewResult ListByDeviceIDPV(string searchfor = null,long deviceID = 0, int page = 1, int recordsperpage = 0)
        {
            PagedList.IPagedList cmds = UnitOfWork.repoCommands.GetPagedListByDeviceID(searchfor,deviceID, page, Helpers.Configs.validateRecordsPerMaster(recordsperpage));
            return PartialView("_List", cmds);
        }
        #endregion

        #region AddPV
        [HttpGet]
        public PartialViewResult AddPV()
        {
            ViewBag.DeviceID = new SelectList(UnitOfWork.repoDevices.GetList(), "ID", "Title");
            return PartialView("_Add");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddPV([Bind(Include = "Title,DeviceID,Description,CommandCode")] Command command)
        {
            long cmd = long.Parse (command.DeviceID.ToString());
            UnitOfWork.repoCommands.Add(command.Title,long.Parse(command.DeviceID.ToString()),command.Description,command.CommandCode,"1");
            return Content("Ok");
        }
        #endregion

        #region EditPV
        [HttpGet]
        public PartialViewResult EditPV(long id)
        {
            Command Command = UnitOfWork.repoCommands.Find(id);
            ViewBag.DeviceID = new SelectList(UnitOfWork.repoDevices.GetList(), "ID", "Title", Command.DeviceID);
            return PartialView("_Edit", Command);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditPV([Bind(Include = "ID,Title,Description,CommandCode")] Command Command)
        {
            if (ModelState.IsValid)
            {
                UnitOfWork.repoCommands.Edit(Command.ID, Command.Title, Command.Description,Command.CommandCode);
                return Content("Ok");
            }
            return Content("Failed");
        }
        #endregion

        #endregion



    }
}