using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DynThings.Core;
using DynThings.Data.Models;
using DynThings.Data.Repositories;
using PagedList;

namespace DynThings.WebPortal.Controllers
{
    public class AppsController : BaseController
    {
        UnitOfWork_Repositories uof_repos = new UnitOfWork_Repositories();

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
            App app = uof_repos.repoApps.Find(id);
            return View(app);
        }

        #endregion

        #region PartialViewResult: Partial Views
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
            PagedList.IPagedList apps = uof_repos.repoApps.GetPagedList(searchfor, page, Helpers.Configs.validateRecordsPerMaster(recordsperpage));
            return PartialView("_List", apps);
        }
        #endregion

        #region DetailsPV : Main
        /// <summary>
        /// Return App main details
        /// </summary>
        /// <param name="id">App ID</param>
        /// <returns>App Object</returns>
        public PartialViewResult DetailsPV(int id)
        {
            App app = uof_repos.repoApps.Find(id);
            return PartialView("_Details_Main", app);
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
                res = uof_repos.repoApps.Add(app.Title, app.Description, currentUser.Id);
                App addedApp = uof_repos.repoApps.Find(res.Reference);
                System.IO.Directory.CreateDirectory(Request.PhysicalApplicationPath + "Imgs/Apps/" + addedApp.GUID.ToString());
                System.IO.Directory.CreateDirectory(Request.PhysicalApplicationPath + "Imgs/Apps/" + addedApp.GUID.ToString() + "/MediaFiles");
                System.IO.File.Copy(Request.PhysicalApplicationPath + "Imgs/Apps/default.jpg", Request.PhysicalApplicationPath + "Imgs/Apps/" + addedApp.GUID.ToString() + "/logo.jpg");
                return Json(res);
            }
            return Json(res);
        }
        #endregion

        #region EditPV
        [HttpGet]
        public PartialViewResult EditPV(long id)
        {
            App app = uof_repos.repoApps.Find(id);
            return PartialView("_EditMain", app);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditPV([Bind(Include = "ID,Title,Description,StatusID,Version")] App app)
        {
            ResultInfo.Result res = ResultInfo.GetResultByID(1);
            if (ModelState.IsValid)
            {
                res = uof_repos.repoApps.EditMain(app.ID, app.Title, app.Description, app.StatusID, app.Version);
                return Json(res);
            }
            return Json(res);
        }
        #endregion

        #region DeletePV
        [HttpGet]
        public PartialViewResult DeletePV(long id)
        {
            App app = uof_repos.repoApps.Find(id);
            return PartialView("_Delete", app);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult DeletePV([Bind(Include = "ID")] App app)
        {
            ResultInfo.Result res = ResultInfo.GetResultByID(1);
            if (ModelState.IsValid)
            {
                res = uof_repos.repoApps.Delete(app.ID);
                return Json(res);
            }
            return Json(res);
        }
        #endregion


        #region ApiEntitysListPV
        [HttpGet]
        public PartialViewResult AppApiEntitysListGridPV(string searchfor = null, long appID = 0, int page = 1, int recordsperpage = 25)
        {
            IPagedList views = uof_repos.repoApps.GetAppAPIEntitysPagedList(searchfor, appID, page, Helpers.Configs.validateRecordsPerMaster(recordsperpage));
            return PartialView("_ApiEntitysList", views);
        }
        #endregion

        #region Attach AppApiEntity
        [HttpGet]
        public PartialViewResult AppApiEntityAttachPV(long appID)
        {
            ViewBag.SystemEntityID = new SelectList(uof_repos.repoEntitys.GetList(), "ID", "Title", 1);
            AppAPIEntity appAPIEntity = new AppAPIEntity();
            appAPIEntity.AppID = appID;
            return PartialView("_ApiEntityAttach", appAPIEntity);
        }

        [HttpPost]
        public ActionResult AppApiEntityAttachPV([Bind(Include = "AppID,SystemEntityID")] AppAPIEntity appAPIEntity)
        {
            ResultInfo.Result res = ResultInfo.GetResultByID(1);
            res = uof_repos.repoApps.AttachAppAPIEntity(appAPIEntity.AppID, appAPIEntity.SystemEntityID);
            return Json(res);
        }
        #endregion
        #region Deattach AppApiEntity
        [HttpGet]
        public PartialViewResult AppApiEntityDeattachPV(long appID, long systemEntityID)
        {
            AppAPIEntity appApiEntity = uof_repos.repoApps.FindAppApiEntity(appID, systemEntityID);
            return PartialView("_ApiEntityDeAttach", appApiEntity);
        }

        [HttpPost]
        public ActionResult AppApiEntityDeattachPV([Bind(Include = "AppID,SystemEntityID")] AppAPIEntity appAPIEntity)
        {
            ResultInfo.Result res = ResultInfo.GetResultByID(1);
            if (ModelState.IsValid)
            {
                res = uof_repos.repoApps.DeAttachAppAPIEntity(appAPIEntity.AppID, appAPIEntity.SystemEntityID);
                return Json(res);
            }
            return Json(res);
        }
        #endregion
        #endregion


    }
}