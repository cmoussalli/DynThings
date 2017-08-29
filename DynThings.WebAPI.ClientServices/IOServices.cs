using DynThings.WebAPI.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace DynThings.WebAPI.ClientServices
{
    public class IOServices
    {
        internal HostConfig hostconfig { get; set; }
        public IOServices(HostConfig hostConf)
        {
            hostconfig = hostConf;
        }

        #region Submit Input
        public async Task<ApiResponse> SubmitEndPointInput(Guid endPointKeyPass, string value)
        {
            SubmissionEndPointIO sub = new SubmissionEndPointIO();
            sub.KeyPass = endPointKeyPass.ToString();
            sub.Value = value;
            var content = new StringContent(JsonConvert.SerializeObject(sub));
            content.Headers.ContentType.MediaType = "application/json";
            ApiResponse result = new ApiResponse();
            HttpClient client = new HttpClient();
            HttpResponseMessage httpResponse = await client.PostAsync(hostconfig.URL + "/api/thingsIO/SubmitEndPointInput", content);
            string resultstring = httpResponse.Content.ReadAsStringAsync().Result;
            result = JsonConvert.DeserializeObject<ApiResponse>(resultstring);
            return result;
        }
        #endregion

        #region Submit Log
        public async Task<ApiResponse> SubmitEndPointLog(Guid endPointKeyPass, string value)
        {
            SubmissionEndPointIO sub = new SubmissionEndPointIO();
            sub.KeyPass = endPointKeyPass.ToString();
            sub.Value = value;
            var content = new StringContent(JsonConvert.SerializeObject(sub));
            content.Headers.ContentType.MediaType = "application/json";
            ApiResponse result = new ApiResponse();
            HttpClient client = new HttpClient();
            HttpResponseMessage httpResponse = await client.PostAsync(hostconfig.URL + "/api/thingsIO/SubmitEndPointLog", content);
            string resultstring = httpResponse.Content.ReadAsStringAsync().Result;
            result = JsonConvert.DeserializeObject<ApiResponse>(resultstring);
            return result;
        }
        #endregion

        #region Pending Commands
        public async Task<List<APIEndPointIO>> GetEndPointPendingCommands(Guid endPointKeyPass)
        {
            List<APIEndPointIO> result = new List<APIEndPointIO>();
            HttpClient client = new HttpClient();
            string getStringTask = await client.GetStringAsync(hostconfig.URL + "/api/thingsIO/GetEndPointPendingCommands"
                + "&endPointKeyPass=" + endPointKeyPass.ToString()
                );
            string resultstring = getStringTask;
            result = JsonConvert.DeserializeObject<List<APIEndPointIO>>(resultstring);
            return result;
        }
        #endregion

        #region Set Command as Executed
        public async Task<ApiResponse> SetEndPointCommandAsExecuted(long commandID, Guid endPointKeyPass)
        {
            ApiResponse result = new ApiResponse();
            HttpClient client = new HttpClient();
            string getStringTask = await client.GetStringAsync(hostconfig.URL + "/api/thingsIO/SetEndPointCommandAsExecuted"
                + "&EndPointCommandIOID=" + commandID.ToString()
                + "EndPointKeyPass=" + endPointKeyPass
                );
            string resultstring = getStringTask;
            result = JsonConvert.DeserializeObject<ApiResponse>(resultstring);

            return result;
        }
        #endregion

    }
}
