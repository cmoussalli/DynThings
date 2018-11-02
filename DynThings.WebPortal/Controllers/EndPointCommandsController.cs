using System;
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
    public class EndPointCommandsController : BaseController
    {
        UnitOfWork_Repositories uof_repos = new UnitOfWork_Repositories();

        #region ActionResult: Views
        public ActionResult Index()
        {
            if (ValidateUserPermissions(true, false) == false)
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
            EndPointCommand cmd = uof_repos.repoEndPointCommands.Find(id);
            return View(cmd);
        }
        #endregion

        #region PartialViewResult: Partial Views

        #region DetailsPV
        public PartialViewResult DetailsPV(long id)
        {
            EndPointCommand command = uof_repos.repoEndPointCommands.Find(id);
            return PartialView("_Details_Main", command);
        }

        #endregion

        #region ListPV
        //Get List All
        [HttpGet]
        public PartialViewResult ListPV(string searchfor = null, int page = 1, int recordsperpage = 0)
        {
            PagedList.IPagedList cmds = uof_repos.repoEndPointCommands.GetPagedList(searchfor, page, Helpers.Configs.validateRecordsPerMaster(recordsperpage));
            return PartialView("_List", cmds);
        }

        //Get List by EndPointID
        [HttpGet]
        public PartialViewResult ListByEndPointIDPV(string searchfor = null, long EndPointID = 0, int page = 1, int recordsperpage = 0)
        {
            PagedList.IPagedList cmds = uof_repos.repoEndPointCommands.GetPagedListByEndPointID(searchfor, EndPointID, page, Helpers.Configs.validateRecordsPerMaster(recordsperpage));
            return PartialView("_List", cmds);
        }
        #endregion

        #region AddPV
        [HttpGet]
        public PartialViewResult AddPV()
        {
            ViewBag.EndPointID = new SelectList(uof_repos.repoEndpoints.GetList(), "ID", "Title");
            return PartialView("_Add");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddPV([Bind(Include = "Title,EndPointID,Description,CommandCode")] EndPointCommand command)
        {
            Result res = Result.GenerateFailedResult();
            if (ModelState.IsValid)
            {
                long cmd = long.Parse(command.EndPointID.ToString());
                res = uof_repos.repoEndPointCommands.Add(command.Title, long.Parse(command.EndPointID.ToString()), command.Description, command.CommandCode, "1");
                return Json(res);
            }
            return Json(res);
        }
        #endregion

        #region EditPV
        [HttpGet]
        public PartialViewResult EditPV(long id)
        {
            EndPointCommand Command = uof_repos.repoEndPointCommands.Find(id);
            ViewBag.EndPointID = new SelectList(uof_repos.repoEndpoints.GetList(), "ID", "Title", Command.EndPointID);
            return PartialView("_Edit", Command);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditPV([Bind(Include = "ID,Title,Description,EndPointID,CommandCode")] EndPointCommand Command)
        {
            Result res = Result.GenerateFailedResult();
            if (ModelState.IsValid)
            {
                res = uof_repos.repoEndPointCommands.Edit(Command.ID, Command.Title, Command.Description, long.Parse(Command.EndPointID.ToString()), Command.CommandCode);
                return Json(res);
            }
            return Json(res);
        }
        #endregion

        #region DeletePV
        [HttpGet]
        public PartialViewResult DeletePV(long id)
        {
            EndPointCommand Command = uof_repos.repoEndPointCommands.Find(id);
            ViewBag.EndPointID = new SelectList(uof_repos.repoEndpoints.GetList(), "ID", "Title", Command.EndPointID);
            return PartialView("_Delete", Command);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult DeletePV([Bind(Include = "ID,Title,Description,EndPointID")] EndPointCommand Command)
        {
            Result res = Result.GenerateFailedResult();
            if (ModelState.IsValid)
            {
                res = uof_repos.repoEndPointCommands.Detele(Command.ID);
                return Json(res);
            }
            return Json(res);
        }
        #endregion

        #region ExecutePV
        [HttpGet]
        public PartialViewResult ExecutePV(long id)
        {
            EndPointCommand Command = uof_repos.repoEndPointCommands.Find(id);
            return PartialView("_Execute", Command);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ExecutePV([Bind(Include = "ID,EndPointID,CommandCode")] EndPointCommand Command)
        {
            Result res = Result.GenerateFailedResult();
            if (ModelState.IsValid)
            {
                res = uof_repos.repoEndPointCommands.Execute(Command.ID,Command.CommandCode, User.Identity.ToString());
                return Json(res);
            }
            return Json(res);
        }
        #endregion

        #endregion
    }
}