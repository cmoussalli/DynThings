using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections;
using System.Net.Http;
using System.Net;
using PagedList;
using DynThings.Core;
using DynThings.Data.Models;
using DynThings.Data.Repositories;
using DynThings.WebAPI.Models;
using DynThings.WebAPI.Models.RequestModels;
using DynThings.WebAPI.Models.ResponseModels;
using DynThings.WebAPI.Repositories;

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
        public UnitOfWork_Repositories uof_Repositories = new UnitOfWork_Repositories();
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
        public APILocationResponseModels.GetLocationsList GetLocationsList(string searchFor, long? viewID, bool loadViews, bool loadThings, int pageNumber, int pageSize)
        {
            APILocationResponseModels.GetLocationsList result = new APILocationResponseModels.GetLocationsList();

            IPagedList<Location> locationsPL = uof_Repositories.repoLocations.GetPagedList(searchFor, viewID, pageNumber, pageSize);
            List<Location> locations = locationsPL.ToList();

            List<APILocation> listAPILocations = new List<APILocation>();
            foreach (Location location in locations)
            {
                APILocation apiLocation = TypesMapper.APILocationAdapter.fromLocation(location, loadViews, loadThings);
                listAPILocations.Add(apiLocation);
            }
            result.Locations = listAPILocations;


            PagingInfoResponseModel pagingInfo = new PagingInfoResponseModel();
            pagingInfo.CurrentPage = locationsPL.PageNumber;
            pagingInfo.ItemsPerPage = locationsPL.PageSize;
            pagingInfo.ItemsCount = locationsPL.TotalItemCount;
            pagingInfo.PagesCount = locationsPL.PageCount;
            result.PagingInfo = pagingInfo;
            return result;

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
        public APILocationResponseModels.GetLocationsList GetLocationsWithWarningsList(string searchFor, long? viewID, bool loadViews, bool loadThings, int pageNumber, int pageSize)
        {
            APILocationResponseModels.GetLocationsList result = new APILocationResponseModels.GetLocationsList();

            IPagedList<Location> locationsPL = uof_Repositories.repoLocations.GetLocationsWithWarningsPagedList(searchFor, viewID, pageNumber, pageSize);
            List<Location> locations = locationsPL.ToList();

            List<APILocation> listAPILocations = new List<APILocation>();
            foreach (Location location in locations)
            {
                APILocation apiLocation = TypesMapper.APILocationAdapter.fromLocation(location, loadViews, loadThings);
                listAPILocations.Add(apiLocation);
            }
            result.Locations = listAPILocations;


            PagingInfoResponseModel pagingInfo = new PagingInfoResponseModel();
            pagingInfo.CurrentPage = locationsPL.PageNumber;
            pagingInfo.ItemsPerPage = locationsPL.PageSize;
            pagingInfo.ItemsCount = locationsPL.TotalItemCount;
            pagingInfo.PagesCount = locationsPL.PageCount;
            result.PagingInfo = pagingInfo;
            return result;

        }

        #endregion



        #endregion

    }
}
