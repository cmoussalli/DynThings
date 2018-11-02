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
using DynThings.Core;
using ResultInfo;

namespace DynThings.Data.Repositories
{
    public class LocationsRepository
    {
        #region Constructor
        public LocationsRepository(DynThingsEntities dbSource)
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
            return db.Locations.Count();
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
        public IPagedList<Location> GetPagedList(string search, int pageNumber, int recordsPerPage)
        {
            IPagedList<Location> locs = db.Locations
              .Where(e => search == null || e.Title.Contains(search))
              .OrderBy(e => e.Title).ToList()
              .ToPagedList(pageNumber, recordsPerPage);
            return locs;
        }

        public IPagedList<Location> GetPagedList(string search, long? viewID, int pageNumber, int recordsPerPage)
        {
            IPagedList<Location> locs = db.Locations
                 .Where(v =>
                    ((search == null || search == "") || v.Title.Contains(search))
                    && ((viewID == null || viewID == 0) || (v.LinkLocationsLocationViews.Any(a => a.LocationViewID == viewID)))
                )

              .OrderBy(e => e.Title).ToList()
              .ToPagedList(pageNumber, recordsPerPage);
            return locs;
        }


        #endregion

        #region Get Locations with warnings Only PagedList
        public IPagedList<Location> GetLocationsWithWarningsPagedList(string search, long? viewID, int pageNumber, int recordsPerPage)
        {
            IPagedList<Location> locs = db.Locations
                .Where(l =>
                     ((viewID == null || viewID == 0) || (l.LinkLocationsLocationViews.Any(a => a.LocationViewID == viewID)))
                     && (
                        l.LinkThingsLocations.Any(
                                        lt => lt.Thing.Endpoints.Any(
                                                             e => e.IsNumericOnly == true
                                                            && (e.LastIONumericValue >= e.HighRange || e.LastIONumericValue <= e.LowRange)
                                            )
                            )
                     )
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
                loc.LatitudeX = "0";
                loc.LongitudeY = "0";
                db.Locations.Add(loc);
                db.SaveChanges();
                return Result.GenerateOKResult("Saved", loc.ID.ToString());
            }
            catch
            {
                return Result.GenerateFailedResult();
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
                return Result.GenerateOKResult("Saved", loc.ID.ToString());
            }
            catch
            {
                return Result.GenerateFailedResult();
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
                return Result.GenerateOKResult("Saved", loc.ID.ToString());
            }
            catch
            {
                return Result.GenerateFailedResult();
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
                Location loc = db.Locations.Find(id);
                db.Locations.Remove(loc);
                db.SaveChanges();
                return Result.GenerateOKResult("Deleted", loc.ID.ToString());
            }
            catch
            {
                return Result.GenerateFailedResult();
            }
        }

        #endregion


        #region Get LocationDevices PagedList
        public IPagedList GetLocationDevicesPagedList(string search,long LocationID, int pageNumber, int recordsPerPage)
        {
            IPagedList locs = db.LinkDevicesLocations
              .Where(e => search == null || e.Device.Title.Contains(search) && e.LocationID == LocationID)
              
              .OrderByDescending(e => e.StartTimeStamp).ToList()
              .ToPagedList(pageNumber, recordsPerPage);
            return locs;
        }
        #endregion

        #region AttachDevice
        public ResultInfo.Result AttachDevice(long locationID, long deviceID, string userID)
        {
            try
            {
                DateTime enddate = new DateTime(2100,12,31);

                Device dev = db.Devices.Find(deviceID);
                LinkDevicesLocation lnk = new LinkDevicesLocation();
               
                lnk.LocationID = locationID;
                lnk.DeviceID = deviceID;
                lnk.StartByUser = userID;
                lnk.StartTimeStamp = DateTime.UtcNow.AddHours(dev.UTC_Diff);
                //lnk.EndByUser = "";
                lnk.EndTimeStamp = enddate;
                db.LinkDevicesLocations.Add(lnk);
                db.SaveChanges();
                return Result.GenerateOKResult("Saved");
            }
            catch (Exception ex)
            {
                return Result.GenerateFailedResult(ex.Message);
            }
        }
        #endregion

        #region DeAttachDevice
        public ResultInfo.Result DeattachDevice(long lnkID, string userID)
        {
            try
            {
                List<LinkDevicesLocation> lnks = db.LinkDevicesLocations.Where(l => l.ID == lnkID).ToList();
                if (lnks.Count != 1)
                {
                    return Result.GenerateFailedResult();
                }
                LinkDevicesLocation lnk = lnks[0];
                Device dev = db.Devices.Find(lnk.DeviceID);
                lnk.EndByUser = userID;
                lnk.EndTimeStamp = DateTime.UtcNow.AddHours(dev.UTC_Diff);
                db.SaveChanges();
                return Result.GenerateOKResult("Saved");
            }
            catch
            {
                return Result.GenerateFailedResult();
            }
        }
        #endregion


        #region Get LocationThings PagedList
        public IPagedList GetLocationThingsPagedList(string search, long LocationID, int pageNumber, int recordsPerPage)
        {
            IPagedList locs = db.LinkThingsLocations
              .Where(e => 
              (search == null || e.Thing.Title.Contains(search))
              && (LocationID == null || LocationID == 0 || LocationID == e.LocationID)
              )
              .OrderByDescending(e => e.Thing.Title).ToList()
              .ToPagedList(pageNumber, recordsPerPage);
            return locs;
        }
        #endregion

        #region AttachThing
        public ResultInfo.Result AttachThing(long locationID, long ThingID, string userID)
        {
            try
            {
                Thing thing = db.Things.Find(ThingID);
                LinkThingsLocation lnk = new LinkThingsLocation();

                lnk.LocationID = locationID;
                lnk.ThingID = ThingID;
                lnk.CreateByUser = userID;
                lnk.CreateTimeStamp = DateTime.UtcNow;
                db.LinkThingsLocations.Add(lnk);

                db.SaveChanges();
                return Result.GenerateOKResult("Saved");
            }
            catch (Exception ex)
            {
                return Result.GenerateFailedResult(ex.Message);
            }
        }
        #endregion

        #region DeAttachThing
        public ResultInfo.Result DeattachThing(long lnkID, string userID)
        {
            try
            {
                List<LinkThingsLocation> lnks = db.LinkThingsLocations.Where(l => l.ID == lnkID).ToList();
                if (lnks.Count != 1)
                {
                    return Result.GenerateFailedResult();
                }
                LinkThingsLocation lnk = lnks[0];
                db.LinkThingsLocations.Remove(lnk);
                db.SaveChanges();
                return Result.GenerateOKResult("Saved");
            }
            catch
            {
                return Result.GenerateFailedResult();
            }
        }
        #endregion




    }
}
