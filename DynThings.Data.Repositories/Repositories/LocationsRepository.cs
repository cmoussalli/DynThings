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
        private DynThingsEntities db = new DynThingsEntities();

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

        public IPagedList GetPagedList(string search, int pageNumber, int recordsPerPage)
        {
            IPagedList locs = db.Locations
              .Where(e => search == null || e.Title.Contains(search))
              .OrderBy(e => e.Title).ToList()
              .ToPagedList(pageNumber, recordsPerPage);
            return locs;
        }

        public IPagedList GetPagedList(string search,long locationViewID, int pageNumber, int recordsPerPage)
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
            List<Location> locs =  db.Locations.Where(l => l.ID == id).ToList();
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

    }
}
