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
using DynThings.WebAPI.Repositories;
using DynThings.WebAPI.Models.ResponseModels;

namespace DynThings.WebAPI.Repositories
{
    public class APIDevicesRepository
    {
        #region Constructor
        public APIDevicesRepository(DynThingsEntities dbSource)
        {
            db = dbSource;
        }

        #endregion

        #region props
        private DynThingsEntities db;
        public long EntityID = 4;
        private APIDevicesRepository repoAPIDevices
        {
            get
            {
                APIDevicesRepository result = new APIDevicesRepository(db);
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

        public UnitOfWork_Repositories uow_Repositories = new UnitOfWork_Repositories();
        #endregion


        #region Methods 
        /// <summary>
        /// Get List of Devices.
        /// </summary>
        /// <param name="pageNumber">Page Number.</param>
        /// <param name="pageSize">Items count per page.</param>
        /// <param name="loadParents">Enable or Disable loading the Parents objects.</param>
        /// <param name="loadChilds">Enable or Disable loading the Childs objects.</param>
        /// <param name="searchFor">Search text as per the 'Title' field.</param>
        /// <returns></returns>
        public APIDeviceResponseModels.GetDevicesList GetDevices(string searchFor,long locationID, bool loadEndpoints, bool loadDeviceCommands, int pageNumber, int pageSize)
        {
            APIDeviceResponseModels.GetDevicesList result = new APIDeviceResponseModels.GetDevicesList();

            uow_Repositories.repoDevices.GetPagedList(searchFor, locationID, pageNumber, pageSize);

            List <APIDevice> devicesList = new List<APIDevice>();
            IPagedList<Device> devicesPagedList = db.Devices.Include("DeviceStatu").Include("DeviceCommands")
                .Where(v => searchFor == null || v.Title.Contains(searchFor)).ToList().ToPagedList(pageNumber, pageSize);
            foreach (Device item in devicesPagedList)
            {
                APIDevice apiDevice = TypesMapper.APIDeviceAdapter.fromDevice(item,loadEndpoints,loadDeviceCommands);
                devicesList.Add(apiDevice);
            }
            result.Devices = devicesList;

  PagingInfoResponseModel pagingInfo = new PagingInfoResponseModel();
            pagingInfo.CurrentPage = devicesPagedList.PageNumber;
            pagingInfo.ItemsPerPage = devicesPagedList.PageSize;
            pagingInfo.ItemsCount = devicesPagedList.TotalItemCount;
            pagingInfo.PagesCount = devicesPagedList.PageCount;
            result.PagingInfo = pagingInfo;

            return result;
        }
        #endregion

    }
}
