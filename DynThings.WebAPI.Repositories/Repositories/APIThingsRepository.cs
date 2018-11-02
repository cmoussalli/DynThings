using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DynThings.WebAPI.Repositories;
using PagedList;
using System.Collections;
using System.Net.Http;
using System.Net;
using DynThings.Core;
using DynThings.Data.Models;
using DynThings.WebAPI.Models;
using DynThings.WebAPI.Models.ResponseModels;
using DynThings.Data.Repositories;

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

        public UnitOfWork_Repositories uof_Repositories = new UnitOfWork_Repositories();
        #endregion


        #region Methods 

        #region Get Things
        /// <summary>
        /// Get List of Things.
        /// </summary>
        /// <param name="searchFor">Search text as per the 'Title' field.</param>
        /// <param name="locationID">Filter by Location ID. You can keep it null or empty to ignore this filter.</param>
        /// <param name="pageNumber">Page Number.</param>
        /// <param name="pageSize">Items count per page.</param>
        /// <param name="loadParents">Enable or Disable loading the Parents objects.</param>
        /// <param name="loadChilds">Enable or Disable loading the Childs objects.</param>
        /// <returns></returns>
        public APIThingResponseModels.GetThingsList GetThingsList(string searchFor, long? locationID, bool loadThingEnds, bool loadEndpoints,bool loadLocation, bool loadThingExtensionValues, int pageNumber, int pageSize)
        {
            APIThingResponseModels.GetThingsList result = new APIThingResponseModels.GetThingsList();

            IPagedList<Thing> thingsPL = uof_Repositories.repoThings.GetPagedList(searchFor, locationID, pageNumber, pageSize);

            List<Thing> things = thingsPL.ToList();

            List<APIThing> listAPIThings = new List<APIThing>();
            foreach (Thing thing in things)
            {
                APIThing apiThing = TypesMapper.APIThingAdapter.fromThing(thing,loadLocation,loadThingEnds,loadThingEnds, loadThingExtensionValues);
                listAPIThings.Add(apiThing);
            }
            result.Things = listAPIThings;


            PagingInfoResponseModel pagingInfo = new PagingInfoResponseModel();
            pagingInfo.CurrentPage = thingsPL.PageNumber;
            pagingInfo.ItemsPerPage = thingsPL.PageSize;
            pagingInfo.ItemsCount = thingsPL.TotalItemCount;
            pagingInfo.PagesCount = thingsPL.PageCount;
            result.PagingInfo = pagingInfo;
            return result;
        }
        #endregion


        #region Get Things With Warnings
        /// <summary>
        /// Get List of Things.
        /// </summary>
        /// <param name="searchFor">Search text as per the 'Title' field.</param>
        /// <param name="locationID">Filter by Location ID. You can keep it null or empty to ignore this filter.</param>
        /// <param name="pageNumber">Page Number.</param>
        /// <param name="pageSize">Items count per page.</param>
        /// <param name="loadParents">Enable or Disable loading the Parents objects.</param>
        /// <param name="loadChilds">Enable or Disable loading the Childs objects.</param>
        /// <returns></returns>
        public APIThingResponseModels.GetThingsList GetThingsWithWarningsList(string searchFor, long? locationID, bool loadThingEnds, bool loadEndpoints, bool loadLocation, bool loadThingExtensionValues, int pageNumber, int pageSize)
        {
            APIThingResponseModels.GetThingsList result = new APIThingResponseModels.GetThingsList();

            IPagedList<Thing> thingsPL = uof_Repositories.repoThings.GetThingsWithWarningsPagedList(searchFor, locationID, pageNumber, pageSize);

            List<Thing> things = thingsPL.ToList();

            List<APIThing> listAPIThings = new List<APIThing>();
            foreach (Thing thing in things)
            {
                APIThing apiThing = TypesMapper.APIThingAdapter.fromThing(thing, loadLocation, loadThingEnds, loadThingEnds, loadThingExtensionValues);
                listAPIThings.Add(apiThing);
            }
            result.Things = listAPIThings;


            PagingInfoResponseModel pagingInfo = new PagingInfoResponseModel();
            pagingInfo.CurrentPage = thingsPL.PageNumber;
            pagingInfo.ItemsPerPage = thingsPL.PageSize;
            pagingInfo.ItemsCount = thingsPL.TotalItemCount;
            pagingInfo.PagesCount = thingsPL.PageCount;
            result.PagingInfo = pagingInfo;
            return result;
        }
        #endregion


        #endregion

    }
}
