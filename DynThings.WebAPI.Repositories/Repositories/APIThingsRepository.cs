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
    public class APIThingsRepository
    {
        #region Constructor
        public APIThingsRepository(DynThingsEntities dbSource)
        {
            db = dbSource;
        }

        #endregion

        #region props
        private DynThingsEntities db;
        public long EntityID = 11;
      
        private APIUtilizationsRepository repoAPIUtilizations
        {
            get
            {
                APIUtilizationsRepository result = new APIUtilizationsRepository(db);
                return result;
            }
        }
        #endregion


        #region Methods 

        #region Get Things
        /// <summary>
        /// Get List of Things.
        /// </summary>
        /// <param name="pageNumber">Page Number.</param>
        /// <param name="pageSize">Items count per page.</param>
        /// <param name="loadParents">Enable or Disable loading the Parents objects.</param>
        /// <param name="loadChilds">Enable or Disable loading the Childs objects.</param>
        /// <param name="searchFor">Search text as per the 'Title' field.</param>
        /// <param name="locationID">Filter by Location ID. You can keep it null or empty to ignore this filter.</param>
        /// <returns></returns>
        public List<APIThing> GetThings(int pageNumber, int pageSize, bool loadParents, bool loadChilds, string searchFor, long locationID)
        {
            List<APIThing> result = new List<APIThing>();
            List<Thing> thingsLst = db.Things.Include("ThingCategory").Include("LinkThingsLocations").Include("ThingExtensionValues")
                        .Where(e => 
                        ((searchFor == null || searchFor =="") || e.Title.Contains(searchFor))
                        && ((locationID==null || locationID == 0) || (e.LinkThingsLocations.Any(l => l.LocationID == locationID)))
                        && e.ID > 0
                        )
                        .OrderBy(e => e.Title).Skip(pageSize * (pageNumber - 1))
                        .Skip(pageSize *(pageNumber -1))
                        .Take(pageSize)
                        .ToList();
            foreach(Thing thing in thingsLst)
            {
                result.Add(TypesMapper.APIThingAdapter.fromThing(thing,loadParents,loadChilds));
            }
            return result;
        }

        #endregion

        #region Get Things with warnings Only
        /// <summary>
        /// Get Things list that have warnings Only.
        /// </summary>
        /// <param name="pageNumber">Page Number.</param>
        /// <param name="pageSize">Items count per page.</param>
        /// <param name="loadParents">Enable or Disable loading the Parents objects.</param>
        /// <param name="loadChilds">Enable or Disable loading the Childs objects.</param>
        /// <param name="locationID">The requested Location to validate it's own things for a warnings</param>
        /// <returns>List of Locations that have one warning or more.</returns>
        public List<APIThing> GetThingsWithWarnings(int pageNumber, int pageSize, bool loadParents, bool loadChilds, long locationID)
        {
            List<APIThing> apiThings = new List<APIThing>();
            List<Thing> things = db.Things
                .Where(t =>
                       t.LinkThingsLocations.Any(
                                        lt =>
                                            (lt.LocationID == locationID || (locationID == null || locationID == 0  )  )
                                            && lt.Thing.Endpoints.Any(
                                                             e => e.IsNumericOnly == true
                                                            && (e.LastIONumericValue >= e.HighRange || e.LastIONumericValue <= e.LowRange)
                                                                        )
                                            )
                )
                .OrderBy(o => o.Title)
                .Skip((pageNumber - 1) * pageSize)
                .Take(pageSize).ToList();
            foreach (Thing item in things)
            {
                APIThing apiThing = TypesMapper.APIThingAdapter.fromThing(item, loadParents, loadChilds);
                apiThings.Add(apiThing);
            }
            return apiThings;
        }
        #endregion


        #endregion

    }
}
