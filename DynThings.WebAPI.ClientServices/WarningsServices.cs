using DynThings.WebAPI.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace DynThings.WebAPI.ClientServices
{
    public class WarningsServices
    {
        internal HostConfig hostconfig { get; set; }
        public WarningsServices(HostConfig hostConf)
        {
            hostconfig = hostConf;
        }

        public async Task<List<APIEndPointIOWarning>> GetListAsync(int pageNumber, int pageSize, bool loadParents = false, bool loadChilds = false, string searchFor = "", long viewID = 0)
        {
            List<APIEndPointIOWarning> result = new List<APIEndPointIOWarning>();
            HttpClient client = new HttpClient();
            string getStringTask = await client.GetStringAsync(hostconfig.URL + "/api/IOWarnings/GetEndPointIOWarnings?token=" + hostconfig.Token
                + "&pageNumber=" + pageNumber.ToString()
                + "&pagesize=" + pageSize.ToString()
                + "&searchfor=" + searchFor.ToString()
                + "&viewID=" + viewID.ToString()
                );
            string resultstring = getStringTask;
            result = JsonConvert.DeserializeObject<List<APIEndPointIOWarning>>(resultstring);

            return result;
        }
        
    }
}
