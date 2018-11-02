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
        public UnitOfWork_Repositories uof_Repositories = new UnitOfWork_Repositories();
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
        public APIThingEndResponseModels.GetThingEndsList GetThingEndsList(string searchFor, long? locationID , long? thingID , long? thingCategoryID , long? endpointTypeID, bool loadThing, bool loadEndpoint,int pageNumber , int pageSize )
        {
            APIThingEndResponseModels.GetThingEndsList result = new APIThingEndResponseModels.GetThingEndsList();

            IPagedList<ThingEnd> thingEndsPL = uof_Repositories.repoThingEnds.GetPagedList(searchFor, locationID, thingID, thingCategoryID, endpointTypeID, endpointTypeID, pageNumber, pageSize);
            List<ThingEnd> thingEnds = thingEndsPL.ToList();

            List<APIThingEnd> listAPIThingEnds = new List<APIThingEnd>();
            foreach(ThingEnd te in thingEnds)
            {
                APIThingEnd apiThingEnd = TypesMapper.APIThingEndAdapter.fromThingEnd(te, loadThing, loadThing);
                listAPIThingEnds.Add(apiThingEnd);
            }
            result.ThingEnds = listAPIThingEnds;

            PagingInfoResponseModel pagingInfo = new PagingInfoResponseModel();
            pagingInfo.CurrentPage = thingEndsPL.PageNumber;
            pagingInfo.ItemsPerPage = thingEndsPL.PageSize;
            pagingInfo.ItemsCount = thingEndsPL.TotalItemCount;
            pagingInfo.PagesCount = thingEndsPL.PageCount;
            result.PagingInfo = pagingInfo;

            return result;
        }


        #endregion

    }
}
