using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DynThings.Core;
using DynThings.Data.Models;
using DynThings.WebAPI.Models;
using DynThings.WebAPI.Repositories;
using PagedList;
using System.Collections;
using System.Net.Http;
using System.Net;


namespace DynThings.WebAPI.Repositories
{
    public class APILocationsRepository
    {
        #region Constructor
        public APILocationsRepository(DynThingsEntities dbSource)
        {
            db = dbSource;
        }

        #endregion

        #region props
        private DynThingsEntities db;
        public long EntityID = 7;
        private APIUserAppTokensRepository repoUserAppTokensRepository
        {
            get
            {
                APIUserAppTokensRepository result = new APIUserAppTokensRepository(db);
                return result;
            }
        }
        #endregion


        #region Methods 

        #region Get Locations List
        /// <summary>
        /// Get List of Locations.
        /// </summary>
        /// <param name="pageNumber">Page Number.</param>
        /// <param name="pageSize">Items count per page.</param>
        /// <param name="loadParents">Enable or Disable loading the Parents objects.</param>
        /// <param name="loadChilds">Enable or Disable loading the Childs objects.</param>
        /// <param name="searchFor">Search text as per the 'Title' field.</param>
        /// <param name="viewID">Filter by LocationView ID. You can keep it null or empty to ignore this filter.</param>
        /// <returns></returns>
        public List<APILocation> GetLocations(int pageNumber, int pageSize, bool loadParents, bool loadChilds, string searchFor, long viewID)
        {
            List<APILocation> apiLocations = new List<APILocation>();
            List<Location> locations = db.Locations
                .Where(v =>
                    ((searchFor == null || searchFor == "") || v.Title.Contains(searchFor))
                    && ((viewID == null || viewID == 0) || (v.LinkLocationsLocationViews.Any(a => a.LocationViewID == viewID)))
                )
                .OrderBy(o => o.Title)
                .Skip((pageNumber - 1) * pageSize)
                .Take(pageSize).ToList();
            foreach (Location item in locations)
            {
                APILocation apiLocation = TypesMapper.APILocationAdapter.fromLocation(item, loadParents, loadChilds);
                apiLocations.Add(apiLocation);
            }
            return apiLocations;
        }

        #endregion


        #region Get Locations with warnings Only
        /// <summary>
        /// Get Locations list that have warnings Only.
        /// </summary>
        /// <param name="pageNumber">Page Number.</param>
        /// <param name="pageSize">Items count per page.</param>
        /// <param name="loadParents">Enable or Disable loading the Parents objects.</param>
        /// <param name="loadChilds">Enable or Disable loading the Childs objects.</param>
        /// <param name="viewID">The requested View to validate it's own locations for a warnings</param>
        /// <returns>List of Locations that have one warning or more.</returns>
        public List<APILocation> GetLocationsWithWarnings(int pageNumber, int pageSize, bool loadParents, bool loadChilds, long viewID)
        {
            List<APILocation> apiLocations = new List<APILocation>();
            List<Location> locations = db.Locations
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
                .OrderBy(o => o.Title)
                .Skip((pageNumber - 1) * pageSize)
                .Take(pageSize).ToList();
            foreach (Location item in locations)
            {
                APILocation apiLocation = TypesMapper.APILocationAdapter.fromLocation(item, loadParents, loadChilds);
                apiLocations.Add(apiLocation);
            }
            return apiLocations;
        }
        #endregion



        #endregion

    }
}
