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

namespace DynThings.WebPortal.Controllers.API
{
    public class DeviceCommandsController : ApiController
    {
        #region Props
        UnitOfWork_WebAPI uow_APIs = new UnitOfWork_WebAPI();
        long entityID ;

        #endregion

        #region Constructors
        public DeviceCommandsController()
        {
            entityID = uow_APIs.repoAPIDeviceCommands.EntityID;
        }
        #endregion


        public List<APIDeviceCommand> GetDeviceCommands(Guid token, int pageNumber, int pageSize, bool loadParents = false, bool loadChilds = false, string searchFor = "",long locationID =0,long thingID =0,long deviceID =0)
        {
            int methodID = 12;
            ResultInfo.Result tokenValidation = uow_APIs.repoAPIUserAppTokens.ValidateTokenEntityPermission(token, entityID,methodID);
            if (tokenValidation.ResultType != ResultInfo.ResultType.Ok)
            {
                var msg = new HttpResponseMessage(HttpStatusCode.Unauthorized) { ReasonPhrase = tokenValidation.Message };
                throw new HttpResponseException(new HttpResponseMessage(HttpStatusCode.Forbidden));
            }
            return uow_APIs.repoAPIDeviceCommands.GetDeviceCommands(pageNumber,pageSize,loadParents,loadChilds,searchFor,locationID,deviceID);
        }


    }
}