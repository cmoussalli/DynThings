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
    public class LocationViewsServices:BaseClass
    {
        internal HostConfig hostconfig { get; set; }
        public LocationViewsServices(HostConfig hostConf)
        {
            hostconfig = hostConf;
            BaseURI = hostconfig.URL;
        }


        public async Task<APILocationViewResponseModels.GetLocationViewsList> GetListAsync(APILocationViewRequestModels.GetLocationViewsList rm)
        {
            string strResult = await HttpPost("/api/LocationViews/GetLocationViewsList", JsonConvert.SerializeObject(rm));
            APILocationViewResponseModels.GetLocationViewsList result = (APILocationViewResponseModels.GetLocationViewsList)JsonConvert.DeserializeObject(strResult, typeof(APILocationViewResponseModels.GetLocationViewsList));
            return result;

        }

        public async Task<APILocationViewResponseModels.GetLocationViewsList> GetLocationViewsWithWarningsListAsync(APILocationViewRequestModels.GetLocationViewsList rm)
        {
            string strResult = await HttpPost("/api/LocationViews/GetLocationViewsWithWarningsList", JsonConvert.SerializeObject(rm));
            APILocationViewResponseModels.GetLocationViewsList result = (APILocationViewResponseModels.GetLocationViewsList)JsonConvert.DeserializeObject(strResult, typeof(APILocationViewResponseModels.GetLocationViewsList));
            return result;

        }

        

    }
}
