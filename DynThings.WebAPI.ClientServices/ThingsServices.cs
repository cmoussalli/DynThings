using DynThings.WebAPI.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace DynThings.WebAPI.ClientServices
{
    public class ThingsServices
    {
        internal HostConfig hostconfig { get; set; }
        public ThingsServices(HostConfig hostConf)
        {
            hostconfig = hostConf;
        }

        public async Task<List<APIThing>> GetListAsync(int pageNumber, int pageSize, bool loadParents = false, bool loadChilds = false, string searchFor = "", int locationID = 0)
        {
            List<APIThing> result = new List<APIThing>();
            HttpClient client = new HttpClient();
            string getStringTask = await client.GetStringAsync(hostconfig.URL + "/api/Things/GetThings?token=" + hostconfig.Token
                + "&pageNumber=" + pageNumber.ToString()
                + "&pagesize=" + pageSize.ToString()
                + "&searchfor=" + searchFor.ToString()
                + "&loadParents=" + loadParents.ToString()
                + "&loadChilds=" + loadChilds.ToString()
                + "&locationID=" + locationID.ToString()
                );
            string resultstring = getStringTask;
            result = JsonConvert.DeserializeObject<List<APIThing>>(resultstring);
            return result;
        }

        public async Task<List<APIThing>> GetThingsWithWarnings(int pageNumber, int pageSize, bool loadParents = false, bool loadChilds = false, int locationID = 0)
        {
            List<APIThing> result = new List<APIThing>();
            HttpClient client = new HttpClient();
            string getStringTask = await client.GetStringAsync(hostconfig.URL + "/api/Things/GetThingsWithWarnings?token=" + hostconfig.Token
                + "&pageNumber=" + pageNumber.ToString()
                + "&pagesize=" + pageSize.ToString()
                + "&loadParents=" + loadParents.ToString()
                + "&loadChilds=" + loadChilds.ToString()
                + "&locationID=" + locationID.ToString()
                );
            string resultstring = getStringTask;
            result = JsonConvert.DeserializeObject<List<APIThing>>(resultstring);
            return result;
        }


    }
}
