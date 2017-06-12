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
        public List<APIDevice> GetDevices(int pageNumber, int pageSize,bool loadParents,bool loadChilds,string searchFor )
        {
            List <APIDevice> devicesList = new List<APIDevice>();
            IPagedList<Device> devicesPagedList = db.Devices.Include("DeviceStatu").Include("DeviceCommands")
                .Where(v => searchFor == null || v.Title.Contains(searchFor)).ToList().ToPagedList(pageNumber, pageSize);
            foreach (Device item in devicesPagedList)
            {
                APIDevice apiDevice = TypesMapper.APIDeviceAdapter.fromDevice(item,loadParents,loadChilds);
                devicesList.Add(apiDevice);
            }
            
            return devicesList;
        }
        #endregion

    }
}
