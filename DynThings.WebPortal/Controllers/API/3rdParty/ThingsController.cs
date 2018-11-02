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
    public class ThingsController : BaseAPIController
    {
        #region Props
        long entityID;

        #endregion

        #region Constructors
        public ThingsController()
        {
            entityID = unitOfWork_WebAPI.repoAPIThings.EntityID;
        }
        #endregion


        [HttpPost]
        [ResponseType(typeof(APIThingResponseModels.GetThingsList))]
        public HttpResponseMessage GetThingsList(APIThingRequestModels.GetThingsList model)
        {
            int methodID = 10;
            ApiResponse tokenValidation = unitOfWork_WebAPI.repoAPIUserAppTokens.ValidateTokenEntityPermission(model.Token, entityID, methodID);
            if (tokenValidation.ResultType != ResultType.Ok)
            {
                var msg = new HttpResponseMessage(HttpStatusCode.Unauthorized) { ReasonPhrase = tokenValidation.Message };
                throw new HttpResponseException(new HttpResponseMessage(HttpStatusCode.Forbidden));
            }

            try
            {
                APIThingResponseModels.GetThingsList result = unitOfWork_WebAPI.repoAPIThings.GetThingsList(model.SearchFor,model.LocationID,model.LoadThingEnds,model.LoadEndPoints,model.LoadLocation,model.LoadThingExtensionValues, model.PageNumber, model.PageSize);
                return Request.CreateResponse(HttpStatusCode.OK, result);
            }
            catch (Exception ex)
            {
                return RaiseError(ex.Message);
            }
        }


        [HttpPost]
        [ResponseType(typeof(APIThingResponseModels.GetThingsList))]
        public HttpResponseMessage GetThingsWithWarningsList(APIThingRequestModels.GetThingsList model)
        {
            int methodID = 18;
            ApiResponse tokenValidation = unitOfWork_WebAPI.repoAPIUserAppTokens.ValidateTokenEntityPermission(model.Token, entityID, methodID);
            if (tokenValidation.ResultType != ResultType.Ok)
            {
                var msg = new HttpResponseMessage(HttpStatusCode.Unauthorized) { ReasonPhrase = tokenValidation.Message };
                throw new HttpResponseException(new HttpResponseMessage(HttpStatusCode.Forbidden));
            }

            try
            {
                APIThingResponseModels.GetThingsList result = unitOfWork_WebAPI.repoAPIThings.GetThingsWithWarningsList(model.SearchFor, model.LocationID, model.LoadThingEnds, model.LoadEndPoints, model.LoadLocation, model.LoadThingExtensionValues, model.PageNumber, model.PageSize);
                return Request.CreateResponse(HttpStatusCode.OK, result);
            }
            catch (Exception ex)
            {
                return RaiseError(ex.Message);
            }
        }
       

    }
}