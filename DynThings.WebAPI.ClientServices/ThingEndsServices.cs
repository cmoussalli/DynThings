
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
    public class ThingEndsServices:BaseClass
    {
        internal HostConfig hostConfig { get;set;}
        public ThingEndsServices(HostConfig hostConf)
        {
            hostConfig = hostConf;
            BaseURI = hostConfig.URL;
        }


        public async Task<APIThingEndResponseModels.GetThingEndsList> GetThingEndsListAsync(APIThingEndRequestModels.GetThingEndsList rm)
        {
            string strResult = await HttpPost("/api/ThingEnds/GetThingEndsList", JsonConvert.SerializeObject(rm));
            APIThingEndResponseModels.GetThingEndsList result = (APIThingEndResponseModels.GetThingEndsList)JsonConvert.DeserializeObject(strResult, typeof(APIThingEndResponseModels.GetThingEndsList));
            return result;
        }
        

    }
}
