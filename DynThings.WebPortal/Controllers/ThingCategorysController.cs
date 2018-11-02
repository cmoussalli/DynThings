using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using PagedList;
using System.Web.Mvc;
using DynThings.Core;
using DynThings.Data.Models;
using DynThings.Data.Repositories;
using DynThings.Data.Reports;

using DynHighCharts;
using System.IO;
using ResultInfo;

namespace DynThings.WebPortal.Controllers
{

    public class ThingCategorysController : BaseController
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


        public ActionResult Details(long id)
        {
            if (ValidateUserPermissions(false, false) == false)
            {
                return RedirectToAction("Login", "Account");
            }
            ThingCategory ThingCat = uof_repos.repoThingCategorys.Find(id);
            return View(ThingCat);
        }

        #endregion

        #region PartialViewResult: Partial Views

        #region DetailsPV
        public PartialViewResult DetailsPV(long id)
        {
            ThingCategory thingCategory = uof_repos.repoThingCategorys.Find(id);
            return PartialView("_Details_Main", thingCategory);
        }

        #endregion

        #region ListPV
        [HttpGet]
        public PartialViewResult ListPV(string searchfor = null, int page = 1, int recordsperpage = 0)
        {
            IPagedList thingCategorys = uof_repos.repoThingCategorys.GetPagedList(searchfor, page, Helpers.Configs.validateRecordsPerMaster(recordsperpage));
            return PartialView("_List", thingCategorys);
        }
        #endregion

        #region AddPV
        [HttpGet]
        public PartialViewResult AddPV()
        {
            ViewBag.IconID = new SelectList(uof_repos.repoMediaFiles.GetList(), "ID", "Title", 1);
            return PartialView("_Add");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddPV([Bind(Include = "Title,IconID")] ThingCategory thingCategory)
        {
            Result res = Result.GenerateFailedResult();
            if (ModelState.IsValid)
            {
                res = uof_repos.repoThingCategorys.Add(thingCategory.Title, (long)thingCategory.IconID);
                return Json(res);
            }
            return Json(res);
        }
        #endregion

        #region EditPV
        [HttpGet]
        public PartialViewResult EditPV(long id)
        {
            ThingCategory thingCategory = uof_repos.repoThingCategorys.Find(id);
            ViewBag.IconID = new SelectList(uof_repos.repoMediaFiles.GetList(), "ID", "Title", thingCategory.IconID);
            return PartialView("_Edit", thingCategory);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditPV([Bind(Include = "ID,Title,IconID")] ThingCategory thingCategory)
        {
            Result res = Result.GenerateFailedResult();
            if (ModelState.IsValid)
            {
                res = uof_repos.repoThingCategorys.Edit(thingCategory.ID, thingCategory.Title, (long)thingCategory.IconID);
                return Json(res);
            }
            return Json(res);
        }
        #endregion

        #region DeletePV
        [HttpGet]
        public PartialViewResult DeletePV(long id)
        {
            if (!User.IsInRole("Admin"))
            {
                Result rm = Result.GenerateFailedResult();
                return PartialView("_PVResult", rm);
            }
            ThingCategory thingCategory = uof_repos.repoThingCategorys.Find(id);
            return PartialView("_Delete", thingCategory);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult DeletePV([Bind(Include = "ID")] ThingCategory thingCategory)
        {
            Result res = Result.GenerateFailedResult();
            if (ModelState.IsValid)
            {
                res = uof_repos.repoThingCategorys.Delete(thingCategory.ID);
                return Json(res);
            }
            return Json(res);
        }
        #endregion


        #endregion



        [HttpPost]
        public ActionResult UploadImage(HttpPostedFileBase file, long ThingCategoryID)
        {

            if (file.ContentLength > 0)
            {
                var fileName = Path.GetFileName(ThingCategoryID.ToString() + ".jpg");
                var path = Path.Combine(Server.MapPath("~/Imgs/ThingCategorys"), fileName);
                file.SaveAs(path);
            }

            return RedirectToAction("Index");
        }



    }
}
