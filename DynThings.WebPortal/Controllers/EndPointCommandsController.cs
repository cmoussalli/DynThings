using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DynThings.Data.Models;
using DynThings.Data.Repositories;
using DynThings.Core;

namespace DynThings.WebPortal.Controllers
{
    public class EndPointCommandsController : Controller
    {
        #region ActionResult: Views
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Details(long id)
        {
            EndPointCommand cmd = UnitOfWork.repoEndPointCommands.Find(id);
            return View(cmd);
        }
        #endregion

        #region PartialViewResult: Partial Views

        #region DetailsPV
        public PartialViewResult DetailsPV(long id)
        {
            EndPointCommand command = UnitOfWork.repoEndPointCommands.Find(id);
            return PartialView("_Details_Main", command);
        }

        #endregion

        #region ListPV
        //Get List All
        [HttpGet]
        public PartialViewResult ListPV(string searchfor = null, int page = 1, int recordsperpage = 0)
        {
            PagedList.IPagedList cmds = UnitOfWork.repoEndPointCommands.GetPagedList(searchfor, page, Helpers.Configs.validateRecordsPerMaster(recordsperpage));
            return PartialView("_List", cmds);
        }

        //Get List by EndPointID
        [HttpGet]
        public PartialViewResult ListByEndPointIDPV(string searchfor = null, long EndPointID = 0, int page = 1, int recordsperpage = 0)
        {
            PagedList.IPagedList cmds = UnitOfWork.repoEndPointCommands.GetPagedListByEndPointID(searchfor, EndPointID, page, Helpers.Configs.validateRecordsPerMaster(recordsperpage));
            return PartialView("_List", cmds);
        }
        #endregion

        #region AddPV
        [HttpGet]
        public PartialViewResult AddPV()
        {
            ViewBag.EndPointID = new SelectList(UnitOfWork.repoEndpoints.GetList(), "ID", "Title");
            return PartialView("_Add");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddPV([Bind(Include = "Title,EndPointID,Description,CommandCode")] EndPointCommand command)
        {
            long cmd = long.Parse(command.EndPointID.ToString());
            UnitOfWork.repoEndPointCommands.Add(command.Title, long.Parse(command.EndPointID.ToString()), command.Description, command.CommandCode, "1");
            return Content("Ok");
        }
        #endregion

        #region EditPV
        [HttpGet]
        public PartialViewResult EditPV(long id)
        {
            EndPointCommand Command = UnitOfWork.repoEndPointCommands.Find(id);
            ViewBag.EndPointID = new SelectList(UnitOfWork.repoEndpoints.GetList(), "ID", "Title", Command.EndPointID);
            return PartialView("_Edit", Command);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditPV([Bind(Include = "ID,Title,Description,EndPointID,CommandCode")] EndPointCommand Command)
        {
            if (ModelState.IsValid)
            {
                UnitOfWork.repoEndPointCommands.Edit(Command.ID, Command.Title, Command.Description, long.Parse(Command.EndPointID.ToString()), Command.CommandCode);
                return Content("Ok");
            }
            return Content("Failed");
        }
        #endregion

        #region ExecutePV
        [HttpGet]
        public PartialViewResult ExecutePV(long id)
        {
            EndPointCommand Command = UnitOfWork.repoEndPointCommands.Find(id);
            return PartialView("_Execute", Command);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ExecutePV([Bind(Include = "ID,EndPointID")] EndPointCommand Command)
        {
            if (ModelState.IsValid)
            {
                Endpoint end = UnitOfWork.repoEndpoints.Find((long)Command.EndPointID);
                UnitOfWork.repoEndPointCommands.Execute(Command.ID, Guid.Parse(end.KeyPass.ToString()), User.Identity.ToString());
                return Content("Ok");
            }
            return Content("Failed");
        }
        #endregion

        #endregion
    }
}