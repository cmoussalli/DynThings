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
    public class EndPointsController : ApiController
    {
        #region Props
        UnitOfWork_WebAPI uow_APIs = new UnitOfWork_WebAPI();
        long entityID ;

        #endregion

        #region Constructors
        public EndPointsController()
        {
            entityID = uow_APIs.repoAPIEndPoints.EntityID;
        }
        #endregion

        public List<APIEndPoint> GetEndpoints(Guid token, int pageNumber, int pageSize, bool loadParents = false, bool loadChilds = false, string searchFor = "", long deviceID = 0)
        {
            int methodID = 11;
            ResultInfo.Result tokenValidation = uow_APIs.repoAPIUserAppTokens.ValidateTokenEntityPermission(token, entityID, methodID);
            if (tokenValidation.ResultType != ResultInfo.ResultType.Ok)
            {
                var msg = new HttpResponseMessage(HttpStatusCode.Unauthorized) { ReasonPhrase = tokenValidation.Message };
                throw new HttpResponseException(new HttpResponseMessage(HttpStatusCode.Forbidden));
            }
            return uow_APIs.repoAPIEndPoints.GetEndPoints(pageNumber, pageSize, loadParents, loadChilds, searchFor, deviceID);

        }

        public List<APIEndPoint> GetWarnings(Guid token, int pageNumber, int pageSize, bool loadParents = false, bool loadChilds = false, string searchFor="",long locationID = 0 , long viewID=0)
        {
            int methodID = 14;
            ResultInfo.Result tokenValidation = uow_APIs.repoAPIUserAppTokens.ValidateTokenEntityPermission(token, entityID,methodID);
            if (tokenValidation.ResultType != ResultInfo.ResultType.Ok)
            {
                var msg = new HttpResponseMessage(HttpStatusCode.Unauthorized) { ReasonPhrase = tokenValidation.Message };
                throw new HttpResponseException(new HttpResponseMessage(HttpStatusCode.Forbidden));
            }
            return uow_APIs.repoAPIEndPoints.GetWarnings(pageNumber,pageSize,loadParents,loadChilds,locationID,viewID);

        }

       

    }
}