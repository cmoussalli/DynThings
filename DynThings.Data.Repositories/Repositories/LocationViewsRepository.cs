﻿/////////////////////////////////////////////////////////////////
// Created by : Caesar Moussalli                               //
// TimeStamp  : 31-1-2016                                      //
// Content    : Handle Endpoint CRUD                           //
// Notes      :                                                //
/////////////////////////////////////////////////////////////////
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DynThings.Data.Models;
using PagedList;
using DynThings.Core;
using ResultInfo;

namespace DynThings.Data.Repositories
{
    public class LocationViewsRepository
    {
        #region Constructor
        public LocationViewsRepository(DynThingsEntities dbSource)
        {
            db = dbSource;
        }

        #endregion

        #region props
        public DynThingsEntities db;
        #endregion

        #region GetCount
        public int GetCount()
        {
            return db.LocationViews.Count();
        }
        #endregion

        #region Get PagedList
        public IPagedList<LocationView> GetPagedList(string search, int pageNumber, int recordsPerPage)
        {
            IPagedList<LocationView> views = db.LocationViews
                .Include("LocationViewType")
                  .Where(v =>
                (search == null || search == "" || v.Title.Contains(search))
                )
                .OrderBy(o => o.Title)
              .ToPagedList(pageNumber, recordsPerPage);
            return views;
        }
        #endregion

        #region Get Views with Warnings PagedList
        public IPagedList<LocationView> GetLocationViewsWithWarningPagedList(string search, int pageNumber, int recordsPerPage)
        {
            IPagedList<LocationView> views = db.LocationViews
                .Include("LocationViewType")
                  .Where(v =>
                 v.LinkLocationsLocationViews.Any(ll =>
                           ll.Location.LinkThingsLocations.Any(lt =>
                              lt.Thing.Endpoints.Any(
                                  e => e.IsNumericOnly == true
                                      && (e.LastIONumericValue >= e.HighRange || e.LastIONumericValue <= e.LowRange)

                                  )

                               )
                       )
                )
                .OrderBy(o => o.Title)
              .ToPagedList(pageNumber, recordsPerPage);
            return views;
        }
        #endregion

        #region Find
        /// <summary>
        /// Find LocationView by LocationView ID
        /// </summary>
        /// <param name="ID">LocationView ID</param>
        /// <returns>LocationView object</returns>
        public LocationView Find(long ID)
        {
            LocationView locView = db.LocationViews.Find(ID);
            return locView;
        }


        #endregion

        #region Add
        /// <summary>
        /// Create new LocationView
        /// </summary>
        /// <param name="title">LocationView title</param>
        /// <param name="locationTypeID">LocationView type ID</param>
        /// <param name="ownerID">Owner ID</param>
        /// <returns>Result : Ok or Failed</returns>
        public ResultInfo.Result Add(string title, long locationTypeID, string userID)
        {
            try
            {
                LocationView loc = new LocationView();
                loc.Title = title;
                loc.IsActive = false;
                loc.OwnerID = userID;
                loc.LocationViewTypeID = locationTypeID;
                loc.X = "57";
                loc.Y = "0.6";
                loc.Z = "1";
                db.LocationViews.Add(loc);
                db.SaveChanges();
                return Result.GenerateOKResult("Saved", loc.ID.ToString());
            }
            catch
            {
                return Result.GenerateFailedResult();
            }
        }
        #endregion

        #region Edit : Main
        /// <summary>
        /// Edit a specific LocationView's main info.
        /// </summary>
        /// <param name="locationViewID"></param>
        /// <param name="title"></param>
        /// <param name="TypeID"></param>
        /// <returns></returns>
        public ResultInfo.Result Edit(long locationViewID, string title, long TypeID)
        {
            try
            {
                LocationView loc = db.LocationViews.Find(locationViewID);
                loc.Title = title;
                loc.LocationViewTypeID = TypeID;
                loc.IsActive = false;
                db.SaveChanges();
                return Result.GenerateOKResult("Saved", loc.ID.ToString());
            }
            catch
            {
                return Result.GenerateFailedResult();
            }
        }
        #endregion
        #region Edit : Map
        /// <summary>
        /// Edit a specific LocationView's map info.
        /// </summary>
        /// <param name="locationViewID">The editable LocationView ID</param>
        /// <param name="x">X, Longitude</param>
        /// <param name="y">Y, Latitude</param>
        /// <param name="z">Map Zoom</param>
        /// <param name="userID">Edited by User ID</param>
        /// <returns></returns>
        public ResultInfo.Result Edit(long locationViewID, string x, string y, string z, string userID)
        {
            try
            {
                LocationView loc = db.LocationViews.Find(locationViewID);
                loc.X = x;
                loc.Y = y;
                loc.Z = z;
                db.SaveChanges();
                return Result.GenerateOKResult("Saved", loc.ID.ToString());
            }
            catch
            {
                return Result.GenerateFailedResult();
            }
        }
        #endregion
        #region Edit : IsActive
        /// <summary>
        /// Enable or Disable a locationView
        /// </summary>
        /// <param name="locationViewID">The selected LocationView ID.</param>
        /// <param name="isActive">Activation, True or False.</param>
        /// <returns>Result : Ok or Failed.</returns>
        public ResultInfo.Result IsActive(long locationViewID, bool isActive, string userID)
        {
            try
            {
                LocationView loc = db.LocationViews.Find(locationViewID);
                loc.IsActive = isActive;
                db.SaveChanges();
                return Result.GenerateOKResult("Saved", loc.ID.ToString());
            }
            catch
            {
                return Result.GenerateFailedResult();
            }
        }
        #endregion

        #region Delete
        public ResultInfo.Result Delete(long id)
        {
            try
            {
                LocationView locView = db.LocationViews.Find(id);
                db.LocationViews.Remove(locView);
                db.SaveChanges();
                return Result.GenerateOKResult("Deleted", locView.ID.ToString());
            }
            catch
            {
                return Result.GenerateFailedResult();
            }
        }

        #endregion



        #region AttachLocation
        public ResultInfo.Result AttachLocation(long locationViewID, long locationID, string userID)
        {
            LinkLocationsLocationView lnk = new LinkLocationsLocationView();
            List<LinkLocationsLocationView> lnks = db.LinkLocationsLocationViews.Where(l => l.LocationID == locationID && l.LocationViewID == locationViewID).ToList();
            if (lnks.Count > 0)
            {
                return Result.GenerateFailedResult();
            }
            lnk.LocationID = locationID;
            lnk.LocationViewID = locationViewID;
            db.LinkLocationsLocationViews.Add(lnk);
            db.SaveChanges();
            return Result.GenerateOKResult();
        }
        #endregion
        #region DeAttachLocation
        public ResultInfo.Result DeattachLocation(long locationViewID, long locationID, string userID)
        {
            List<LinkLocationsLocationView> lnks = db.LinkLocationsLocationViews.Where(l => l.LocationID == locationID && l.LocationViewID == locationViewID).ToList();
            if (lnks.Count != 1)
            {
                return Result.GenerateFailedResult();
            }
            LinkLocationsLocationView lnk = lnks[0];
            db.LinkLocationsLocationViews.Remove(lnk);
            db.SaveChanges();
            return Result.GenerateOKResult();
        }
        #endregion
    }
}
