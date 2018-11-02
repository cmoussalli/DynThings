﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DynThings.Data.Models;
using DynThings.Data.Repositories;
using DynThings.Core;
using ResultInfo;

namespace DynThings.WebPortal.Controllers
{
    public class DeviceCommandsController : BaseController
    {
        UnitOfWork_Repositories uof_repos = new UnitOfWork_Repositories();

        #region ActionResult: Views
        public ActionResult Index()
        {
            if (ValidateUserPermissions(true,false) == false)
            {
                return RedirectToAction("Login", "Account");
            }
            return View();
        }

        public ActionResult Details(long id)
        {
            if (ValidateUserPermissions(true, false) == false)
            {
                return RedirectToAction("Login", "Account");
            }
            DeviceCommand cmd = uof_repos.repoDeviceCommands.Find(id);
            return View(cmd);
        }
        #endregion

        #region PartialViewResult: Partial Views

        #region DetailsPV
        public PartialViewResult DetailsPV(long id)
        {
            DeviceCommand command = uof_repos.repoDeviceCommands.Find(id);
            return PartialView("_Details_Main", command);
        }

        #endregion

        #region ListPV
        //Get List All
        [HttpGet]
        public PartialViewResult ListPV(string searchfor = null, int page = 1, int recordsperpage = 0)
        {
            PagedList.IPagedList cmds = uof_repos.repoDeviceCommands.GetPagedList(searchfor, page, Helpers.Configs.validateRecordsPerMaster(recordsperpage));
            return PartialView("_List", cmds);
        }

        //Get List by DeviceID
        [HttpGet]
        public PartialViewResult ListByDeviceIDPV(string searchfor = null,long locationID = 0, long deviceID = 0, int page = 1, int recordsperpage = 0)
        {
            PagedList.IPagedList cmds = uof_repos.repoDeviceCommands.GetPagedList(searchfor, deviceID,locationID, page, Helpers.Configs.validateRecordsPerMaster(recordsperpage));
            return PartialView("_List", cmds);
        }
        #endregion

        #region AddPV
        [HttpGet]
        public PartialViewResult AddPV()
        {
            ViewBag.DeviceID = new SelectList(uof_repos.repoDevices.GetList(), "ID", "Title");
            return PartialView("_Add");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddPV([Bind(Include = "Title,DeviceID,Description,CommandCode")] DeviceCommand command)
        {
            Result res = Result.GenerateFailedResult();
            if (ModelState.IsValid)
            {
                long cmd = long.Parse(command.DeviceID.ToString());
                res = uof_repos.repoDeviceCommands.Add(command.Title, long.Parse(command.DeviceID.ToString()), command.Description, command.CommandCode, "1");
            }
            return Json(res) ;
        }
        #endregion

        #region EditPV
        [HttpGet]
        public PartialViewResult EditPV(long id)
        {
            DeviceCommand Command = uof_repos.repoDeviceCommands.Find(id);
            ViewBag.DeviceID = new SelectList(uof_repos.repoDevices.GetList(), "ID", "Title", Command.DeviceID);
            return PartialView("_Edit", Command);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditPV([Bind(Include = "ID,Title,Description,DeviceID,CommandCode")] DeviceCommand Command)
        {
            Result res = Result.GenerateFailedResult();
            if (ModelState.IsValid)
            {
                res = uof_repos.repoDeviceCommands.Edit(Command.ID, Command.Title, Command.Description, long.Parse(Command.DeviceID.ToString()), Command.CommandCode);
                return Json(res);
            }
            return Json(res);
        }
        #endregion

        #region DeletePV
        [HttpGet]
        public PartialViewResult DeletePV(long id)
        {
            DeviceCommand Command = uof_repos.repoDeviceCommands.Find(id);
            ViewBag.DeviceID = new SelectList(uof_repos.repoEndpoints.GetList(), "ID", "Title", Command.DeviceID);
            return PartialView("_Delete", Command);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult DeletePV([Bind(Include = "ID,Title,Description,DeviceID")] DeviceCommand Command)
        {
            Result res = Result.GenerateFailedResult();
            if (ModelState.IsValid)
            {
                res = uof_repos.repoDeviceCommands.Detele(Command.ID);
                return Json(res);
            }
            return Json(res);
        }
        #endregion

        #region ExecutePV


        [HttpGet]
        public PartialViewResult ExecutePV(long id)
        {
            DeviceCommand Command = uof_repos.repoDeviceCommands.Find(id);
            return PartialView("_Execute", Command);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ExecutePV([Bind(Include = "ID,DeviceID")] DeviceCommand Command)
        {
            Result res = Result.GenerateFailedResult();
            if (ModelState.IsValid)
            {
                Device dev = uof_repos.repoDevices.Find((long)Command.DeviceID);
                res = uof_repos.repoDeviceCommands.Execute(Command.ID, Guid.Parse(dev.KeyPass.ToString()), User.Identity.ToString());
                return Json(res);
            }
            return Json(res);
        }
        #endregion

        #endregion



    }
}