using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DynThings.Core;
using DynThings.Data.Models;
using DynThings.Data.Repositories;

namespace DynThings.WebPortal.Controllers
{
    public class AppsController : BaseController
    {
        #region ActionResult: Views
        public ActionResult Index()
        {
            if (ValidateUserPermissions(false, false) == false)
            {
                return RedirectToAction("Login", "Account");
            }
            return View();
        }

        public ActionResult Details(int id)
        {
            if (ValidateUserPermissions(false, false) == false)
            {
                return RedirectToAction("Login", "Account");
            }
            App app = UnitOfWork_Repositories.repoApps.Find(id);
            return View(app);
        }

        #endregion

        #region PartialViewResult: Partial Views
        #region DetailsPV : Main
        /// <summary>
        /// Return App main details
        /// </summary>
        /// <param name="id">App ID</param>
        /// <returns>App Object</returns>
        public PartialViewResult DetailsPV(int id)
        {
            App app = UnitOfWork_Repositories.repoApps.Find(id);
            return PartialView("_Details_Main", app);
        }
        #endregion

        #region ListPV
        /// <summary>
        /// Return list of apps in partial view
        /// </summary>
        /// <param name="searchfor">Search content</param>
        /// <param name="page">Page Number</param>
        /// <param name="recordsperpage">Apps records per page</param>
        /// <returns></returns>
        [HttpGet]
        public PartialViewResult ListPV(string searchfor = null, int page = 1, int recordsperpage = 0)
        {
            PagedList.IPagedList apps = UnitOfWork_Repositories.repoApps.GetPagedList(searchfor, page, Helpers.Configs.validateRecordsPerMaster(recordsperpage));
            return PartialView("_List", apps);
        }
        #endregion


        #region AddPV
        [HttpGet]
        public PartialViewResult AddPV()
        {
            return PartialView("_Add");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddPV([Bind(Include = "Title,Description")] App app)
        {
            ResultInfo.Result res = ResultInfo.GetResultByID(1);
            if (ModelState.IsValid)
            {
                res = UnitOfWork_Repositories.repoApps.Add(app.Title,app.Description,currentUser.Id);
                return Json(res);
            }
            return Json(res);
        }
        #endregion
        #endregion
    }
}