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
    public class EndPointCommandsServices : BaseClass
    {
        internal HostConfig hostconfig { get; set; }
        public EndPointCommandsServices(HostConfig hostConf)
        {
            hostconfig = hostConf;
            BaseURI = hostconfig.URL;
        }


        public async Task<APIEndpointCommandResponseModels.GetEndpointCommandsList> GetEndPointsListAsync(APIEndpointCommandRequestModels.GetEndpointCommandsList rm)
        {
            string strResult = await HttpPost("/api/EndPointCommands/GetEndPointCommandsList", JsonConvert.SerializeObject(rm));
            APIEndpointCommandResponseModels.GetEndpointCommandsList result = (APIEndpointCommandResponseModels.GetEndpointCommandsList)JsonConvert.DeserializeObject(strResult, typeof(APIEndpointCommandResponseModels.GetEndpointCommandsList));
            return result;
        }


      
       

    }
}
