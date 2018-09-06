﻿using System;
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

namespace DynThings.WebPortal.Controllers
{
    public class MediaFilesController : BaseController
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


        //public ActionResult Details(long id)
        //{
        //    if (ValidateUserPermissions(false, false) == false)
        //    {
        //        return RedirectToAction("Login", "Account");
        //    }
        //    MediaFile ThingCat = uof_repos.repoMediaFiles.Find(id);
        //    return View(ThingCat);
        //}

        #endregion

        #region Get Partial Views :: Customize
        #region ListPV
        [HttpGet]
        public PartialViewResult ListPV(string searchfor = null, int page = 1, int recordsperpage = 0)
        {
            IPagedList mFiles = uof_repos.repoMediaFiles.GetPagedList(searchfor, page, Helpers.Configs.validateRecordsPerMaster(recordsperpage));
            return PartialView("_List", mFiles);
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
        public ActionResult AddPV([Bind(Include = "Title")] MediaFile MediaFile)
        {
            ResultInfo.Result res = ResultInfo.GetResultByID(1);
            if (ModelState.IsValid)
            {
                res = uof_repos.repoMediaFiles.Add(MediaFile.Title);
                return Json(res);
            }
            return Json(res);
        }
        #endregion

        #region EditPV
        [HttpGet]
        public PartialViewResult EditPV(long id)
        {
            MediaFile MediaFile = uof_repos.repoMediaFiles.Find(id);
            return PartialView("_Edit", MediaFile);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditPV([Bind(Include = "ID,Title")] MediaFile MediaFile)
        {
            ResultInfo.Result res = ResultInfo.GetResultByID(1);
            if (ModelState.IsValid)
            {
                res = uof_repos.repoMediaFiles.Edit(MediaFile.ID, MediaFile.Title);
                return Json(res);
            }
            return Json(res);
        }
        #endregion

        #region EditPV : Upload Image
        [HttpPost]
        public ActionResult UploadMediaFile(HttpPostedFileBase file,string fileNumber)
        {

            if (file.ContentLength > 0)
            {
                var fileName = Path.GetFileName(fileNumber + ".png");
                var path = Path.Combine(Server.MapPath("~/imgs"), fileName);
                file.SaveAs(path);
                System.Drawing.Image img = System.Drawing.Image.FromFile(path);
                if (img.Height> 48 || img.Width > 48)
                {
                    System.IO.File.Delete(path);
                }
            }

            return RedirectToAction("Index");
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
            MediaFile media = uof_repos.repoMediaFiles.Find(id);
            return PartialView("_Delete", media);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult DeletePV([Bind(Include = "ID")] MediaFile mediaFile)
        {
            ResultInfo.Result res = ResultInfo.GetResultByID(1);
            if (ModelState.IsValid)
            {
                res = uof_repos.repoMediaFiles.Delete(mediaFile.ID);
                return Json(res);
            }
            return Json(res);
        }
        #endregion

        #endregion
    }
}