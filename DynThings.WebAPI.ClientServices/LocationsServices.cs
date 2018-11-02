using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using DynThings.WebAPI.Models.RequestModels;
using DynThings.WebAPI.Models.ResponseModels;

namespace DynThings.WebAPI.ClientServices
{
    public class LocationsServices:BaseClass
    {
        internal HostConfig hostconfig { get; set; }
        public LocationsServices(HostConfig hostConf)
        {
            hostconfig = hostConf;
            BaseURI = hostconfig.URL;
        }

        public async Task<APILocationResponseModels.GetLocationsList> GetListAsync(APILocationRequestModels.GetLocationsList rm)
        {
            string strResult = await HttpPost("/api/Locations/GetLocationsList", JsonConvert.SerializeObject(rm));
            APILocationResponseModels.GetLocationsList result = (APILocationResponseModels.GetLocationsList)JsonConvert.DeserializeObject(strResult, typeof(APILocationResponseModels.GetLocationsList));
            return result;
            
        }

        public async Task<APILocationResponseModels.GetLocationsList> GetLocationsWithWarningsListAsync(APILocationRequestModels.GetLocationsList rm)
        {
            string strResult = await HttpPost("/api/Locations/GetLocationsWithWarningsList", JsonConvert.SerializeObject(rm));
            APILocationResponseModels.GetLocationsList result = (APILocationResponseModels.GetLocationsList)JsonConvert.DeserializeObject(strResult, typeof(APILocationResponseModels.GetLocationsList));
            return result;

        }

    }
}
