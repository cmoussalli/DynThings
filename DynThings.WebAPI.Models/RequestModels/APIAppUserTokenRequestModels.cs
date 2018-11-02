using System;
using System.Collections.Generic;
using System.Text;

namespace DynThings.WebAPI.Models.RequestModels
{
    public class APIAppUserTokenRequestModels
    {
        public class GetNewToken
        {
            public Guid AppGuid { get; set; }
            public string UserName { get; set; }
            public string Password { get; set; }
        }

        public class ValidateToken
        {
            public Guid Token { get; set; }
           
        }

        public class GetTokenInfo
        {
            public Guid Token { get; set; }

        }

        public class ValidateTokenEntityPermission
        {
            public Guid Token { get; set; }
            public long EntityID { get; set; }
            public long MethodID { get; set; }
        }
    }
}
