using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PagedList;
using System.Collections;
using System.Net.Http;
using System.Net;

using DynThings.Core;
using DynThings.Data.Models;
using DynThings.Data.Repositories;
using DynThings.WebAPI.Models;
using DynThings.WebAPI.Models.RequestModels;
using DynThings.WebAPI.Models.ResponseModels;

namespace DynThings.WebAPI.Repositories
{
    public class APILocationViewsRepository
    {
        #region Constructor
        public APILocationViewsRepository(DynThingsEntities dbSource)
        {
            db = dbSource;
        }

        #endregion

        #region props
        private DynThingsEntities db;
        public long EntityID = 8;
        private APIUserAppTokensRepository repoUserAppTokensRepository
        {
            get
            {
                APIUserAppTokensRepository result = new APIUserAppTokensRepository(db);
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

        #region Get LocationViews
        /// <summary>
        /// Get List of LocationViews.
        /// </summary>
        /// <param name="pageNumber">Page Number.</param>
        /// <param name="pageSize">Items count per page.</param>
        /// <param name="loadParents">Enable or Disable loading the Parents objects.</param>
        /// <param name="loadChilds">Enable or Disable loading the Childs objects.</param>
        /// <param name="searchFor">Search text as per the 'Title' field.</param>
        /// <returns>Get List of LocationViews.</returns>
        public APILocationViewResponseModels.GetLocationViewsList GetLocationViewsList(string searchFor, bool loadLocations, int pageNumber, int pageSize)
        {
            APILocationViewResponseModels.GetLocationViewsList result = new APILocationViewResponseModels.GetLocationViewsList();

            IPagedList<LocationView> locationViewsPL = uof_Repositories.repoLocationViews.GetPagedList(searchFor, pageNumber, pageSize);
            List<LocationView> locationViews = locationViewsPL.ToList();

            List<APILocationView> listAPILocationViews = new List<APILocationView>();
            foreach (LocationView locationView in locationViews)
            {
                APILocationView apiLocationView = TypesMapper.APILocationViewAdapter.fromLocationView(locationView,loadLocations);
                listAPILocationViews.Add(apiLocationView);
            }
            result.Views = listAPILocationViews;


            PagingInfoResponseModel pagingInfo = new PagingInfoResponseModel();
            pagingInfo.CurrentPage = locationViewsPL.PageNumber;
            pagingInfo.ItemsPerPage = locationViewsPL.PageSize;
            pagingInfo.ItemsCount = locationViewsPL.TotalItemCount;
            pagingInfo.PagesCount = locationViewsPL.PageCount;
            result.PagingInfo = pagingInfo;
            return result;

        }
        #endregion

        #region Get LocationViews with warnings Only
        /// <summary>
        /// Get Locations list that have warnings Only.
        /// </summary>
        /// <param name="pageNumber">Page Number.</param>
        /// <param name="pageSize">Items count per page.</param>
        /// <param name="loadParents">Enable or Disable loading the Parents objects.</param>
        /// <param name="loadChilds">Enable or Disable loading the Childs objects.</param>
        /// <returns>List of LocationViews that have one warning or more.</returns>
        public APILocationViewResponseModels.GetLocationViewsList GetLocationViewsWithWarningsList(string searchFor, bool loadLocations, int pageNumber, int pageSize)
        {
            APILocationViewResponseModels.GetLocationViewsList result = new APILocationViewResponseModels.GetLocationViewsList();

            IPagedList<LocationView> locationViewsPL = uof_Repositories.repoLocationViews.GetLocationViewsWithWarningPagedList(searchFor, pageNumber, pageSize);
            List<LocationView> locationViews = locationViewsPL.ToList();

            List<APILocationView> listAPILocationViews = new List<APILocationView>();
            foreach (LocationView locationView in locationViews)
            {
                APILocationView apiLocationView = TypesMapper.APILocationViewAdapter.fromLocationView(locationView, loadLocations);
                listAPILocationViews.Add(apiLocationView);
            }
            result.Views = listAPILocationViews;


            PagingInfoResponseModel pagingInfo = new PagingInfoResponseModel();
            pagingInfo.CurrentPage = locationViewsPL.PageNumber;
            pagingInfo.ItemsPerPage = locationViewsPL.PageSize;
            pagingInfo.ItemsCount = locationViewsPL.TotalItemCount;
            pagingInfo.PagesCount = locationViewsPL.PageCount;
            result.PagingInfo = pagingInfo;
            return result;

        }
        #endregion


        #endregion

    }
}
