using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using DynThings.Data.Models;

using PagedList;

namespace DynThings.WebPortal.Controllers
{
    public class EndpointsController : Controller
    {
        private DynThingsEntities db = new DynThingsEntities();

        // GET: Endpoints
        public ActionResult Index()
        {
            var endpoints = db.Endpoints.Include(e => e.CssColor).Include(e => e.CssIcon).Include(e => e.EndPointType);
            return View(endpoints.ToList());
        }

        // GET: Endpoints/Details/5
        public ActionResult Details(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Endpoint endpoint = db.Endpoints.Find(id);
            if (endpoint == null)
            {
                return HttpNotFound();
            }
            return View(endpoint);
        }

        // GET: Endpoints/Create
        public ActionResult Create()
        {
            ViewBag.ColorID = new SelectList(db.CssColors, "ID", "Title");
            ViewBag.IconID = new SelectList(db.CssIcons, "ID", "Title");
            ViewBag.TypeID = new SelectList(db.EndPointTypes, "ID", "Title");
            return View();
        }

        // POST: Endpoints/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,GUID,KeyPass,PinCode,Title,TypeID,ColorID,IconID")] Endpoint endpoint)
        {
            if (ModelState.IsValid)
            {
                db.Endpoints.Add(endpoint);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ColorID = new SelectList(db.CssColors, "ID", "Title", endpoint.ColorID);
            ViewBag.IconID = new SelectList(db.CssIcons, "ID", "Title", endpoint.IconID);
            ViewBag.TypeID = new SelectList(db.EndPointTypes, "ID", "Title", endpoint.TypeID);
            return View(endpoint);
        }

        // GET: Endpoints/Edit/5
        public ActionResult Edit(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Endpoint endpoint = db.Endpoints.Find(id);
            if (endpoint == null)
            {
                return HttpNotFound();
            }
            ViewBag.ColorID = new SelectList(db.CssColors, "ID", "Title", endpoint.ColorID);
            ViewBag.IconID = new SelectList(db.CssIcons, "ID", "Title", endpoint.IconID);
            ViewBag.TypeID = new SelectList(db.EndPointTypes, "ID", "Title", endpoint.TypeID);
            return View(endpoint);
        }

        // POST: Endpoints/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,GUID,KeyPass,PinCode,Title,TypeID,ColorID,IconID")] Endpoint endpoint)
        {
            if (ModelState.IsValid)
            {
                db.Entry(endpoint).State = EntityState.Modified;
                db.SaveChanges();
                return View("Details",endpoint);
            }
            ViewBag.ColorID = new SelectList(db.CssColors, "ID", "Title", endpoint.ColorID);
            ViewBag.IconID = new SelectList(db.CssIcons, "ID", "Title", endpoint.IconID);
            ViewBag.TypeID = new SelectList(db.EndPointTypes, "ID", "Title", endpoint.TypeID);
            return View("Details", endpoint);
        }

        // GET: Endpoints/Delete/5
        public ActionResult Delete(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Endpoint endpoint = db.Endpoints.Find(id);
            if (endpoint == null)
            {
                return HttpNotFound();
            }
            return View(endpoint);
        }

        // POST: Endpoints/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(long id)
        {
            Endpoint endpoint = db.Endpoints.Find(id);
            db.Endpoints.Remove(endpoint);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }



        public PartialViewResult GetDetailsPV(long? id)
        {
            Endpoint endpoint = db.Endpoints.Find(id);
            return PartialView("_Details",endpoint);
        }

        [HttpGet]
        public PartialViewResult GetListPV(string searchfor = null, int page = 1, int recordsperpage = 2)
        {
            PagedList.IPagedList ends = db.Endpoints
                .Where(e => searchfor == null || e.Title.Contains(searchfor))
                .OrderBy(e => e.Title).ToList()
                .ToPagedList(page, recordsperpage);


            return PartialView("_List", ends);
        }

        public PartialViewResult GetEditPV(long? id)
        {
            Endpoint endpoint = db.Endpoints.Find(id);


            ViewBag.ColorID = new SelectList(db.CssColors, "ID", "Title", endpoint.ColorID);
            ViewBag.IconID = new SelectList(db.CssIcons, "ID", "Title", endpoint.IconID);
            ViewBag.TypeID = new SelectList(db.EndPointTypes, "ID", "Title", endpoint.TypeID);
            return PartialView("_Edit", endpoint);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult GetEditPV([Bind(Include = "ID,GUID,KeyPass,PinCode,Title,TypeID,ColorID,IconID")] Endpoint endpoint)
        {
            if (ModelState.IsValid)
            {
                db.Entry(endpoint).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ColorID = new SelectList(db.CssColors, "ID", "Title", endpoint.ColorID);
            ViewBag.IconID = new SelectList(db.CssIcons, "ID", "Title", endpoint.IconID);
            ViewBag.TypeID = new SelectList(db.EndPointTypes, "ID", "Title", endpoint.TypeID);
            return View(endpoint);
        }

    }
}
