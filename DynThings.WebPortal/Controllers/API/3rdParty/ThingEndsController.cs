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
using DynThings.Core;
using DynThings.Data.Models;
using DynThings.WebAPI.Models;
using DynThings.WebAPI.Repositories;
using DynThings.WebAPI.Models.ResponseModels;
using DynThings.WebAPI.Models.RequestModels;

namespace DynThings.WebPortal.Controllers.API
{
    [ApiExplorerSettings(IgnoreApi = false)]
    public class ThingEndsController : BaseAPIController
    {

        #region Props
        long entityID ;

        #endregion

        #region Constructors
        public ThingEndsController()
        {
            entityID = unitOfWork_WebAPI.repoAPIThingEnds.EntityID;
        }
        #endregion

        [HttpPost]
        [ResponseType(typeof(APIThingEndResponseModels.GetThingEndsList))]
        public HttpResponseMessage GetThingEndsList(APIThingEndRequestModels.GetThingEndsList model)
        {
            int methodID = 9;
            ApiResponse tokenValidation = unitOfWork_WebAPI.repoAPIUserAppTokens.ValidateTokenEntityPermission(model.Token, entityID, methodID);
            if (tokenValidation.ResultType != ResultType.Ok)
            {
                var msg = new HttpResponseMessage(HttpStatusCode.Unauthorized) { ReasonPhrase = tokenValidation.Message };
                throw new HttpResponseException(new HttpResponseMessage(HttpStatusCode.Forbidden));
            }

            try
            {
                APIThingEndResponseModels.GetThingEndsList result = unitOfWork_WebAPI.repoAPIThingEnds.GetThingEndsList(model.SearchFor,model.LocationID,model.ThingID,model.ThingCategoryID,model.EndpointTypeID,model.LoadThing,model.LoadEndpoint , model.PageNumber, model.PageSize);
                return Request.CreateResponse(HttpStatusCode.OK, result);
            }
            catch (Exception ex)
            {
                return RaiseError(ex.Message);
            }
        }





    }
}