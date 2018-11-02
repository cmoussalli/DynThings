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
using DynThings.WebAPI.Repositories;
using DynThings.WebAPI.Models.RequestModels;
using DynThings.WebAPI.Models.ResponseModels;
using ResultInfo;

namespace DynThings.WebPortal.Controllers.API
{
    public class EndPointsController : BaseAPIController
    {
        #region Props
        long entityID ;

        #endregion

        #region Constructors
        public EndPointsController()
        {
            entityID = unitOfWork_WebAPI.repoAPIEndPoints.EntityID;
        }
        #endregion


        [HttpPost]
        [ResponseType(typeof(APIEndpointResponseModels.GetEndpointsList))]
        public HttpResponseMessage GetEndpointsList(APIEndpointRequestModels.GetEndpointsList model)
        {
            int methodID = 11;
            ApiResponse tokenValidation = unitOfWork_WebAPI.repoAPIUserAppTokens.ValidateTokenEntityPermission(model.Token, entityID, methodID);
            if (tokenValidation.ResultType != ResultType.Ok)
            {
                var msg = new HttpResponseMessage(HttpStatusCode.Unauthorized) { ReasonPhrase = tokenValidation.Message };
                throw new HttpResponseException(new HttpResponseMessage(HttpStatusCode.Forbidden));
            }

            try
            {
                APIEndpointResponseModels.GetEndpointsList result = unitOfWork_WebAPI.repoAPIEndPoints.GetEndPoints(model.SearchFor,model.DeviceID,model.ThingID,model.LocationID,model.ViewID,model.LoadDevice,model.LoadThing,model.PageNumber,model.PageSize);
                return Request.CreateResponse(HttpStatusCode.OK, result);
            }
            catch (Exception ex)
            {
                return RaiseError(ex.Message);
            }

        }

        [HttpPost]
        [ResponseType(typeof(APIEndpointResponseModels.GetEndpointsList))]
        public HttpResponseMessage GetEndpointsWithWarningsList(APIEndpointRequestModels.GetEndpointsList model)
        {
            int methodID = 14;
            ApiResponse tokenValidation = unitOfWork_WebAPI.repoAPIUserAppTokens.ValidateTokenEntityPermission(model.Token, entityID, methodID);
            if (tokenValidation.ResultType != ResultType.Ok)
            {
                var msg = new HttpResponseMessage(HttpStatusCode.Unauthorized) { ReasonPhrase = tokenValidation.Message };
                throw new HttpResponseException(new HttpResponseMessage(HttpStatusCode.Forbidden));
            }

            try
            {
                APIEndpointResponseModels.GetEndpointsList result = unitOfWork_WebAPI.repoAPIEndPoints.GetEndPointsWithWarnings(model.SearchFor, model.DeviceID, model.ThingID, model.LocationID, model.ViewID, model.LoadDevice, model.LoadThing, model.PageNumber, model.PageSize);
                return Request.CreateResponse(HttpStatusCode.OK, result);
            }
            catch (Exception ex)
            {
                return RaiseError(ex.Message);
            }

        }

       


    }
}