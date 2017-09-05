using DynThings.WebAPI.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace DynThings.WebAPI.ClientServices
{
    public class LocationViewsServices
    {
        internal HostConfig hostconfig { get; set; }
        public LocationViewsServices(HostConfig hostConf)
        {
            hostconfig = hostConf;
        }


        public async Task<List<APILocationView>> GetListAsync(int pageNumber, int pageSize, string searchFor = "", bool loadParents = false, bool loadChilds = false)
        {
            List<APILocationView> result = new List<APILocationView>();
            HttpClient client = new HttpClient();
            string getStringTask = await client.GetStringAsync(hostconfig.URL + "/api/LocationViews/GetLocationViews?token=" + hostconfig.Token
                + "&pageNumber=" + pageNumber.ToString()
                + "&pagesize=" + pageSize.ToString()
                + "&searchfor=" + searchFor.ToString()
                + "&loadParents=" + loadParents.ToString()
                + "&loadChilds=" + loadChilds.ToString()
                );
            string resultstring = getStringTask;
            result = JsonConvert.DeserializeObject<List<APILocationView>>(resultstring);

            return result;
        }

        public async Task<List<APILocationView>> GetLocationViewsWithWarnings(int pageNumber, int pageSize, bool loadParents = false, bool loadChilds = false)
        {
            List<APILocationView> result = new List<APILocationView>();
            HttpClient client = new HttpClient();
            string getStringTask = await client.GetStringAsync(hostconfig.URL + "/api/LocationViews/GetLocationViewsWithWarnings?token=" + hostconfig.Token
                + "&pageNumber=" + pageNumber.ToString()
                + "&pagesize=" + pageSize.ToString()
                + "&loadParents=" + loadParents.ToString()
                + "&loadChilds=" + loadChilds.ToString()
                );
            string resultstring = getStringTask;
            result = JsonConvert.DeserializeObject<List<APILocationView>>(resultstring);

            return result;
        }

    }
}
