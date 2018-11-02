using System;
using System.Text;
using System.Collections.Generic;
using System.Net.Http;
using System.Threading.Tasks;
using Newtonsoft.Json;
using DynThings.WebAPI.Models;
using DynThings.WebAPI.Models.RequestModels;
using DynThings.WebAPI.Models.ResponseModels;

namespace DynThings.WebAPI.ClientServices
{
    public class DeviceCommandsServices : BaseClass
    {
        internal HostConfig hostconfig { get; set; }
        public DeviceCommandsServices(HostConfig hostConf)
        {
            hostconfig = hostConf;
            BaseURI = hostconfig.URL;
        }


        public async Task<APIDeviceCommandResponseModels.GetDeviceCommandsList> GetDevicesListAsync(APIDeviceCommandRequestModels.GetDeviceCommandsList rm)
        {
            string strResult = await HttpPost("/api/DeviceCommands/GetDeviceCommandsList", JsonConvert.SerializeObject(rm));
            APIDeviceCommandResponseModels.GetDeviceCommandsList result = (APIDeviceCommandResponseModels.GetDeviceCommandsList)JsonConvert.DeserializeObject(strResult, typeof(APIDeviceCommandResponseModels.GetDeviceCommandsList));
            return result;
        }


      
       

    }
}
