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
    public class APIThingEndsRepository
    {
        #region Constructor
        public APIThingEndsRepository(DynThingsEntities dbSource)
        {
            db = dbSource;
        }

        #endregion

        #region props
        private DynThingsEntities db;
        public long EntityID = 12;
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
        /// <summary>
        /// Get List of ThingEnds.
        /// </summary>
        /// <param name="pageNumber">Page Number.</param>
        /// <param name="pageSize">Items count per page.</param>
        /// <param name="loadParents">Enable or Disable loading the Parents objects.</param>
        /// <param name="loadChilds">Enable or Disable loading the Childs objects.</param>
        /// <param name="searchFor">Search text as per the 'Title' field.</param>
        /// <param name="locationID">Filter by Location ID. You can keep it null or empty to ignore this filter.</param>
        /// <param name="thingID">Filter by Thing ID. You can keep it null or empty to ignore this filter.</param>
        /// <param name="thingCategoryID">Filter by ThingCategory ID. You can keep it null or empty to ignore this filter.</param>
        /// <param name="endpointTypeID">Filter by EndPointType ID. You can keep it null or empty to ignore this filter.</param>
        /// <returns></returns>
        public List<APIThingEnd> GetThingEnds(int pageNumber , int pageSize, bool loadParents, bool loadChilds ,string searchFor, long locationID , long thingID , long thingCategoryID , long endpointTypeID )
        {
            List<APIThingEnd> result = new List<APIThingEnd>();
            List<ThingEnd> thingEnds = db.ThingEnds.Where(e =>

            ((e.Thing.Title.Contains(searchFor) || (searchFor == null || searchFor == ""))
            && ((e.ThingID == thingID) || (thingID == null || thingID == 0))
            && ((e.EndPointTypeID == endpointTypeID) || (endpointTypeID == null || endpointTypeID == 0))
            && ((e.Thing.CategoryID == thingCategoryID) || (thingCategoryID == null || thingCategoryID == 0))
            && ((e.Thing.LinkThingsLocations.Any(l => l.LocationID == locationID)) || (locationID == null || locationID == 0))
            )).OrderBy(o => o.ThingID).ThenBy(o => o.EndPointTypeID)
            .Skip(pageSize * (pageNumber - 1)).Take(pageSize).ToList();

            foreach (ThingEnd te in thingEnds)
            {
                APIThingEnd apiThingEnd = new APIThingEnd();
                apiThingEnd = TypesMapper.APIThingEndAdapter.fromThingEnd(te, loadParents,loadChilds);
                result.Add(apiThingEnd);
            }

            return result;
        }


        #endregion

    }
}
