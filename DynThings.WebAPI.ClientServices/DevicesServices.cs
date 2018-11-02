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
    public class DevicesServices: BaseClass
    {
        internal HostConfig hostconfig { get; set; }
        public DevicesServices(HostConfig hostConf)
        {
            hostconfig = hostConf;
            BaseURI = hostconfig.URL;
        }


        public async Task<APIDeviceResponseModels.GetDevicesList> GetDevicesListAsync(APIDeviceRequestModels.GetDevicesList rm)
        {
            string strResult = await HttpPost("/api/Devices/GetDevicesList", JsonConvert.SerializeObject(rm));
            APIDeviceResponseModels.GetDevicesList result = (APIDeviceResponseModels.GetDevicesList)JsonConvert.DeserializeObject(strResult, typeof(APIDeviceResponseModels.GetDevicesList));
            return result;
        }


      
       

    }
}
