using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DynThings.Core;
using DynThings.WebAPI.Models;
using DynThings.WebAPI.Models.RequestModels;
using DynThings.WebAPI.Models.ResponseModels;
using DynThings.WebAPI.Repositories;
using DynThings.Data.Models;
using ResultInfo;
using System.Web.Http.Description;

namespace DynThings.WebPortal.Controllers.API
{
    public class APPTokensController : BaseAPIController
    {

        #region Props
        UnitOfWork_WebAPI uow_APIs = new UnitOfWork_WebAPI();

        #endregion

        [HttpPost]
        [ResponseType(typeof(APIAppUserTokenResponseModels.GetTokenInfo))]
        public HttpResponseMessage GetTokenInfo(APIAppUserTokenRequestModels.GetTokenInfo model)
        {
            APIAppUserTokenResponseModels.GetTokenInfo result = new APIAppUserTokenResponseModels.GetTokenInfo();
            try
            {
                APIAppUserToken apiAppUserToken =  uow_APIs.repoAPIUserAppTokens.GetTokenInfo(model.Token);
                result.AppUserToken = apiAppUserToken;
                return Request.CreateResponse(HttpStatusCode.OK, result);
            }
            catch (Exception ex)
            {
                return RaiseError(ex.Message);
            }
        }

        [HttpPost]
        [ResponseType(typeof(APIAppUserTokenResponseModels.ValidateToken))]
        public HttpResponseMessage ValidateToken(APIAppUserTokenRequestModels.ValidateToken model)
        {
            APIAppUserTokenResponseModels.ValidateToken result = new APIAppUserTokenResponseModels.ValidateToken();
            try
            {
                ApiResponse apiResponse = uow_APIs.repoAPIUserAppTokens.ValidateToken(model.Token);
                result.Response = apiResponse;
                return Request.CreateResponse(HttpStatusCode.OK, result);
            }
            catch (Exception ex)
            {
                return RaiseError(ex.Message);
            }
        }

        [HttpPost]
        [ResponseType(typeof(APIAppUserTokenResponseModels.ValidateTokenEntityPermission))]
        public HttpResponseMessage ValidateTokenEntityPermission(APIAppUserTokenRequestModels.ValidateTokenEntityPermission model)
        {
            APIAppUserTokenResponseModels.ValidateTokenEntityPermission result = new APIAppUserTokenResponseModels.ValidateTokenEntityPermission();
            int methodID = 5;
            try
            {
                result.Response = uow_APIs.repoAPIUserAppTokens.ValidateTokenEntityPermission(model.Token, model.EntityID, model.MethodID);
                return Request.CreateResponse(HttpStatusCode.OK, result);
            }
            catch (Exception ex)
            {
                return RaiseError(ex.Message);
            }
        }

        [HttpPost]
        [ResponseType(typeof(APIAppUserTokenResponseModels.GetNewToken))]
        public HttpResponseMessage GetNewToken(APIAppUserTokenRequestModels.GetNewToken model)
        {
            APIAppUserTokenResponseModels.GetNewToken result = new APIAppUserTokenResponseModels.GetNewToken();
            try
            {
                result.AppUserToken = uow_APIs.repoAPIUserAppTokens.GetNewToken(model.AppGuid, model.UserName, model.Password);
                return Request.CreateResponse(HttpStatusCode.OK, result);
            }
            catch (Exception ex)
            {
                return RaiseError(ex.Message);
            }
        }
    }
}
