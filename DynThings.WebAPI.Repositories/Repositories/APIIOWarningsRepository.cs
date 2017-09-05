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
    public class APIIOWarningsRepository
    {
        #region Constructor
        public APIIOWarningsRepository(DynThingsEntities dbSource)
        {
            db = dbSource;
        }

        #endregion

        #region props
        private DynThingsEntities db;
        public long EntityID = 13;
        private APIIOWarningsRepository repoAPIIOWarnings
        {
            get
            {
                APIIOWarningsRepository result = new APIIOWarningsRepository(db);
                return result;
            }
        }
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

        #region Get Warnings
        /// <summary>
        /// 
        /// </summary>
        /// <param name="pageNumber">Page Number.</param>
        /// <param name="pageSize">Items count per page.</param>
        /// <param name="locationID">Filter by Location ID. You can keep it null or empty to ignore this filter.</param>
        /// <param name="viewID">Filter by Location View ID. You can keep it null or empty to ignore this filter.</param>
        /// <returns>List of EndPoint IO Warnings. Include the affected list of Locations and Views.  </returns>
        public List<APIEndPointIOWarning> GetEndPointIOWarnings(int pageNumber, int pageSize, long locationID, long viewID)
        {
            List<APIEndPointIOWarning> result = new List<APIEndPointIOWarning>();
            List<Endpoint> endpointsLst = db.Endpoints.Include("Thing")
                        .Where(e =>
                        ((viewID == null || viewID == 0) || (e.Thing.LinkThingsLocations.Any(l => l.Location.LinkLocationsLocationViews.Any(v => v.LocationViewID == viewID))))
                        && ((locationID == null || locationID == 0) || (e.Thing.LinkThingsLocations.Any(l => l.LocationID == locationID)))
                        && (e.IsNumericOnly == true)
                        &&( (e.LastIONumericValue <= e.LowRange) || (e.LastIONumericValue >= e.HighRange))
                        )
                        .OrderByDescending(e => e.LastIOTimeStamp).Skip(pageSize * (pageNumber - 1))
                        .Skip(pageSize * (pageNumber - 1))
                        .Take(pageSize)
                        .ToList();
            foreach (Endpoint endpoint in endpointsLst)
            {
                APIEndPointIOWarning w = new APIEndPointIOWarning();
                w.SourceEndPoint = TypesMapper.APIEndPointAdapter.fromEndpoint(endpoint, false, false);
                w.SourceThing = TypesMapper.APIThingAdapter.fromThing(endpoint.Thing, false, false);

                List<APILocation> wl = new List<APILocation>();
                foreach(LinkThingsLocation l in endpoint.Thing.LinkThingsLocations)
                {
                    w.AffectedLocations.Add(TypesMapper.APILocationAdapter.fromLocation( l.Location,false,false));
                    foreach (LinkLocationsLocationView v in l.Location.LinkLocationsLocationViews)
                    {
                        w.AffectedLocationViews.Add(TypesMapper.APILocationViewAdapter.fromLocationView(v.LocationView,false));
                    }
                }

                result.Add(w); 
            }
            return result;

        }

        #endregion



        #endregion

    }
}
