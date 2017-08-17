using DynThings.WebAPI.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace DynThings.WebAPI.ClientServices
{
    public class LocationsServices
    {
        internal HostConfig hostconfig { get; set; }
        public LocationsServices(HostConfig hostConf)
        {
            hostconfig = hostConf;
        }

        public async Task<List<APILocation>> GetListAsync(int pageNumber, int pageSize, bool loadParents = false, bool loadChilds = false, string searchFor = "", long viewID = 0)
        {
            List<APILocation> result = new List<APILocation>();
            HttpClient client = new HttpClient();
            string getStringTask = await client.GetStringAsync(hostconfig.URL + "/api/Locations/GetLocations?token=" + hostconfig.Token
                + "&pageNumber=" + pageNumber.ToString()
                + "&pagesize=" + pageSize.ToString()
                + "&searchfor=" + searchFor.ToString()
                + "&loadParents=" + loadParents.ToString()
                + "&loadChilds=" + loadChilds.ToString()
                + "&viewID=" + viewID.ToString()
                );
            string resultstring = getStringTask;
            result = JsonConvert.DeserializeObject<List<APILocation>>(resultstring);

            return result;
        }

    }
}
