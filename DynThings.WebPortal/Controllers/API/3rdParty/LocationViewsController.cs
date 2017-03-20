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
using DynThings.Core;
using DynThings.WebAPI.Models;
using DynThings.WebAPI.Repositories;

namespace DynThings.WebPortal.Controllers.API
{
    public class LocationViewsController : ApiController
    {
        #region Props
        UnitOfWork_WebAPI uow_APIs = new UnitOfWork_WebAPI();
        long entityID = 8;

        #endregion

        //GET: api/LocationViews/GetLocationViews
        public List<APILocationView> GetLocationViews(Guid token,string searchFor,int page,int pageSize)
        {
            ResultInfo.Result tokenValidation = uow_APIs.repoAPIUserAppTokens.ValidateTokenEntityPermission(token,entityID);
            if (tokenValidation.ResultType != ResultInfo.ResultType.Ok)
            {
                var msg = new HttpResponseMessage(HttpStatusCode.Unauthorized) { ReasonPhrase = tokenValidation.Message };
                throw new HttpResponseException(new HttpResponseMessage(HttpStatusCode.NotFound));
            }
            return uow_APIs.repoAPILocationViews.GetLocationViews(searchFor, page, pageSize);
        }


        //// GET: api/LocationViewsT/5
        //[ResponseType(typeof(LocationView))]
        //public IHttpActionResult GetLocationView(long id)
        //{
        //    LocationView locationView = db.LocationViews.Find(id);
        //    if (locationView == null)
        //    {
        //        return NotFound();
        //    }

        //    return Ok(locationView);
        //}

        //// PUT: api/LocationViewsT/5
        //[ResponseType(typeof(void))]
        //public IHttpActionResult PutLocationView(long id, LocationView locationView)
        //{
        //    if (!ModelState.IsValid)
        //    {
        //        return BadRequest(ModelState);
        //    }

        //    if (id != locationView.ID)
        //    {
        //        return BadRequest();
        //    }

        //    db.Entry(locationView).State = EntityState.Modified;

        //    try
        //    {
        //        db.SaveChanges();
        //    }
        //    catch (DbUpdateConcurrencyException)
        //    {
        //        if (!LocationViewExists(id))
        //        {
        //            return NotFound();
        //        }
        //        else
        //        {
        //            throw;
        //        }
        //    }

        //    return StatusCode(HttpStatusCode.NoContent);
        //}

        //// POST: api/LocationViewsT
        //[ResponseType(typeof(LocationView))]
        //public IHttpActionResult PostLocationView(LocationView locationView)
        //{
        //    if (!ModelState.IsValid)
        //    {
        //        return BadRequest(ModelState);
        //    }

        //    db.LocationViews.Add(locationView);
        //    db.SaveChanges();

        //    return CreatedAtRoute("DefaultApi", new { id = locationView.ID }, locationView);
        //}

        //// DELETE: api/LocationViewsT/5
        //[ResponseType(typeof(LocationView))]
        //public IHttpActionResult DeleteLocationView(long id)
        //{
        //    LocationView locationView = db.LocationViews.Find(id);
        //    if (locationView == null)
        //    {
        //        return NotFound();
        //    }

        //    db.LocationViews.Remove(locationView);
        //    db.SaveChanges();

        //    return Ok(locationView);
        //}

        //protected override void Dispose(bool disposing)
        //{
        //    if (disposing)
        //    {
        //        db.Dispose();
        //    }
        //    base.Dispose(disposing);
        //}

        //private bool LocationViewExists(long id)
        //{
        //    return db.LocationViews.Count(e => e.ID == id) > 0;
        //}
    }
}