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
        public List<APIDeviceCommand> GetDeviceCommands(int pageNumber, int pageSize, bool loadParents,  bool loadChilds, string searchFor, long locationID, long DeviceID)
        {
            List<APIDeviceCommand> result = new List<APIDeviceCommand>();
            List<DeviceCommand> cmds = db.DeviceCommands
              .Where(e =>
              (e.Title.Contains(searchFor) || (searchFor == null || searchFor == ""))//Filter by Search "Title"
              && ((DeviceID == null || DeviceID == 0) || (e.DeviceID == DeviceID))
              && ((e.Device.LinkDevicesLocations.Any(l => l.LocationID == locationID)) || (locationID == null || locationID == 0))//Filter by locationID
              ).OrderBy(e => e.Title)
              .Skip(pageSize * (pageNumber - 1))
              .Take(pageSize).ToList();

            foreach (DeviceCommand cmd in cmds)
            {
                APIDeviceCommand apiCmd = new APIDeviceCommand();
                apiCmd = TypesMapper.APIDeviceCommandAdapter.fromDeviceCommand(cmd, loadParents, loadChilds);
                result.Add(apiCmd);
            }
            return result;
        }


        #endregion

    }
}
