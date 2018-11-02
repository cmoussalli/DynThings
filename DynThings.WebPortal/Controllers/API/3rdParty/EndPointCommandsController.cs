using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using DynThings.Data.Models;
using DynThings.Core;
using DynThings.WebAPI.Models;
using DynThings.WebAPI.Models.RequestModels;
using DynThings.WebAPI.Models.ResponseModels;
using DynThings.WebAPI.Repositories;
using ResultInfo;

namespace DynThings.WebPortal.Controllers.API
{
    public class EndPointCommandsController : BaseAPIController
    {
        #region Props
        long entityID ;

        #endregion

        #region Constructors
        public EndPointCommandsController()
        {
            entityID = unitOfWork_WebAPI.repoAPIEndPointCommands.EntityID;
        }
        #endregion

        [HttpPost]
        [ResponseType(typeof(APIEndpointCommandResponseModels.GetEndpointCommandsList))]
        public HttpResponseMessage GetEndpointCommandsList(APIEndpointCommandRequestModels.GetEndpointCommandsList model)
        {
            int methodID = 13;
            ApiResponse tokenValidation = unitOfWork_WebAPI.repoAPIUserAppTokens.ValidateTokenEntityPermission(model.Token, entityID, methodID);
            if (tokenValidation.ResultType != ResultType.Ok)
            {
                var msg = new HttpResponseMessage(HttpStatusCode.Unauthorized) { ReasonPhrase = tokenValidation.Message };
                throw new HttpResponseException(new HttpResponseMessage(HttpStatusCode.Forbidden));
            }

            try
            {
                APIEndpointCommandResponseModels.GetEndpointCommandsList result = unitOfWork_WebAPI.repoAPIEndPointCommands.GetEndpointCommands(model.SearchFor,model.EndpointID,model.ThingID,model.LocationID,model.LoadEndpoint, model.PageNumber, model.PageSize);
                return Request.CreateResponse(HttpStatusCode.OK, result);
            }
            catch (Exception ex)
            {
                return RaiseError(ex.Message);
            }

            
        }


    }
}