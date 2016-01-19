using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using DynThings.WebPortal;
using DynThings.WebPortal.Models;

namespace DynThings.WebPortal.Controllers
{
    public class LocationViewTypesController : Controller
    {
        private DynThingsEntities db = new DynThingsEntities();

        // GET: LocationViewTypes
        public ActionResult Index()
        {
            return View(db.LocationViewTypes.ToList());
        }

        // GET: LocationViewTypes/Details/5
        public ActionResult Details(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LocationViewType locationViewType = db.LocationViewTypes.Find(id);
            if (locationViewType == null)
            {
                return HttpNotFound();
            }
            return View(locationViewType);
        }

        // GET: LocationViewTypes/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: LocationViewTypes/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,Title")] LocationViewType locationViewType)
        {
            if (ModelState.IsValid)
            {
                db.LocationViewTypes.Add(locationViewType);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(locationViewType);
        }

        // GET: LocationViewTypes/Edit/5
        public ActionResult Edit(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LocationViewType locationViewType = db.LocationViewTypes.Find(id);
            if (locationViewType == null)
            {
                return HttpNotFound();
            }
            return View(locationViewType);
        }

        // POST: LocationViewTypes/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,Title")] LocationViewType locationViewType)
        {
            if (ModelState.IsValid)
            {
                db.Entry(locationViewType).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(locationViewType);
        }

        // GET: LocationViewTypes/Delete/5
        public ActionResult Delete(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LocationViewType locationViewType = db.LocationViewTypes.Find(id);
            if (locationViewType == null)
            {
                return HttpNotFound();
            }
            return View(locationViewType);
        }

        // POST: LocationViewTypes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(long id)
        {
            LocationViewType locationViewType = db.LocationViewTypes.Find(id);
            db.LocationViewTypes.Remove(locationViewType);
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
