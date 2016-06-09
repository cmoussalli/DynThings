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
    [Authorize(Roles = "Admin")]
    public class DynUsersController : Controller
    {
        #region ActionResult: Views

        #region Get LocationViews List
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }
        #endregion
       

        #region Details
        public ActionResult Details(string id)
        {
            AspNetUser aspUser = UnitOfWork_Repositories.repoDynUsers.Find(id);
            return View("Details", aspUser);
        }
        #endregion

        #endregion

        #region Get Partial Views

        #region ListPV
        [HttpGet]
        public PartialViewResult ListCardsPV(string searchfor = null, int page = 1, int recordsperpage = 0)
        {
            IPagedList views = UnitOfWork_Repositories.repoDynUsers.GetPagedList(searchfor, page, Helpers.Configs.validateRecordsPerMaster(recordsperpage));
            return PartialView("_ListCards", views);
        }

        [HttpGet]
        public PartialViewResult ListGridPV(string searchfor = null, int page = 1, int recordsperpage = 0)
        {
            IPagedList views = UnitOfWork_Repositories.repoDynUsers.GetPagedList(searchfor, page, Helpers.Configs.validateRecordsPerMaster(recordsperpage));
            return PartialView("_ListGrid", views);
        }
        #endregion

        #region DetailsPV
        public PartialViewResult DetailsPV(string  id)
        {
            AspNetUser usr = Data.Repositories.UnitOfWork_Repositories.repoDynUsers.Find(id);
            return PartialView("_Details_Main", usr);
        }

        #endregion



        #region DynUser Roles
        [HttpGet]
        public PartialViewResult GetDynUserRolesPV(string DynUserID)
        {
            List<AspNetRole> rols = Data.Repositories.UnitOfWork_Repositories.repoRoles.GetListByUserID(DynUserID);
            return PartialView("_Details_Roles", rols);

        }
        #endregion

        #region EditComponents
        #region Attach Role
        [HttpGet]
        public PartialViewResult AttachRole(string userID)
        {
            AspNetUser usr = UnitOfWork_Repositories.repoDynUsers.Find(userID);
            ViewBag.RoleID = new SelectList(UnitOfWork_Repositories.repoRoles.GetList(), "ID", "Name", 1);
            return PartialView("_Details_Roles_ADD", usr);

        }

        [HttpPost]
        public ActionResult AttachRole(string userID,string roleID)
        {
            ResultInfo.Result res = ResultInfo.GetResultByID(1);
            if (ModelState.IsValid)
            {
                res = UnitOfWork_Repositories.repoDynUsers.AttachRole(userID,roleID);
                return Json(res);
            }
            return Json(res);

        }
        #endregion

        #region DeAttach Role
        [HttpPost]
        public ActionResult DeAttachRole(string userID, string roleID)
        {
            ResultInfo.Result res = ResultInfo.GetResultByID(1);
            if (ModelState.IsValid)
            {
                res = UnitOfWork_Repositories.repoDynUsers.DeAttachRole(userID, roleID);
                return Json(res);
            }
            return Json(res);

        }
        #endregion

        #endregion

        #endregion

        #region LookUP
        #region Lookup Main Div
        [HttpGet]
        public PartialViewResult LookupPV(string searchfor = null, int page = 1, int recordsperpage = 0)
        {
            PagedList.IPagedList usrs = UnitOfWork_Repositories.repoDynUsers.GetPagedList("", 1, 10);
            return PartialView("lookup/Index", usrs);
        }
        #endregion
        #region Lookup List Div
        [HttpGet]
        public PartialViewResult LookupListPV(string searchfor = null, int page = 1, int recordsperpage = 0)
        {
            PagedList.IPagedList usrs = UnitOfWork_Repositories.repoDynUsers.GetPagedList(searchfor, page, Config.DefaultRecordsPerChild);
            return PartialView("lookup/List", usrs);
        }
        #endregion
        #endregion
    }
}
