/////////////////////////////////////////////////////////////////
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

namespace DynThings.Data.Repositories
{
    public class LocationViewsRepository
    {
        #region Constructor
        public DynThingsEntities db { get; set; }
        public LocationViewsRepository(DynThingsEntities dynThingsEntities)
        {
            db = dynThingsEntities;
        }
        #endregion


        #region Get PagedList
        public IPagedList GetPagedList(string search, int pageNumber, int recordsPerPage)
        {
            IPagedList views = db.LocationViews
                .Where(
                l => search == null || l.Title.Contains(search))
                              .OrderBy(l => l.Title).ToList()
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
                loc.X = "";
                loc.Y = "";
                loc.Z = "";
                db.LocationViews.Add(loc);
                db.SaveChanges();
                return UnitOfWork.resultInfo.GenerateOKResult("Saved", loc.ID);
            }
            catch
            {
                return UnitOfWork.resultInfo.GetResultByID(1);
            }
        }
        #endregion

        #region Edit : Title
        public ResultInfo.Result Edit(long locationViewID, string title, string userID)
        {
            try
            {
                LocationView loc = db.LocationViews.Find(locationViewID);
                loc.Title = title;
                loc.IsActive = false;
                db.SaveChanges();
                return UnitOfWork.resultInfo.GenerateOKResult("Saved", loc.ID);
            }
            catch
            {
                return UnitOfWork.resultInfo.GetResultByID(1);
            }
        }
        #endregion

        #region Edit : LocationType
        /// <summary>
        /// Edit a specific LocationView
        /// </summary>
        /// <param name="locationViewID">The editable LocationView ID</param>
        /// <param name="locationViewTypeID">The newLocationView type ID</param>
        /// <param name="x">X, Longitude</param>
        /// <param name="y">Y, Latitude</param>
        /// <param name="z">Map Zoom</param>
        /// <param name="userID">Edited by User ID</param>
        /// <returns></returns>
        public ResultInfo.Result Edit(long locationViewID, long locationViewTypeID, string x, string y, string z, string userID)
        {
            try
            {
                LocationView loc = db.LocationViews.Find(locationViewID);
                loc.LocationViewTypeID = locationViewID;
                loc.X = x;
                loc.Y = y;
                loc.Z = z;
                db.SaveChanges();
                return UnitOfWork.resultInfo.GenerateOKResult("Saved", loc.ID);
            }
            catch
            {
                return UnitOfWork.resultInfo.GetResultByID(1);
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
                return UnitOfWork.resultInfo.GenerateOKResult("Saved", loc.ID);
            }
            catch
            {
                return UnitOfWork.resultInfo.GetResultByID(1);
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
                return UnitOfWork.resultInfo.GetResultByID(1);
            }
            lnk.LocationID = locationID;
            lnk.LocationViewID = locationViewID;
            db.LinkLocationsLocationViews.Add(lnk);
            db.SaveChanges();
            return UnitOfWork.resultInfo.GenerateOKResult();
        }
        #endregion

        #region DeAttachLocation
        public ResultInfo.Result DeattachLocation(long locationViewID, long locationID, string userID)
        {
            List<LinkLocationsLocationView> lnks = db.LinkLocationsLocationViews.Where(l => l.LocationID == locationID && l.LocationViewID == locationViewID).ToList();
            if (lnks.Count != 1)
            {
                return UnitOfWork.resultInfo.GetResultByID(1);
            }
            LinkLocationsLocationView lnk = lnks[0];
            db.LinkLocationsLocationViews.Remove(lnk);
            db.SaveChanges();
            return UnitOfWork.resultInfo.GenerateOKResult();
        }
        #endregion
    }
}
