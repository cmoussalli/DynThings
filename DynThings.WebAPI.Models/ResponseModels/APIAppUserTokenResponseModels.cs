using System;
using System.Collections.Generic;
using System.Text;
using DynThings.WebAPI.Models;

namespace DynThings.WebAPI.Models.ResponseModels
{
    public class APIAppUserTokenResponseModels
    {

        public class GetTokenInfo
        {
            public APIAppUserToken AppUserToken { get; set; }
        }


        public class ValidateToken
        {
            public ApiResponse Response { get; set; }
        }


        public class ValidateTokenEntityPermission
        {
            public ApiResponse Response { get; set; }
        }

        public class GetNewToken
        {
            public APIAppUserToken AppUserToken { get; set; }
        }

    }
}
