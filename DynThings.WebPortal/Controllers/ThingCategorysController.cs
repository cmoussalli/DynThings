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
using DynThings.Data.Models.ReportsModels;
using DynHighCharts;
using System.IO;

namespace DynThings.WebPortal.Controllers
{

    public class ThingCategorysController : BaseController
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


        public ActionResult Details(long id)
        {
            if (ValidateUserPermissions(false, false) == false)
            {
                return RedirectToAction("Login", "Account");
            }
            ThingCategory ThingCat = Data.Repositories.UnitOfWork_Repositories.repoThingCategorys.Find(id);
            return View(ThingCat);
        }

        #endregion

        #region PartialViewResult: Partial Views

        #region DetailsPV
        public PartialViewResult DetailsPV(long id)
        {
            ThingCategory thingCategory = Data.Repositories.UnitOfWork_Repositories.repoThingCategorys.Find(id);
            return PartialView("_Details_Main", thingCategory);
        }

        #endregion

        #region ListPV
        [HttpGet]
        public PartialViewResult ListPV(string searchfor = null, int page = 1, int recordsperpage = 0)
        {
            PagedList.IPagedList thingCategorys = Data.Repositories.UnitOfWork_Repositories.repoThingCategorys.GetPagedList(searchfor, page, Helpers.Configs.validateRecordsPerMaster(recordsperpage));
            return PartialView("_List", thingCategorys);
        }
        #endregion

        #region AddPV
        [HttpGet]
        public PartialViewResult AddPV()
        {
            ViewBag.IconID = new SelectList(UnitOfWork_Repositories.repoMediaFiles.GetList(), "ID", "Title", 1);
            return PartialView("_Add");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddPV([Bind(Include = "Title,IconID")] ThingCategory thingCategory)
        {
            ResultInfo.Result res = ResultInfo.GetResultByID(1);
            if (ModelState.IsValid)
            {
                res = UnitOfWork_Repositories.repoThingCategorys.Add(thingCategory.Title,(long)thingCategory.IconID);
                return Json(res);
            }
            return Json(res);
        }
        #endregion

        #region EditPV
        [HttpGet]
        public PartialViewResult EditPV(long id)
        {
            ViewBag.IconID = new SelectList(UnitOfWork_Repositories.repoMediaFiles.GetList(), "ID", "Title", 1);
            ThingCategory thingCategory = UnitOfWork_Repositories.repoThingCategorys.Find(id);
            return PartialView("_Edit", thingCategory);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditPV([Bind(Include = "ID,Title,IconID")] ThingCategory thingCategory)
        {
            ResultInfo.Result res = ResultInfo.GetResultByID(1);
            if (ModelState.IsValid)
            {
                res = UnitOfWork_Repositories.repoThingCategorys.Edit(thingCategory.ID, thingCategory.Title, (long)thingCategory.IconID);
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
                ResultInfo.Result rm = Core.ResultInfo.GetResultByID(1);
                return PartialView("_PVResult", rm);
            }
            ThingCategory thingCategory = UnitOfWork_Repositories.repoThingCategorys.Find(id);
            return PartialView("_Delete", thingCategory);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult DeletePV([Bind(Include = "ID")] ThingCategory thingCategory)
        {
            ResultInfo.Result res = ResultInfo.GetResultByID(1);
            if (ModelState.IsValid)
            {
                res = UnitOfWork_Repositories.repoThingCategorys.Delete(thingCategory.ID);
                return Json(res);
            }
            return Json(res);
        }
        #endregion


        #endregion

        [HttpPost]
        public ActionResult UploadImage(HttpPostedFileBase file,long ThingCategoryID)
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
