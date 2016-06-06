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

namespace DynThings.WebPortal.Controllers
{
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
        public PartialViewResult GetPVDynUserRoles(string DynUserID)
        {
            List<AspNetRole> rols = Data.Repositories.UnitOfWork_Repositories.repoRoles.GetListByUserID(DynUserID);
            return PartialView("_Details_Roles", rols);

        }

        
        #endregion


        #endregion


    }
}
