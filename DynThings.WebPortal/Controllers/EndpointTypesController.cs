using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DynThings.Data.Models;
using DynThings.Data.Repositories;
using DynThings.Core;
using System.IO;
using ResultInfo;

namespace DynThings.WebPortal.Controllers
{
    public class EndPointTypesController : BaseController
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
            EndPointType ThingCat = uof_repos.repoEndpointTypes.Find(id);
            return View(ThingCat);
        }

        #endregion

        #region PartialViewResult: Partial Views

        #region DetailsPV
        public PartialViewResult DetailsPV(long id)
        {
            EndPointType EndPointType = uof_repos.repoEndpointTypes.Find(id);
            return PartialView("_Details_Main", EndPointType);
        }

        #endregion

        #region ListPV
        [HttpGet]
        public PartialViewResult ListPV(string searchfor = null, int page = 1, int recordsperpage = 0)
        {
            PagedList.IPagedList EndPointTypes = uof_repos.repoEndpointTypes.GetPagedList(searchfor, page, Helpers.Configs.validateRecordsPerMaster(recordsperpage));
            return PartialView("_List", EndPointTypes);
        }
        #endregion

        #region AddPV
        [HttpGet]
        public PartialViewResult AddPV()
        {
            ViewBag.IconID = new SelectList(uof_repos.repoMediaFiles.GetList(), "ID", "Title", 1);
            ViewBag.TypeCategoryID = new SelectList(uof_repos.repoEndpointTypeCategorys.GetList(), "ID", "Title", 1);
            return PartialView("_Add");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddPV([Bind(Include = "Title,Measurement,TypeCategoryID,IconID")] EndPointType endPointType)
        {
            Result res = Result.GenerateFailedResult();
            if (ModelState.IsValid)
            {
                res = uof_repos.repoEndpointTypes.Add(endPointType.Title, endPointType.measurement, (long)endPointType.TypeCategoryID, (long)endPointType.IconID);
                return Json(res);
            }
            return Json(res);
        }
        #endregion

        #region EditPV
        [HttpGet]
        public PartialViewResult EditPV(long id)
        {
            EndPointType endPointType = uof_repos.repoEndpointTypes.Find(id);
            ViewBag.IconID = new SelectList(uof_repos.repoMediaFiles.GetList(), "ID", "Title", endPointType.IconID);
            ViewBag.TypeCategoryID = new SelectList(uof_repos.repoEndpointTypeCategorys.GetList(), "ID", "Title", endPointType.TypeCategoryID);
            return PartialView("_Edit", endPointType);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditPV([Bind(Include = "ID,Title,Measurement,TypeCategoryID,IconID")] EndPointType endPointType)
        {
            Result res = Result.GenerateFailedResult();
            if (ModelState.IsValid)
            {
                res = uof_repos.repoEndpointTypes.Edit(endPointType.ID, endPointType.Title, endPointType.measurement, (long)endPointType.TypeCategoryID,(long)endPointType.IconID);
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
            EndPointType EndPointType = uof_repos.repoEndpointTypes.Find(id);
            return PartialView("_Delete", EndPointType);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult DeletePV([Bind(Include = "ID")] EndPointType EndPointType)
        {
            Result res = Result.GenerateFailedResult();
            if (ModelState.IsValid)
            {
                res = uof_repos.repoEndpointTypes.Delete(EndPointType.ID);
                return Json(res);
            }
            return Json(res);
        }
        #endregion


        #endregion

        [HttpPost]
        public ActionResult UploadImage(HttpPostedFileBase file, long EndPointTypeID)
        {

            if (file.ContentLength > 0)
            {
                var fileName = Path.GetFileName(EndPointTypeID.ToString() + ".jpg");
                var path = Path.Combine(Server.MapPath("~/Imgs/EndPointTypes"), fileName);
                file.SaveAs(path);
            }

            return RedirectToAction("Index");
        }



    }
}