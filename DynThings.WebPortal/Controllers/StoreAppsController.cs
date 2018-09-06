using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using DynThings.Core;
using DynThings.Data.Models;
using DynThings.Data.Repositories;
using DynThingsCentral.WebAPI.Models;
using DynThingsCentral.WebAPI.ResponseModels;
using DynThings.Services.Central;
using System.Threading.Tasks;
using DynThings.Data.Models.ViewModels;
using PagedList;
using System.IO;


namespace DynThings.WebPortal.Controllers
{
    public class StoreAppsController : BaseController
    {
        UnitOfWork_CentralServices uow_CentralService = new UnitOfWork_CentralServices();
        UnitOfWork_Repositories unitOfWork_Repositories = new UnitOfWork_Repositories();

        // GET: StoreApps
        public ActionResult Index()
        {
            if (ValidateUserPermissions(false, false) == false)
            {
                return RedirectToAction("Login", "Account");
            }
            return View("Index");
        }




        #region ListPV
        /// <summary>
        /// Return list of apps in partial view
        /// </summary>
        /// <param name="searchfor">Search content</param>
        /// <param name="page">Page Number</param>
        /// <param name="recordsperpage">Apps records per page</param>
        /// <returns></returns>
        [HttpGet]
        public async Task<PartialViewResult> ListPV(string searchfor = null, int page = 1, int recordsperpage = 0)
        {
            APIAppResponseModels.GetAppsList res = await uow_CentralService.appStoreService.GetAppsListAsync(searchfor, page, 10);
            return PartialView("_List", res);
        }
        #endregion


        #region Get App by GUID PV
        [HttpGet]
        public async Task<PartialViewResult> GetAppByGUIDPV(Guid guid)
        {
            APIAppResponseModels.GetAppByGUID res = await uow_CentralService.appStoreService.GetAppByGUIDAsync(guid);
            return PartialView("_SideInfo", res);
        }
        #endregion

        #region Get AppActions by GUID PV
        [HttpGet]
        public async Task<PartialViewResult> GetAppActionsByGUIDPV(Guid guid)
        {
            StoreAppAction res = new StoreAppAction();
            res.AppGuid = guid.ToString();
            try
            {//App Is Installed
                App localApp = unitOfWork_Repositories.repoApps.Find(guid);
                res.InstalledVersion = localApp.Version;
                res.IsInstalled = true;

                APIAppResponseModels.GetAppByGUID centralApp = await uow_CentralService.appStoreService.GetAppByGUIDAsync(guid);
                res.LatestVersion = centralApp.App.LatestVersion;
                if (centralApp.App.LatestVersion == localApp.Version)
                {
                    res.IsLatestVersion = true;
                }
            }
            catch
            {//App is not Installed
                res.InstalledVersion = 0;
                res.IsInstalled = false;
            }

            return PartialView("_AppActions", res);
        }
        #endregion



        #region Install Or Update App
        [HttpGet]
        public async Task<PartialViewResult> InstallOrUpdateAppByGUIDPV(Guid guid)
        {
             App newApp =  await uow_CentralService.appStoreService.InstallOrUpdateStoreApp(guid);

            foreach(AppMediaFile item in newApp.AppMediaFiles)
            {
                GetMediaFile(item.GUID.ToString());
            }

            return PartialView("_InstallResult");
        }
        #endregion

        [HttpGet]
        public ResultInfo.Result GetMediaFile(string guid)
        {
            ResultInfo.Result result = ResultInfo.GenerateErrorResult();
            string localFile = Path.Combine(System.Web.HttpContext.Current.Server.MapPath("~/imgs"), guid + ".png");
            WebClient client = new WebClient();

            client.DownloadFile("http://dynthings.com/mediafiles/" + guid + ".png", localFile);

            result = ResultInfo.GenerateOKResult();
            return result;
        }


    }
}