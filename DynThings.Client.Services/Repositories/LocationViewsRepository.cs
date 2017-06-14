using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net.Http;
using System.Net.Http.Headers;
using DynThings.WebAPI.Models;
using System.Net.Http;
using System.Net.Http.Headers;
using Newtonsoft.Json;

namespace DynThings.Client.Services.Repositories
{
    public class LocationViewsRepository
    {
        #region Constructor
        public LocationViewsRepository(UnitOfWorkConfiguration config)
        {
            HostURL = config.HostURL;
            Token = config.Token;
        }
        #endregion

        #region Props
        public string HostURL { get; set; }
        public string Token { get; set; }

        #endregion



        #region Methods
        public async Task<List<APILocationView>> GetList()
        {
            List<APILocationView> result = new List<APILocationView>();
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri(HostURL);
                client.DefaultRequestHeaders.Accept.Clear();
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                HttpResponseMessage response = await client.GetAsync("api/LocationViews/GetLocationViews?token=cc809d03-4c04-41f3-9d8a-c699bca41057&searchFor=&page=1&pageSize=10");
                if (response.IsSuccessStatusCode)
                {
                    IEnumerable<APILocationView> de = response.Content.ReadAsAsync<IEnumerable<APILocationView>>().Result;
                    result = de.ToList();
                }

              

            }
            return result;
        }


       

        #endregion


    }
}
