using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DynThings.Core;
using PagedList;
using System.Collections;
using System.Net.Http;
using System.Net;
using DynThings.Data.Models;
using DynThings.Data.Repositories;
using DynThings.Data.Models.ViewModels;
using DynThings.WebAPI.Models;
using DynThings.WebAPI.Models.ResponseModels;
using DynThings.WebAPI.Repositories;

namespace DynThings.WebAPI.Repositories
{
    public class APIEndPointCommandsRepository
    {
        #region Constructor
        public APIEndPointCommandsRepository(DynThingsEntities dbSource)
        {
            db = dbSource;
        }

        #endregion

        #region props
        private DynThingsEntities db;
        public long EntityID = 2;
        private APIUserAppTokensRepository repoUserAppTokensRepository
        {
            get
            {
                APIUserAppTokensRepository result = new APIUserAppTokensRepository(db);
                return result;
            }
        }

        public UnitOfWork_Repositories uow_Repositories = new UnitOfWork_Repositories();
        #endregion


        #region Methods 
        /// <summary>
        /// Get List of EndPoint Commands.
        /// </summary>
        /// <param name="pageNumber">Page Number.</param>
        /// <param name="pageSize">Items count per page.</param>
        /// <param name="loadParents">Enable or Disable loading the Parents objects.</param>
        /// <param name="loadChilds">Enable or Disable loading the Childs objects.</param>
        /// <param name="searchFor">Search text as per the 'Title' field.</param>
        /// <param name="locationID">Filter by Location ID. You can keep it null or empty to ignore this filter.</param>
        /// <param name="ThingID">Filter by Thing ID. You can keep it null or empty to ignore this filter.</param>
        /// <param name="EndPointID">Filter by EndPoint ID. You can keep it null or empty to ignore this filter.</param>
        /// <returns></returns>
        public APIEndpointCommandResponseModels.GetEndpointCommandsList GetEndpointCommands(string searchFor, long EndPointID, long ThingID, long locationID, bool loadEndpoint , int pageNumber, int pageSize)
        {
            APIEndpointCommandResponseModels.GetEndpointCommandsList result = new APIEndpointCommandResponseModels.GetEndpointCommandsList();

            IPagedList<EndPointCommand> endpointCommandsPL = uow_Repositories.repoEndPointCommands.GetPagedList(searchFor,EndPointID,ThingID,locationID, pageNumber, pageSize);
            List<EndPointCommand> endpointCommands = endpointCommandsPL.ToList();

            List<APIEndPointCommand> listAPIEndpointCommands = new List<APIEndPointCommand>();
            foreach (EndPointCommand cmd in endpointCommands)
            {
                APIEndPointCommand apiCMD = TypesMapper.APIEndPointCommandAdapter.fromEndpointCommand(cmd,loadEndpoint);
                listAPIEndpointCommands.Add(apiCMD);
            }
            result.EndpointCommands = listAPIEndpointCommands;


            PagingInfoResponseModel pagingInfo = new PagingInfoResponseModel();
            pagingInfo.CurrentPage = endpointCommandsPL.PageNumber;
            pagingInfo.ItemsPerPage = endpointCommandsPL.PageSize;
            pagingInfo.ItemsCount = endpointCommandsPL.TotalItemCount;
            pagingInfo.PagesCount = endpointCommandsPL.PageCount;
            result.PagingInfo = pagingInfo;
            return result;
        }


        #endregion

    }
}
