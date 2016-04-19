using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DynThings.Data.Models;
using DynThings.Data.Repositories;
using DynThings.Core;

namespace DynThings.WebPortal.Controllers
{
    [Authorize]
    public class ConfigController : Controller
    {
        
        // GET: Config
        public ActionResult Index()
        {
            return View();
        }

        
        public PartialViewResult MainPV()
        {
            DynSetting config = UnitOfWork.repoDynSettings.GetConfig(); ;
            return PartialView("_Main", config);
        }


        #region EditPV
        [HttpGet]
        public PartialViewResult GridsPV()
        {
            DynSetting config = UnitOfWork.repoDynSettings.GetConfig();

            return PartialView("_Grids", config);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditPV([Bind(Include = "ID,Title,TypeID,DeviceID")] Endpoint endpoint)
        {
            if (ModelState.IsValid)
            {
                UnitOfWork.repoEndpoints.Edit(endpoint.ID, endpoint.Title, endpoint.TypeID);
                return RedirectToAction("Index");
            }
            ViewBag.TypeID = new SelectList(UnitOfWork.repoEndpointTypes.GetList(), "ID", "Title", endpoint.TypeID);
            ViewBag.DeviceID = new SelectList(UnitOfWork.repoDevices.GetList(), "ID", "Title", endpoint.DeviceID);
            return View(endpoint);
        }
        #endregion
    }
}