using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using DynThings.WebPortal.Models;

namespace DynThings.WebPortal.Controllers
{
    public class LocationViewsController : Controller
    {
        private DynThingsEntities db = new DynThingsEntities();

        // GET: LocationViews
        public ActionResult Index()
        {
            var locationViews = db.LocationViews.Include(l => l.LocationViewType);
            return View(locationViews.ToList());
        }

        // GET: LocationViews/Details/5
        public ActionResult Details(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LocationView locationView = db.LocationViews.Find(id);
            if (locationView == null)
            {
                return HttpNotFound();
            }
            return View(locationView);
        }

        // GET: LocationViews/Create
        public ActionResult Create()
        {
            ViewBag.LocationViewTypeID = new SelectList(db.LocationViewTypes, "ID", "Title");
            return View();
        }

        // POST: LocationViews/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,Title,IsActive,OwnerID,LocationViewTypeID")] LocationView locationView)
        {
            if (ModelState.IsValid)
            {
                db.LocationViews.Add(locationView);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.LocationViewTypeID = new SelectList(db.LocationViewTypes, "ID", "Title", locationView.LocationViewTypeID);
            return View(locationView);
        }

        // GET: LocationViews/Edit/5
        public ActionResult Edit(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LocationView locationView = db.LocationViews.Find(id);
            if (locationView == null)
            {
                return HttpNotFound();
            }
            ViewBag.LocationViewTypeID = new SelectList(db.LocationViewTypes, "ID", "Title", locationView.LocationViewTypeID);
            return View(locationView);
        }

        // POST: LocationViews/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,Title,IsActive,OwnerID,LocationViewTypeID")] LocationView locationView)
        {
            if (ModelState.IsValid)
            {
                db.Entry(locationView).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.LocationViewTypeID = new SelectList(db.LocationViewTypes, "ID", "Title", locationView.LocationViewTypeID);
            return View(locationView);
        }

        // GET: LocationViews/Delete/5
        public ActionResult Delete(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LocationView locationView = db.LocationViews.Find(id);
            if (locationView == null)
            {
                return HttpNotFound();
            }
            return View(locationView);
        }

        // POST: LocationViews/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(long id)
        {
            LocationView locationView = db.LocationViews.Find(id);
            db.LocationViews.Remove(locationView);
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
    }
}
