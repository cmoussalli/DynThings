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
    public class EndPointsServices: BaseClass
    {
        internal HostConfig hostconfig { get; set; }
        public EndPointsServices(HostConfig hostConf)
        {
            hostconfig = hostConf;
            BaseURI = hostconfig.URL;
            
        }


        public async Task<APIEndpointResponseModels.GetEndpointsList> GetEndpointsListAsync(APIEndpointRequestModels.GetEndpointsList rm)
        {
            string strResult = await HttpPost("/api/EndPoints/GetEndpointsList", JsonConvert.SerializeObject(rm));
            APIEndpointResponseModels.GetEndpointsList result = (APIEndpointResponseModels.GetEndpointsList)JsonConvert.DeserializeObject(strResult, typeof(APIEndpointResponseModels.GetEndpointsList));
            return result;
        }


        public async Task<APIEndpointResponseModels.GetEndpointsList> GetEndpointsWithWarningsList(APIEndpointRequestModels.GetEndpointsList rm)
        {
            string strResult = await HttpPost("/api/Endpoints/GetEndpointsWithWarningsList", JsonConvert.SerializeObject(rm));
            APIEndpointResponseModels.GetEndpointsList result = (APIEndpointResponseModels.GetEndpointsList)JsonConvert.DeserializeObject(strResult, typeof(APIEndpointResponseModels.GetEndpointsList));
            return result;
        }


    }
}
