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
using DynThings.Data.Models.ViewModels;
using DynThings.WebAPI.Models.ResponseModels;
using DynThings.Data.Repositories;

namespace DynThings.WebAPI.Repositories
{
    public class APIDeviceCommandsRepository
    {
        #region Constructor
        public APIDeviceCommandsRepository(DynThingsEntities dbSource)
        {
            db = dbSource;
        }

        #endregion

        #region props
        private DynThingsEntities db;
        public long EntityID = 5;
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
        /// Get list of Device's commands.
        /// </summary>
        /// <param name="pageNumber">Page Number.</param>
        /// <param name="pageSize">Items count per page.</param>
        /// <param name="loadParents">Enable or Disable loading the Parents objects.</param>
        /// <param name="loadChilds">Enable or Disable loading the Childs objects.</param>
        /// <param name="searchFor">Search text as per the 'Title' field.</param>
        /// <param name="locationID">Filter by Location ID. You can keep it null or empty to ignore this filter.</param>
        /// <param name="DeviceID">Filter by Device ID. You can keep it null or empty to ignore this filter.</param>
        /// <returns></returns>
        public APIDeviceCommandResponseModels.GetDeviceCommandsList GetDeviceCommandsList(string searchFor, long locationID, long DeviceID, bool loadDevice, int pageNumber, int pageSize)
        {
            APIDeviceCommandResponseModels.GetDeviceCommandsList result = new APIDeviceCommandResponseModels.GetDeviceCommandsList();

            IPagedList<DeviceCommand> cmdsPL = uow_Repositories.repoDeviceCommands.GetPagedList(searchFor, DeviceID, locationID, pageNumber, pageSize);
            List<DeviceCommand> cmds = cmdsPL.ToList();

            List<APIDeviceCommand> apiCmds = new List<APIDeviceCommand>();
            foreach (DeviceCommand cmd in cmds)
            {
                APIDeviceCommand apiCmd = TypesMapper.APIDeviceCommandAdapter.fromDeviceCommand(cmd,loadDevice);
                apiCmds.Add(apiCmd);
            }
            result.DeviceCommands = apiCmds;


            PagingInfoResponseModel pagingInfo = new PagingInfoResponseModel();
            pagingInfo.CurrentPage = cmdsPL.PageNumber;
            pagingInfo.ItemsPerPage = cmdsPL.PageSize;
            pagingInfo.ItemsCount = cmdsPL.TotalItemCount;
            pagingInfo.PagesCount = cmdsPL.PageCount;
            result.PagingInfo = pagingInfo;
            return result;


        }


        #endregion

    }
}
