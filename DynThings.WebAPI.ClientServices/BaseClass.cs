using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DynThings.WebAPI.Models;
using System.Net.Http;
using Newtonsoft.Json;


namespace DynThings.WebAPI.ClientServices
{
    public class BaseClass
    {

        public string BaseURI { get; set; }

        internal async System.Threading.Tasks.Task<string> HttpPost(string URI, string Parameters)
        {
          
            System.Net.WebRequest req = System.Net.WebRequest.Create(BaseURI + URI);
            req.ContentType = "application/json";
            req.Method = "POST";
            byte[] bytes = System.Text.Encoding.ASCII.GetBytes(Parameters);
            //req.ContentLength = bytes.Length;
            System.IO.Stream os = await req.GetRequestStreamAsync();
            os.Write(bytes, 0, bytes.Length); //Push it out there
            os.Dispose();
            System.Net.WebResponse resp = await req.GetResponseAsync();
            if (resp == null) return null;
            System.IO.StreamReader sr = new System.IO.StreamReader(resp.GetResponseStream());
            return sr.ReadToEnd().Trim();
        }

        internal async System.Threading.Tasks.Task<string> HttpGet(string URI)
        {
            HttpClient client = new HttpClient();
            string url = BaseURI + URI;
            HttpResponseMessage response = await client.GetAsync(url);
            return await response.Content.ReadAsStringAsync();
        }




    }
}
