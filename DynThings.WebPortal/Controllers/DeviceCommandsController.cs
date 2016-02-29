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
    public class DeviceCommandsController : Controller
    {
        #region ActionResult: Views
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Details(long id)
        {
            DeviceCommand cmd = UnitOfWork.repoDeviceCommands.Find(id);
            return View(cmd);
        }
        #endregion

        #region PartialViewResult: Partial Views

        #region DetailsPV
        public PartialViewResult DetailsPV(long id)
        {
            DeviceCommand command = UnitOfWork.repoDeviceCommands.Find(id);
            return PartialView("_Details_Main", command);
        }

        #endregion

        #region ListPV
        //Get List All
        [HttpGet]
        public PartialViewResult ListPV(string searchfor = null, int page = 1, int recordsperpage = 0)
        {
            PagedList.IPagedList cmds = UnitOfWork.repoDeviceCommands.GetPagedList(searchfor, page, Helpers.Configs.validateRecordsPerMaster(recordsperpage));
            return PartialView("_List", cmds);
        }

        //Get List by DeviceID
        [HttpGet]
        public PartialViewResult ListByDeviceIDPV(string searchfor = null, long deviceID = 0, int page = 1, int recordsperpage = 0)
        {
            PagedList.IPagedList cmds = UnitOfWork.repoDeviceCommands.GetPagedListByDeviceID(searchfor, deviceID, page, Helpers.Configs.validateRecordsPerMaster(recordsperpage));
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
        public ActionResult AddPV([Bind(Include = "Title,DeviceID,Description,CommandCode")] DeviceCommand command)
        {
            long cmd = long.Parse(command.DeviceID.ToString());
            UnitOfWork.repoDeviceCommands.Add(command.Title, long.Parse(command.DeviceID.ToString()), command.Description, command.CommandCode, "1");
            return Content("Ok");
        }
        #endregion

        #region EditPV
        [HttpGet]
        public PartialViewResult EditPV(long id)
        {
            DeviceCommand Command = UnitOfWork.repoDeviceCommands.Find(id);
            ViewBag.DeviceID = new SelectList(UnitOfWork.repoDevices.GetList(), "ID", "Title", Command.DeviceID);
            return PartialView("_Edit", Command);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditPV([Bind(Include = "ID,Title,Description,DeviceID,CommandCode")] DeviceCommand Command)
        {
            if (ModelState.IsValid)
            {
                UnitOfWork.repoDeviceCommands.Edit(Command.ID, Command.Title, Command.Description, long.Parse(Command.DeviceID.ToString()), Command.CommandCode);
                return Content("Ok");
            }
            return Content("Failed");
        }
        #endregion

        #region ExecutePV

        #endregion
        [HttpGet]
        public PartialViewResult ExecutePV(long id)
        {
            DeviceCommand Command = UnitOfWork.repoDeviceCommands.Find(id);
            return PartialView("_Execute", Command);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ExecutePV([Bind(Include = "ID,DeviceID")] DeviceCommand Command)
        {
            if (ModelState.IsValid)
            {
                Device dev = UnitOfWork.repoDevices.Find((long) Command.DeviceID);
                UnitOfWork.repoDeviceCommands.Execute(Command.ID,Guid.Parse(dev.KeyPass.ToString()),User.Identity.ToString());
                return Content("Ok");
            }
            return Content("Failed");
        }
        #endregion



    }
}