using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DynThings.Core;
using DynThings.WebAPI.Models;
using DynThings.WebAPI.Repositories;
using DynThings.Data.Models;

namespace DynThings.WebPortal.Controllers.API
{
    public class APPTokensController : ApiController
    {

        #region Props
        UnitOfWork_WebAPI uow_APIs = new UnitOfWork_WebAPI();

        #endregion

        [HttpGet]
        public APIAppUserToken GetTokenInfo(Guid token)
        {
            try
            {
                return uow_APIs.repoAPIUserAppTokens.GetTokenInfo(token);
            }
            catch
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
        }

        [HttpGet]
        public ResultInfo.Result ValidateToken(Guid token)
        {
            try
            {
                return uow_APIs.repoAPIUserAppTokens.ValidateToken(token);
            }
            catch
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
        }

        [HttpGet]
        public ResultInfo.Result ValidateTokenEntityPermission(Guid token,long entityID)
        {
            int methodID = 5;
            try
            {
                return uow_APIs.repoAPIUserAppTokens.ValidateTokenEntityPermission(token,entityID,methodID);
            }
            catch
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
        }

        public APIAppUserToken GetNewToken(Guid appGuid, string userName, string password)
        {
            return uow_APIs.repoAPIUserAppTokens.GetNewToken(appGuid, userName, password);
        }
    }
}
