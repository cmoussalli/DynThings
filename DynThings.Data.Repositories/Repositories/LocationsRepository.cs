/////////////////////////////////////////////////////////////////
// Created by : Caesar Moussalli                               //
// TimeStamp  : 31-1-2016                                      //
// Content    : Handle Locations CRUD                          //
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
    public class LocationsRepository
    {
        #region Constructor
        public DynThingsEntities db { get; set; }
        public LocationsRepository(DynThingsEntities dynThingsEntities)
        {
            db = dynThingsEntities;
        }
        #endregion


        #region GetList
        /// <summary>
        /// Get list of Locations
        /// </summary>
        /// <returns>List of Locations </returns>
        public List<Location> GetList()
        {
            List<Location> locs = db.Locations.ToList();
            return locs;
        }

        public List<Location> GetList(string search)
        {
            List<Location> locs = db.Locations
                .Where(e => search == null || e.Title.Contains(search))
                .ToList();
            return locs;
        }
        #endregion

        #region Get PagedList
        public IPagedList GetPagedList(string search, int pageNumber, int recordsPerPage)
        {
            IPagedList locs = db.Locations
              .Where(e => search == null || e.Title.Contains(search))
              .OrderBy(e => e.Title).ToList()
              .ToPagedList(pageNumber, recordsPerPage);
            return locs;
        }

        public IPagedList GetPagedList(string search, long locationViewID, int pageNumber, int recordsPerPage)
        {
            IPagedList locs = db.Locations
              .Where(e => search == null || e.Title.Contains(search)
              && e.LinkLocationsLocationViews.Any(l => l.LocationViewID.Equals(locationViewID))
              )
              .OrderBy(e => e.Title).ToList()
              .ToPagedList(pageNumber, recordsPerPage);
            return locs;
        }
        #endregion

        #region Find
        /// <summary>
        /// Find Location by Location ID
        /// </summary>
        /// <param name="id">Location ID</param>
        /// <returns>Location object</returns>
        public Location Find(int id)
        {
            Location loc = new Location();
            List<Location> locs = db.Locations.Where(l => l.ID == id).ToList();
            if (locs.Count == 1)
            {
                loc = locs[0];
            }
            else
            {
                throw new Exception("Not Found");
            }
            return loc;
        }
        #endregion

        #region Add
        public ResultInfo.Result Add(string title)
        {
            try
            {
                Location loc = new Location();
                loc.GUID = Guid.NewGuid();
                loc.Title = title;
                loc.isActive = false;
                loc.Status = 1;
                loc.IconID = 1;
                loc.LatitudeX = "";
                loc.LongitudeY = "";
                db.Locations.Add(loc);
                db.SaveChanges();
                return UnitOfWork.resultInfo.GenerateOKResult("Saved", loc.ID);
            }
            catch
            {
                return UnitOfWork.resultInfo.GetResultByID(1);
            }
        }

        #endregion

        #region Edit
        public ResultInfo.Result Edit(long id, string title, string longitudeY, string latitudeX, bool isActive, long status, long iconID)
        {
            try
            {
                Location loc = db.Locations.Find(id);
                loc.Title = title;
                loc.LongitudeY = longitudeY;
                loc.LatitudeX = latitudeX;
                loc.isActive = isActive;
                loc.Status = status;
                loc.IconID = iconID;
                db.SaveChanges();
                return UnitOfWork.resultInfo.GenerateOKResult("Saved", loc.ID);
            }
            catch
            {
                return UnitOfWork.resultInfo.GetResultByID(1);
            }
        }

        public ResultInfo.Result EditMain(long id, string title, bool isActive)
        {
            try
            {
                Location loc = db.Locations.Find(id);
                loc.Title = title;
                loc.isActive = isActive;
                db.SaveChanges();
                return UnitOfWork.resultInfo.GenerateOKResult("Saved", loc.ID);
            }
            catch
            {
                return UnitOfWork.resultInfo.GetResultByID(1);
            }
        }

        public ResultInfo.Result EditGeoLocation(long id, string longitudeY, string latitudeX)
        {
            try
            {
                Location loc = db.Locations.Find(id);
                loc.LongitudeY = longitudeY;
                loc.LatitudeX = latitudeX;
                db.SaveChanges();
                return UnitOfWork.resultInfo.GenerateOKResult("Saved", loc.ID);
            }
            catch
            {
                return UnitOfWork.resultInfo.GetResultByID(1);
            }
        }

        #endregion

        #region AttachDevice
        public ResultInfo.Result AttachDevice(long locationID, long deviceID, string userID)
        {
            try
            {
                LinkDevicesLocation lnk = new LinkDevicesLocation();
                List<LinkDevicesLocation> lnks = db.LinkDevicesLocations.Where(l => l.LocationID == locationID && l.DeviceID == deviceID).ToList();
                if (lnks.Count > 0)
                {
                    return UnitOfWork.resultInfo.GetResultByID(1);
                }
                lnk.LocationID = locationID;
                lnk.DeviceID = deviceID;
                db.LinkDevicesLocations.Add(lnk);
                db.SaveChanges();
                return UnitOfWork.resultInfo.GenerateOKResult("Saved");
            }
            catch
            {
                return UnitOfWork.resultInfo.GetResultByID(1);
            }
        }
        #endregion

        #region DeAttachDevice
        public ResultInfo.Result DeattachDevice(long locationID, long deviceID, string userID)
        {
            try
            {
                List<LinkDevicesLocation> lnks = db.LinkDevicesLocations.Where(l => l.LocationID == locationID && l.DeviceID == deviceID).ToList();
                if (lnks.Count != 1)
                {
                    return UnitOfWork.resultInfo.GetResultByID(1);
                }
                LinkDevicesLocation lnk = lnks[0];
                db.LinkDevicesLocations.Remove(lnk);
                db.SaveChanges();
                return UnitOfWork.resultInfo.GenerateOKResult("Saved");
            }
            catch
            {
                return UnitOfWork.resultInfo.GetResultByID(1);
            }
        }
        #endregion
    }
}
