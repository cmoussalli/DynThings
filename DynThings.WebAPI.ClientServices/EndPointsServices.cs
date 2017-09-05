using DynThings.WebAPI.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace DynThings.WebAPI.ClientServices
{
    public class EndPointsServices
    {
        internal HostConfig hostconfig { get; set; }
        public EndPointsServices(HostConfig hostConf)
        {
            hostconfig = hostConf;
        }

        public async Task<List<APIEndPoint>> GetListAsync(int pageNumber, int pageSize, bool loadParents = false, bool loadChilds = false, string searchFor = "", long deviceID = 0)
        {
            List<APIEndPoint> result = new List<APIEndPoint>();
            HttpClient client = new HttpClient();
            string getStringTask = await client.GetStringAsync(hostconfig.URL + "/api/Endpoints/GetEndpoints?token=" + hostconfig.Token
                + "&pageNumber=" + pageNumber.ToString()
                + "&pagesize=" + pageSize.ToString()
                + "&loadParents=" + loadParents.ToString()
                + "&loadChilds=" + loadChilds.ToString()
                + "&searchfor=" + searchFor.ToString()
                + "&deviceID=" + deviceID.ToString()
                );
            string resultstring = getStringTask;
            result = JsonConvert.DeserializeObject<List<APIEndPoint>>(resultstring);

            return result;
        }


        public async Task<List<APIEndPoint>> GetEndpointsWithWarnings(int pageNumber, int pageSize, bool loadParents = false, bool loadChilds = false, string searchFor = "", long locationID = 0, long viewID = 0)
        {
            List<APIEndPoint> result = new List<APIEndPoint>();
            HttpClient client = new HttpClient();
            string getStringTask = await client.GetStringAsync(hostconfig.URL + "/api/Endpoints/GetEndpointsWithWarnings?token=" + hostconfig.Token
                + "&pageNumber=" + pageNumber.ToString()
                + "&pagesize=" + pageSize.ToString()
                + "&loadParents=" + loadParents.ToString()
                + "&loadChilds=" + loadChilds.ToString()
                + "&searchfor=" + searchFor.ToString()
                + "&locationID=" + locationID.ToString()
                + "&viewID=" + viewID.ToString()
                );
            string resultstring = getStringTask;
            result = JsonConvert.DeserializeObject<List<APIEndPoint>>(resultstring);

            return result;
        }


    }
}
