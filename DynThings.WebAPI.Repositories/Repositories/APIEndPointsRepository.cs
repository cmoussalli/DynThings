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
    public class APIEndPointsRepository
    {
        #region Constructor
        public APIEndPointsRepository(DynThingsEntities dbSource)
        {
            db = dbSource;
        }

        #endregion

        #region props
        private DynThingsEntities db;
        public long EntityID = 1;
        private APIEndPointsRepository repoAPIEndPoints
        {
            get
            {
                APIEndPointsRepository result = new APIEndPointsRepository(db);
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
        #region Get EndPoints

        /// <summary>
        /// Get list of EndPoints.
        /// </summary>
        /// <param name="pageNumber">Page Number.</param>
        /// <param name="pageSize">Items count per page.</param>
        /// <param name="loadParents">Enable or Disable loading the Parents objects.</param>
        /// <param name="loadChilds">Enable or Disable loading the Childs objects.</param>
        /// <param name="searchFor">Search text as per the 'Title' field.</param>
        /// <param name="DeviceID">Filter by Device ID. You can keep it null or empty to ignore this filter.</param>
        /// <returns></returns>
        public List<APIEndPoint> GetEndPoints(int pageNumber, int pageSize,bool loadParents, bool loadChilds,string searchFor,long deviceID)
        {
            List <APIEndPoint> apiEndPoints = new List<APIEndPoint>();
            List<Endpoint> endPoints = db.Endpoints.Include("EndPointCommands")
                .Where(v => 
                (searchFor == null || v.Title.Contains(searchFor))
                && ((deviceID == null || deviceID == 0) || deviceID == v.DeviceID)
                )
                .OrderBy(o => o.Title)
                .Skip(pageSize * (pageNumber - 1))
                .Take(pageSize).ToList();
                foreach (Endpoint item in endPoints)
            {
                APIEndPoint apiEndPoint = TypesMapper.APIEndPointAdapter.fromEndpoint(item,loadParents,loadChilds);
                apiEndPoints.Add(apiEndPoint);
            }
            
            return apiEndPoints;
        }

        #endregion

        #region Get Warnings
        public List<APIEndPoint> GetWarnings(int pageNumber, int pageSize, bool loadParents, bool loadChilds,long locationID, long viewID)
        {
            List<APIEndPoint> result = new List<APIEndPoint>();
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
                result.Add(TypesMapper.APIEndPointAdapter.fromEndpoint(endpoint, loadParents, loadChilds));
            }
            return result;
        }

        #endregion



        #endregion

    }
}
