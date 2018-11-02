using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DynThings.Core;
using System.Collections;
using System.Net.Http;
using System.Net;

using DynThings.Data.Models;
using DynThings.Data.Repositories;
using DynThings.WebAPI.Models;
using DynThings.WebAPI.Models.RequestModels;
using DynThings.WebAPI.Models.ResponseModels;

using PagedList;


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

        public UnitOfWork_Repositories uof_Repositories = new UnitOfWork_Repositories();
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
        /// <returns>List of EndPoints.</returns>
        public APIEndpointResponseModels.GetEndpointsList GetEndPoints(string searchFor, long? deviceID,long? thingID, long? locationID, long? viewID, bool loadDevice, bool loadThing, int pageNumber, int pageSize)
        {
            APIEndpointResponseModels.GetEndpointsList result = new APIEndpointResponseModels.GetEndpointsList();

            IPagedList<Endpoint> endpointsPL = uof_Repositories.repoEndpoints.GetPagedList(searchFor, deviceID, thingID, locationID, viewID, pageNumber, pageSize);
            List<Endpoint> endpoints = endpointsPL.ToList();

            List<APIEndPoint> listAPIEndpoints = new List<APIEndPoint>();
            foreach(Endpoint end in endpoints)
            {
                APIEndPoint apiEnd = TypesMapper.APIEndPointAdapter.fromEndpoint(end, loadDevice, loadThing);
                listAPIEndpoints.Add(apiEnd);
            }
            result.Endpoints = listAPIEndpoints;
            
            
            PagingInfoResponseModel pagingInfo = new PagingInfoResponseModel();
            pagingInfo.CurrentPage = endpointsPL.PageNumber;
            pagingInfo.ItemsPerPage = endpointsPL.PageSize;
            pagingInfo.ItemsCount = endpointsPL.TotalItemCount;
            pagingInfo.PagesCount = endpointsPL.PageCount;
            result.PagingInfo = pagingInfo;
            return result;
        }

        #endregion

        #region GetEndPointsWithWarnings
        public APIEndpointResponseModels.GetEndpointsList GetEndPointsWithWarnings(string searchFor, long? deviceID, long? thingID, long? locationID, long? viewID, bool loadDevice, bool loadThing, int pageNumber, int pageSize)
        {
            APIEndpointResponseModels.GetEndpointsList result = new APIEndpointResponseModels.GetEndpointsList();

            IPagedList<Endpoint> endpointsPL = uof_Repositories.repoEndpoints.GetEndpointsWithWarningsPagedList(searchFor, deviceID, thingID, locationID, viewID, pageNumber, pageSize);
            List<Endpoint> endpoints = endpointsPL.ToList();

            List<APIEndPoint> listAPIEndpoints = new List<APIEndPoint>();
            foreach (Endpoint end in endpoints)
            {
                APIEndPoint apiEnd = TypesMapper.APIEndPointAdapter.fromEndpoint(end, loadDevice, loadThing);
                listAPIEndpoints.Add(apiEnd);
            }
            result.Endpoints = listAPIEndpoints;


            PagingInfoResponseModel pagingInfo = new PagingInfoResponseModel();
            pagingInfo.CurrentPage = endpointsPL.PageNumber;
            pagingInfo.ItemsPerPage = endpointsPL.PageSize;
            pagingInfo.ItemsCount = endpointsPL.TotalItemCount;
            pagingInfo.PagesCount = endpointsPL.PageCount;
            result.PagingInfo = pagingInfo;
            return result;
        }

        #endregion



        

        



        #endregion

    }
}
