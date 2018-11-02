
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using DynThings.WebAPI.Models;
using DynThings.WebAPI.Models.RequestModels;
using DynThings.WebAPI.Models.ResponseModels;

namespace DynThings.WebAPI.ClientServices
{
    public class ThingsServices: BaseClass
    {
        internal HostConfig hostconfig { get; set; }
        public ThingsServices(HostConfig hostConf)
        {
            hostconfig = hostConf;
            BaseURI = hostconfig.URL;
        }

        public async Task<APIThingResponseModels.GetThingsList> GetThingsListAsync(APIThingRequestModels.GetThingsList rm)
        {
            string strResult = await HttpPost("/api/Things/GetThingsList", JsonConvert.SerializeObject(rm));
            APIThingResponseModels.GetThingsList result = (APIThingResponseModels.GetThingsList)JsonConvert.DeserializeObject(strResult, typeof(APIThingResponseModels.GetThingsList));
            return result;
        }

        public async Task<APIThingResponseModels.GetThingsList> GetThingsWithWarningsListAsync(APIThingRequestModels.GetThingsList rm)
        {
            string strResult = await HttpPost("/api/Things/GetThingsWithWarningsList", JsonConvert.SerializeObject(rm));
            APIThingResponseModels.GetThingsList result = (APIThingResponseModels.GetThingsList)JsonConvert.DeserializeObject(strResult, typeof(APIThingResponseModels.GetThingsList));
            return result;
        }


    }
}
