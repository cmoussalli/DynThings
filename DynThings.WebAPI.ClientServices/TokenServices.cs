using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using DynThings.WebAPI.Models;
using DynThings.WebAPI.Models.RequestModels;
using DynThings.WebAPI.Models.ResponseModels;

namespace DynThings.WebAPI.ClientServices
{
    public class TokenServices: BaseClass
    {
        internal HostConfig hostconfig { get; set; }
        public TokenServices(HostConfig hostConf)
        {
            hostconfig = hostConf;
            BaseURI = hostConf.URL;
        }

        public async Task<APIAppUserTokenResponseModels.ValidateToken> ValidateToken()
        {
            APIAppUserTokenRequestModels.ValidateToken model = new APIAppUserTokenRequestModels.ValidateToken();
            model.Token = Guid.Parse(hostconfig.Token);
            string strResult = await HttpPost("api/APPTokens/ValidateToken", JsonConvert.SerializeObject(model));
            APIAppUserTokenResponseModels.ValidateToken result = (APIAppUserTokenResponseModels.ValidateToken)JsonConvert.DeserializeObject(strResult, typeof(APIAppUserTokenResponseModels.ValidateToken));
            return result;
        }

        public async Task<APIAppUserTokenResponseModels.GetTokenInfo> GetTokenInfo()
        {
            APIAppUserTokenRequestModels.GetTokenInfo model = new APIAppUserTokenRequestModels.GetTokenInfo();
            model.Token = Guid.Parse(hostconfig.Token);
            string strResult = await HttpPost("api/apptokens/GetTokenInfo", JsonConvert.SerializeObject(model));
            APIAppUserTokenResponseModels.GetTokenInfo result = (APIAppUserTokenResponseModels.GetTokenInfo)JsonConvert.DeserializeObject(strResult, typeof(APIAppUserTokenResponseModels.GetTokenInfo));
            return result;
        }

        public async Task<APIAppUserTokenResponseModels.GetNewToken> GetNewToken()
        {
            APIAppUserTokenRequestModels.GetNewToken model = new APIAppUserTokenRequestModels.GetNewToken();
            model.AppGuid = Guid.Parse(hostconfig.AppGUID);
            model.UserName = hostconfig.UserName;
            model.Password = hostconfig.Password;
            string strResult = await HttpPost("api/apptokens/GetNewToken", JsonConvert.SerializeObject(model));
            APIAppUserTokenResponseModels.GetNewToken result = (APIAppUserTokenResponseModels.GetNewToken)JsonConvert.DeserializeObject(strResult, typeof(APIAppUserTokenResponseModels.GetNewToken));
            return result;
        }
       
    }
}
