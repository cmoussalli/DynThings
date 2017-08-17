using DynThings.WebAPI.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace DynThings.WebAPI.ClientServices
{
    public class ThingEndsServices
    {
        internal HostConfig hostConfig { get;set;}
        public ThingEndsServices(HostConfig hostConf)
        {
            hostConfig = hostConf;
        }


        public async Task<List<APIThingEnd>> GetListAsync(int pageNumber, int pageSize, bool loadParents = false, bool loadChilds = false, string searchFor = "", long locationID = 0, long thingID = 0, long thingCategoryID = 0, long endpointTypeID = 0, long endPointID = 0)
        {
            List<APIThingEnd> result = new List<APIThingEnd>();
            HttpClient client = new HttpClient();
            string getStringTask = await client.GetStringAsync(hostConfig.URL + "/api/ThingEnds/GetThingEnds?token=" + hostConfig.Token
             + "&pageNumber=" + pageNumber.ToString()
             + "&pagesize=" + pageSize.ToString()
             + "&loadParents=" + loadParents.ToString()
             + "&loadChilds=" + loadChilds.ToString()
             + "&searchfor=" + searchFor.ToString()
             + "&locationID=" + locationID.ToString()
             + "&thingID=" + thingID.ToString()
             + "&thingCategoryID=" + thingCategoryID.ToString()
             + "&endpointTypeID=" + endpointTypeID.ToString()
             + "&endPointID=" + endPointID.ToString()
             );
            string resultstring = getStringTask;
            result = JsonConvert.DeserializeObject<List<APIThingEnd>>(resultstring);

            return result;
        }

    }
}
