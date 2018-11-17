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
    [ApiExplorerSettings(IgnoreApi = false)]
    public class LocationViewsController : BaseAPIController
    {
        #region Props
        long entityID;

        #endregion

        #region Constructors
        public LocationViewsController()
        {
            entityID = unitOfWork_WebAPI.repoAPILocationViews.EntityID;
        }
        #endregion


        [HttpPost]
        [ResponseType(typeof(APILocationViewResponseModels.GetLocationViewsList))]
        public HttpResponseMessage GetLocationViewsList(APILocationViewRequestModels.GetLocationViewsList model)
        {
            int methodID = 1;
            ApiResponse tokenValidation = unitOfWork_WebAPI.repoAPIUserAppTokens.ValidateTokenEntityPermission(model.Token, entityID, methodID);
            if (tokenValidation.ResultType != ResultType.Ok)
            {
                var msg = new HttpResponseMessage(HttpStatusCode.Unauthorized) { ReasonPhrase = tokenValidation.Message };
                throw new HttpResponseException(new HttpResponseMessage(HttpStatusCode.Forbidden));
            }

            try
            {
                APILocationViewResponseModels.GetLocationViewsList result = unitOfWork_WebAPI.repoAPILocationViews.GetLocationViewsList(model.SearchFor,model.LoadLocations, model.PageNumber, model.PageSize);
                return Request.CreateResponse(HttpStatusCode.OK, result);
            }
            catch (Exception ex)
            {
                return RaiseError(ex.Message);
            }

        }

        [HttpPost]
        [ResponseType(typeof(APILocationViewResponseModels.GetLocationViewsList))]
        public HttpResponseMessage GetLocationViewsWithWarningsList(APILocationViewRequestModels.GetLocationViewsList model)
        {
            int methodID = 17;
            ApiResponse tokenValidation = unitOfWork_WebAPI.repoAPIUserAppTokens.ValidateTokenEntityPermission(model.Token, entityID, methodID);
            if (tokenValidation.ResultType != ResultType.Ok)
            {
                var msg = new HttpResponseMessage(HttpStatusCode.Unauthorized) { ReasonPhrase = tokenValidation.Message };
                throw new HttpResponseException(new HttpResponseMessage(HttpStatusCode.Forbidden));
            }

            try
            {
                APILocationViewResponseModels.GetLocationViewsList result = unitOfWork_WebAPI.repoAPILocationViews.GetLocationViewsWithWarningsList(model.SearchFor, model.LoadLocations, model.PageNumber, model.PageSize);
                return Request.CreateResponse(HttpStatusCode.OK, result);
            }
            catch (Exception ex)
            {
                return RaiseError(ex.Message);
            }

        }



    }
}