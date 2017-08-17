using DynThings.WebAPI.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;


namespace DynThings.WebAPI.ClientServices
{
    public class TokenServices
    {
        internal HostConfig hostconfig { get; set; }
        public TokenServices(HostConfig hostConf)
        {
            hostconfig = hostConf;
        }


        public async Task<ApiResponse> Validate()
        {
            ApiResponse result = new ApiResponse();
            try
            {
                HttpClient client = new HttpClient();
                string resultstring = await client.GetStringAsync(hostconfig.URL + "/api/apptokens/ValidateToken?token=" + hostconfig.Token);
                result = JsonConvert.DeserializeObject<ApiResponse>(resultstring);
            }
            catch (Exception ex)
            {
                result.Message = ex.InnerException.ToString();
            }
            return result;
        }

        public async Task<APIAppUserToken> GetTokenInfo()
        {
            APIAppUserToken result = new APIAppUserToken();
            HttpClient client = new HttpClient();
            string resultstring = await client.GetStringAsync(hostconfig.URL + "/api/apptokens/GetTokenInfo?token=" + hostconfig.Token);
            result = JsonConvert.DeserializeObject<APIAppUserToken>(resultstring);
            return result;
        }

        public async Task<APIAppUserToken> GetNewToken()
        {
            APIAppUserToken result = new APIAppUserToken();
            HttpClient client = new HttpClient();
            string resultstring = await client.GetStringAsync(hostconfig.URL + "/api/apptokens/GetNewToken?appGuid=" + hostconfig.AppGUID + "&userName=" + hostconfig.UserName + "&password=" + hostconfig.Password);
            result = JsonConvert.DeserializeObject<APIAppUserToken>(resultstring);
            return result;
        }
    }
}
