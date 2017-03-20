using DynThings.Data.Models;
using DynThings.Data.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DynThings.Data.Models;
using DynThings.WebAPI.Models;

namespace DynThings.WebAPI.Models.TypesMapper
{

    public static class APITokenAdapter
    {
        public static APIAppUserToken fromToken(AppUserToken sourceToken)
        {
            APIAppUserToken result = new APIAppUserToken();
            result.AspNetUserID = (string)sourceToken.AspNetUserID;
            result.AppGUID = sourceToken.App.GUID;
            result.CreateDate = (DateTime)sourceToken.CreateDate;
            result.ExpireDate = (DateTime)sourceToken.ExpireDate;
            result.Token = (Guid)sourceToken.Token;

            return result;
        }
    }



}
