using DynThings.WebAPI.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace DynThings.WebAPI.ClientServices
{
    public class AppsServices
    {
        internal HostConfig hostconfig { get; set; }
        public AppsServices(HostConfig hostConf)
        {
            hostconfig = hostConf;
        }

        public async Task<APIApp> GetInfoAsync(Guid guid)
        {
            APIApp result = new APIApp();
            HttpClient client = new HttpClient();
            string getStringTask = await client.GetStringAsync(hostconfig.URL + "/api/Apps/GetInfo?guid=" + guid.ToString());
            string resultstring = getStringTask;
            result = JsonConvert.DeserializeObject<APIApp>(resultstring);

            return result;
        }

    }
}
