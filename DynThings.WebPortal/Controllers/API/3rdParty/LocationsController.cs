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
using ResultInfo;
using DynThings.WebAPI.Models;
using DynThings.WebAPI.Models.RequestModels;
using DynThings.WebAPI.Models.ResponseModels;
using DynThings.WebAPI.Repositories;

namespace DynThings.WebPortal.Controllers.API
{
    public class LocationsController : BaseAPIController
    {
        #region Props
        long entityID ;

        #endregion

        #region Constructors
        public LocationsController()
        {
            entityID = unitOfWork_WebAPI.repoAPILocations.EntityID;
        }
        #endregion



        [HttpPost]
        [ResponseType(typeof(APILocationResponseModels.GetLocationsList))]
        public HttpResponseMessage GetLocationsList(APILocationRequestModels.GetLocationsList model)
        {
            int methodID = 2;
            ApiResponse tokenValidation = unitOfWork_WebAPI.repoAPIUserAppTokens.ValidateTokenEntityPermission(model.Token, entityID, methodID);
            if (tokenValidation.ResultType != ResultType.Ok)
            {
                var msg = new HttpResponseMessage(HttpStatusCode.Unauthorized) { ReasonPhrase = tokenValidation.Message };
                throw new HttpResponseException(new HttpResponseMessage(HttpStatusCode.Forbidden));
            }

            try
            {
                APILocationResponseModels.GetLocationsList result = unitOfWork_WebAPI.repoAPILocations.GetLocationsList(model.SearchFor, model.ViewID, model.LoadViews, model.LoadThings, model.PageNumber, model.PageSize);
                return Request.CreateResponse(HttpStatusCode.OK, result);
            }
            catch (Exception ex)
            {
                return RaiseError(ex.Message);
            }

        }

        [HttpPost]
        [ResponseType(typeof(APILocationResponseModels.GetLocationsList))]
        public HttpResponseMessage GetLocationsWithWarningsList(APILocationRequestModels.GetLocationsList model)
        {
            int methodID = 2;
            ApiResponse tokenValidation = unitOfWork_WebAPI.repoAPIUserAppTokens.ValidateTokenEntityPermission(model.Token, entityID, methodID);
            if (tokenValidation.ResultType != ResultType.Ok)
            {
                var msg = new HttpResponseMessage(HttpStatusCode.Unauthorized) { ReasonPhrase = tokenValidation.Message };
                throw new HttpResponseException(new HttpResponseMessage(HttpStatusCode.Forbidden));
            }

            try
            {
                APILocationResponseModels.GetLocationsList result = unitOfWork_WebAPI.repoAPILocations.GetLocationsWithWarningsList(model.SearchFor, model.ViewID, model.LoadViews, model.LoadThings, model.PageNumber, model.PageSize);
                return Request.CreateResponse(HttpStatusCode.OK, result);
            }
            catch (Exception ex)
            {
                return RaiseError(ex.Message);
            }

        }

        

    }
}