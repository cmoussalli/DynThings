using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DynThings.Core;
using DynThings.Data.Models;
using DynThings.Data.Repositories;
using PagedList;
using ResultInfo;

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
            Result res = Result.GenerateFailedResult();
            if (ModelState.IsValid)
            {
                res = uof_repos.repoApps.Add(app.Title, app.Description, currentUser.Id);
                App addedApp = uof_repos.repoApps.Find(long.Parse(res.Reference));
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
            Result res = Result.GenerateFailedResult();
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
            Result res = Result.GenerateFailedResult();
            res = uof_repos.repoApps.Delete(app.ID);
            return Json(res);
        }
        #endregion

        #region PublishPV
        [HttpGet]
        public PartialViewResult PublishPV(long id)
        {
            App app = uof_repos.repoApps.Find(id);
            return PartialView("_Publish", app);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult PublishPV([Bind(Include = "ID")] App app)
        {
            Result res = Result.GenerateFailedResult();
            res = uof_repos.repoApps.Publish(app.ID);

            return Json(res);
        }
        #endregion


        #region ApiEntitysListPV
        [HttpGet]
        public PartialViewResult AppApiEntitysListGridPV(string searchfor = null, long appID = 0, int page = 1, int recordsperpage = 25)
        {
            IPagedList views = uof_repos.repoAppAPIEntitys.GetAppAPIEntitysPagedList(searchfor, appID, page, Helpers.Configs.validateRecordsPerMaster(recordsperpage));
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
            Result res = Result.GenerateFailedResult();
            res = uof_repos.repoApps.AttachAppAPIEntity(appAPIEntity.AppID, appAPIEntity.SystemEntityID);
            return Json(res);
        }
        #endregion
        #region Deattach AppApiEntity
        [HttpGet]
        public PartialViewResult AppApiEntityDeattachPV(long appID, long systemEntityID)
        {
            AppAPIEntity appApiEntity = uof_repos.repoAppAPIEntitys.FindAppApiEntity(appID, systemEntityID);
            return PartialView("_ApiEntityDeAttach", appApiEntity);
        }

        [HttpPost]
        public ActionResult AppApiEntityDeattachPV([Bind(Include = "AppID,SystemEntityID")] AppAPIEntity appAPIEntity)
        {
            Result res = Result.GenerateFailedResult();
            if (ModelState.IsValid)
            {
                res = uof_repos.repoApps.DeAttachAppAPIEntity(appAPIEntity.AppID, appAPIEntity.SystemEntityID);
                return Json(res);
            }
            return Json(res);
        }
        #endregion


        #region AppEndpointTypes ContainerPV
        [HttpGet]
        public PartialViewResult EndpointTypesContainerPV()
        {
            return PartialView("_APP_EndpointTypes_Container");
        }
        #endregion
        #region AppEndpointTypes ListPV
        [HttpGet]
        public PartialViewResult EndpointTypesByAppIDListPV(string searchfor = null, long appID = 0, int page = 1, int recordsperpage = 0)
        {
            IPagedList appEndpointTypes = uof_repos.repoAppEndpointTypes.GetPagedList(searchfor, appID, page, Helpers.Configs.validateRecordsPerMaster(recordsperpage));
            ViewBag.appID = appID;
            ViewBag.searchFor = searchfor;
            return PartialView("_APP_EndpointTypes_List", appEndpointTypes);
        }
        #endregion
        #region AppEndpointTypes AddPV
        [HttpGet]
        public PartialViewResult AddAppEndpointTypePV(int appID)
        {
            AppEndpointType model = new AppEndpointType();
            ViewBag.IconGUID = new SelectList(uof_repos.repoMediaFiles.GetList(), "GUID", "Title", uof_repos.repoMediaFiles.GetList()[0].GUID);
            ViewBag.TypeCategoryID = new SelectList(uof_repos.repoEndpointTypeCategorys.GetList(), "ID", "Title", uof_repos.repoEndpointTypeCategorys.GetList()[0].ID);
            model.AppID = appID;
            return PartialView("_App_EndpointTypes_Add", model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddAppEndpointTypePV(AppEndpointType model)
        {
            Result res = Result.GenerateFailedResult();
            if (ModelState.IsValid)
            {
                res = uof_repos.repoAppEndpointTypes.Add(model.Title, model.Code, Guid.NewGuid(), model.IconGUID,model.Measurement,model.TypeCategoryID, model.AppID, currentUser.Id);
                return Json(res);
            }
            return Json(res);
        }
        #endregion
        #region AppEndpointTypes EditPV
        [HttpGet]
        public PartialViewResult EditAppEndpointTypePV(int appEndpointTypeID)
        {
            AppEndpointType model = uof_repos.repoAppEndpointTypes.Find(appEndpointTypeID);
            ViewBag.IconGUID = new SelectList(uof_repos.repoMediaFiles.GetList(), "GUID", "Title", model.IconGUID);
            ViewBag.TypeCategoryID = new SelectList(uof_repos.repoEndpointTypeCategorys.GetList(), "ID", "Title", model.TypeCategoryID);
            return PartialView("_App_EndpointTypes_Edit", model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditAppEndpointTypePV(AppEndpointType model)
        {
            Result res = Result.GenerateFailedResult();
            if (ModelState.IsValid)
            {
                res = uof_repos.repoAppEndpointTypes.Edit(model.ID, model.Title, model.IconGUID,model.Measurement,model.TypeCategoryID, currentUser.Id);
                return Json(res);
            }
            return Json(res);
        }
        #endregion
        #region AppEndpointTypes DeletePV
        [HttpGet]
        public PartialViewResult DeleteAppEndpointTypePV(int appEndpointTypeID)
        {
            AppEndpointType model = uof_repos.repoAppEndpointTypes.Find(appEndpointTypeID);
            return PartialView("_App_EndpointTypes_Delete", model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteAppEndpointTypePV(AppEndpointType model)
        {
            Result res = Result.GenerateFailedResult();
            if (ModelState.IsValid)
            {
                res = uof_repos.repoAppEndpointTypes.Delete(model.ID, currentUser.Id);
                return Json(res);
            }
            return Json(res);
        }
        #endregion


        #region AppThingTypes ContainerPV
        [HttpGet]
        public PartialViewResult ThingTypesContainerPV()
        {
            return PartialView("_APP_ThingTypes_Container");
        }
        #endregion
        #region AppThingTypes ListPV
        [HttpGet]
        public PartialViewResult ThingTypesByAppIDListPV(string searchfor = null, long appID = 0, int page = 1, int recordsperpage = 0)
        {
            IPagedList appThingTypes = uof_repos.repoAppThingCategorys.GetPagedList(searchfor, appID, page, Helpers.Configs.validateRecordsPerMaster(recordsperpage));
            ViewBag.appID = appID;
            ViewBag.searchFor = searchfor;
            return PartialView("_APP_ThingTypes_List", appThingTypes);
        }
        #endregion
        #region AppThingTypes AddPV
        [HttpGet]
        public PartialViewResult AddAppThingTypePV(int appID)
        {
            AppThingCategory model = new AppThingCategory();
            ViewBag.IconGUID = new SelectList(uof_repos.repoMediaFiles.GetList(), "GUID", "Title", uof_repos.repoMediaFiles.GetList()[0].GUID);
            model.AppID = appID;
            return PartialView("_App_ThingTypes_Add", model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddAppThingTypePV(AppThingCategory model)
        {
            Result res = Result.GenerateFailedResult();
            if (ModelState.IsValid)
            {
                res = uof_repos.repoAppThingCategorys.Add(model.Title, model.Code, Guid.NewGuid(), model.IconGUID, model.AppID, currentUser.Id);
                return Json(res);
            }
            return Json(res);
        }
        #endregion
        #region AppThingTypes EditPV
        [HttpGet]
        public PartialViewResult EditAppThingTypePV(int appThingTypeID)
        {
            AppThingCategory model = uof_repos.repoAppThingCategorys.Find(appThingTypeID);
            ViewBag.IconGUID = new SelectList(uof_repos.repoMediaFiles.GetList(), "GUID", "Title", model.IconGUID);
            return PartialView("_App_ThingTypes_Edit", model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditAppThingTypePV(AppThingCategory model)
        {
            Result res = Result.GenerateFailedResult();
            if (ModelState.IsValid)
            {
                res = uof_repos.repoAppThingCategorys.Edit(model.ID, model.Title, model.IconGUID, currentUser.Id);
                return Json(res);
            }
            return Json(res);
        }
        #endregion
        #region AppThingTypes DeletePV
        [HttpGet]
        public PartialViewResult DeleteAppThingTypePV(int appThingTypeID)
        {
            AppThingCategory model = uof_repos.repoAppThingCategorys.Find(appThingTypeID);
            return PartialView("_App_ThingTypes_Delete", model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteAppThingTypePV(AppThingCategory model)
        {
            Result res = Result.GenerateFailedResult();
            if (ModelState.IsValid)
            {
                res = uof_repos.repoAppThingCategorys.Delete(model.ID, currentUser.Id);
                return Json(res);
            }
            return Json(res);
        }
        #endregion


        #region AppThingExtensions ContainerPV
        [HttpGet]
        public PartialViewResult ThingExtensionsContainerPV()
        {
            return PartialView("_APP_ThingExtensions_Container");
        }
        #endregion
        #region AppThingExtensions ListPV
        [HttpGet]
        public PartialViewResult ThingExtensionsByAppIDListPV(string searchfor = null, long appID = 0, int page = 1, int recordsperpage = 0)
        {
            IPagedList appThingExtensions = uof_repos.repoAppThingExtensions.GetPagedList(searchfor, appID, page, Helpers.Configs.validateRecordsPerMaster(recordsperpage));
            ViewBag.appID = appID;
            ViewBag.searchFor = searchfor;
            return PartialView("_APP_ThingExtensions_List", appThingExtensions);
        }
        #endregion
        #region AppThingExtensions AddPV
        [HttpGet]
        public PartialViewResult AddAppThingExtensionPV(int appID)
        {
            AppThingExtension model = new AppThingExtension();
            List<AppThingCategory> thingCategorys = uof_repos.repoAppThingCategorys.GetList(appID);
            List<DataType> dataTypes = uof_repos.repoDataTypes.GetList();
            ViewBag.AppThingCategoryCode = new SelectList(thingCategorys, "Code", "Title", thingCategorys[0].Code);
            ViewBag.DataTypeID = new SelectList(dataTypes, "ID", "Title", dataTypes[0].ID);
            model.AppID = appID;
            return PartialView("_App_ThingExtensions_Add", model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddAppThingExtensionPV(AppThingExtension model)
        {
            Result res = Result.GenerateFailedResult();
            if (ModelState.IsValid)
            {
                res = uof_repos.repoAppThingExtensions.Add(Guid.NewGuid(), model.Code, model.Title, model.AppThingCategoryCode, model.DataTypeID, model.IsList, model.AppID, currentUser.Id);
                return Json(res);
            }
            return Json(res);
        }
        #endregion
        #region AppThingExtensions EditPV
        [HttpGet]
        public PartialViewResult EditAppThingExtensionPV(int appThingExtensionID)
        {
            AppThingExtension model = uof_repos.repoAppThingExtensions.Find(appThingExtensionID);
            List<DataType> dataTypes = uof_repos.repoDataTypes.GetList();
            ViewBag.DataTypeID = new SelectList(dataTypes, "ID", "Title", model.DataTypeID);
            return PartialView("_App_ThingExtensions_Edit", model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditAppThingExtensionPV(AppThingExtension model)
        {
            Result res = Result.GenerateFailedResult();
            if (ModelState.IsValid)
            {
                res = uof_repos.repoAppThingExtensions.Edit(model.ID, model.Title, model.DataTypeID, model.IsList, currentUser.Id);
                return Json(res);
            }
            return Json(res);
        }
        #endregion
        #region AppThingExtensions DeletePV
        [HttpGet]
        public PartialViewResult DeleteAppThingExtensionPV(int appThingExtensionID)
        {
            AppThingExtension model = uof_repos.repoAppThingExtensions.Find(appThingExtensionID);
            return PartialView("_App_ThingExtensions_Delete", model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteAppThingExtensionPV(AppThingExtension model)
        {
            Result res = Result.GenerateFailedResult();
            if (ModelState.IsValid)
            {
                res = uof_repos.repoAppThingExtensions.Delete(model.ID, currentUser.Id);
                return Json(res);
            }
            return Json(res);
        }
        #endregion

        #endregion


    }
}