using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using DynThings.WebPortal.Models;
using PagedList;

namespace DynThings.WebPortal.Controllers
{
    public class AlertsController : Controller
    {
        private DynThingsEntities db = new DynThingsEntities();

        // GET: Alerts
        public ActionResult Index()
        {
            var alerts = db.Alerts.Include(a => a.Endpoint);
            return View(alerts.ToList());
        }

        // GET: Alerts/Details/5
        public ActionResult Details(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Alert alert = db.Alerts.Find(id);
            if (alert == null)
            {
                return HttpNotFound();
            }
            return View(alert);
        }

        // GET: Alerts/Create
        public ActionResult Create()
        {
            ViewBag.EndPointID = new SelectList(db.Endpoints, "ID", "PinCode");
            return View();
        }

        // POST: Alerts/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,Title,Text,EndPointID,TimeStamp")] Alert alert)
        {
            if (ModelState.IsValid)
            {
                db.Alerts.Add(alert);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.EndPointID = new SelectList(db.Endpoints, "ID", "PinCode", alert.EndPointID);
            return View(alert);
        }

        // GET: Alerts/Edit/5
        public ActionResult Edit(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Alert alert = db.Alerts.Find(id);
            if (alert == null)
            {
                return HttpNotFound();
            }
            ViewBag.EndPointID = new SelectList(db.Endpoints, "ID", "PinCode", alert.EndPointID);
            return View(alert);
        }

        // POST: Alerts/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,Title,Text,EndPointID,TimeStamp")] Alert alert)
        {
            if (ModelState.IsValid)
            {
                db.Entry(alert).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.EndPointID = new SelectList(db.Endpoints, "ID", "PinCode", alert.EndPointID);
            return View(alert);
        }

        // GET: Alerts/Delete/5
        public ActionResult Delete(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Alert alert = db.Alerts.Find(id);
            if (alert == null)
            {
                return HttpNotFound();
            }
            return View(alert);
        }

        // POST: Alerts/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(long id)
        {
            Alert alert = db.Alerts.Find(id);
            db.Alerts.Remove(alert);
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


        [HttpGet]
        public PartialViewResult GetListPV(string searchfor = null, int page = 1, int recordsperpage = 2)
        {
            PagedList.IPagedList alrts = db.Alerts
                .Where(a => searchfor == null || a.Text.Contains(searchfor))
                .OrderByDescending(e => e.TimeStamp).ToList()
                .ToPagedList(page, recordsperpage);


            return PartialView("_List", alrts);
        }

    }
}
