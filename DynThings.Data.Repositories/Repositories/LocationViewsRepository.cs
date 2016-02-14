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

namespace DynThings.Data.Repositories
{
    public class LocationViewsRepository
    {
        private DynThingsEntities db = new DynThingsEntities();

        #region Get PagedList
        public IPagedList GetPagedList(string search, int pageNumber, int recordsPerPage)
        {
            IPagedList views = db.LocationViews.Where(
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
        public UnitOfWork.RepositoryMethodResultType Add(string title, long locationTypeID, string userID)
        {
            UnitOfWork.RepositoryMethodResultType result = UnitOfWork.RepositoryMethodResultType.Failed;
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
            result = UnitOfWork.RepositoryMethodResultType.Ok;
            return result;
        }
        #endregion

        #region Edit : Title
        public UnitOfWork.RepositoryMethodResultType Edit(long locationViewID ,string title, string ownerID)
        {
            UnitOfWork.RepositoryMethodResultType result = UnitOfWork.RepositoryMethodResultType.Failed;
            LocationView loc = db.LocationViews.Find(locationViewID);
            loc.Title = title;
            loc.IsActive = false;
            db.SaveChanges();
            result = UnitOfWork.RepositoryMethodResultType.Ok;
            return result;
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
        public UnitOfWork.RepositoryMethodResultType Edit(long locationViewID, long locationViewTypeID, string x, string y, string z,string userID)
        {
            UnitOfWork.RepositoryMethodResultType result = UnitOfWork.RepositoryMethodResultType.Failed;
            LocationView loc = db.LocationViews.Find(locationViewID);
            loc.LocationViewTypeID = locationViewID;
            loc.X = x;
            loc.Y = y;
            loc.Z = z;
            db.SaveChanges();
            result = UnitOfWork.RepositoryMethodResultType.Ok;
            return result;
        }
        #endregion

        #region Edit : IsActive
        /// <summary>
        /// Enable or Disable a locationView
        /// </summary>
        /// <param name="locationViewID">The selected LocationView ID.</param>
        /// <param name="isActive">Activation, True or False.</param>
        /// <returns>Result : Ok or Failed.</returns>
        public UnitOfWork.RepositoryMethodResultType IsActive(long locationViewID, bool isActive)
        {
            UnitOfWork.RepositoryMethodResultType result = UnitOfWork.RepositoryMethodResultType.Failed;
            LocationView loc = db.LocationViews.Find(locationViewID);
            loc.IsActive = isActive;
            db.SaveChanges();
            result = UnitOfWork.RepositoryMethodResultType.Ok;
            return result;
        }
        #endregion
    }
}
