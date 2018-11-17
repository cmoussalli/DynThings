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
    public class DeviceCommandsController : BaseAPIController
    {
        #region Props
        long entityID ;

        #endregion

        #region Constructors
        public DeviceCommandsController()
        {
            entityID = unitOfWork_WebAPI.repoAPIDeviceCommands.EntityID;
        }
        #endregion


        [HttpPost]
        [ResponseType(typeof(APIDeviceCommandResponseModels.GetDeviceCommandsList))]
        public HttpResponseMessage GetDeviceCommandsList(APIDeviceCommandRequestModels.GetDeviceCommandsList model)
        {
            int methodID = 12;
            ApiResponse tokenValidation = unitOfWork_WebAPI.repoAPIUserAppTokens.ValidateTokenEntityPermission(model.Token, entityID, methodID);
            if (tokenValidation.ResultType != ResultType.Ok)
            {
                var msg = new HttpResponseMessage(HttpStatusCode.Unauthorized) { ReasonPhrase = tokenValidation.Message };
                throw new HttpResponseException(new HttpResponseMessage(HttpStatusCode.Forbidden));
            }

            try
            {
                APIDeviceCommandResponseModels.GetDeviceCommandsList result = unitOfWork_WebAPI.repoAPIDeviceCommands.GetDeviceCommandsList(model.SearchFor,model.LocationID,model.DeviceID,model.LoadDevice , model.PageNumber, model.PageSize);
                return Request.CreateResponse(HttpStatusCode.OK, result);
            }
            catch (Exception ex)
            {
                return RaiseError(ex.Message);
            }
        }


    }
}