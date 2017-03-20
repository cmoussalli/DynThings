using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using DynThings.Data.Models;

namespace DynThings.WebPortal.Controllers
{
    public class LocationViewsTController : ApiController
    {
        private DynThingsEntities db = new DynThingsEntities();

        // GET: api/LocationViewsT
        public IQueryable<LocationView> GetLocationViews()
        {
            return db.LocationViews;
        }

        // GET: api/LocationViewsT/5
        [ResponseType(typeof(LocationView))]
        public IHttpActionResult GetLocationView(long id)
        {
            LocationView locationView = db.LocationViews.Find(id);
            if (locationView == null)
            {
                return NotFound();
            }

            return Ok(locationView);
        }

        // PUT: api/LocationViewsT/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutLocationView(long id, LocationView locationView)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != locationView.ID)
            {
                return BadRequest();
            }

            db.Entry(locationView).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!LocationViewExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/LocationViewsT
        [ResponseType(typeof(LocationView))]
        public IHttpActionResult PostLocationView(LocationView locationView)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.LocationViews.Add(locationView);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = locationView.ID }, locationView);
        }

        // DELETE: api/LocationViewsT/5
        [ResponseType(typeof(LocationView))]
        public IHttpActionResult DeleteLocationView(long id)
        {
            LocationView locationView = db.LocationViews.Find(id);
            if (locationView == null)
            {
                return NotFound();
            }

            db.LocationViews.Remove(locationView);
            db.SaveChanges();

            return Ok(locationView);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool LocationViewExists(long id)
        {
            return db.LocationViews.Count(e => e.ID == id) > 0;
        }
    }
}