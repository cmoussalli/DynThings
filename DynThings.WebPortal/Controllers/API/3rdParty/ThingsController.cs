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
    public class ThingsController : ApiController
    {
        #region Props
        UnitOfWork_WebAPI uow_APIs = new UnitOfWork_WebAPI();
        long entityID;

        #endregion

        #region Constructors
        public ThingsController()
        {
            entityID = uow_APIs.repoAPIThings.EntityID;
        }
        #endregion

        public List<APIThing> GetThings(Guid token, int pageNumber, int pageSize, bool loadParents = false, bool loadChilds = false, string searchFor="", int locationID=0)
        {
            int methodID = 10;
            ResultInfo.Result tokenValidation = uow_APIs.repoAPIUserAppTokens.ValidateTokenEntityPermission(token, entityID, methodID);
            if (tokenValidation.ResultType != ResultInfo.ResultType.Ok)
            {
                var msg = new HttpResponseMessage(HttpStatusCode.Unauthorized) { ReasonPhrase = tokenValidation.Message };
                throw new HttpResponseException(new HttpResponseMessage(HttpStatusCode.Forbidden));
            }
            return uow_APIs.repoAPIThings.GetThings(pageNumber, pageSize,loadParents,loadChilds,searchFor,locationID);
        }

        public List<APIThing> GetThingsWithWarnings(Guid token, int pageNumber, int pageSize, bool loadParents = false, bool loadChilds = false, int locationID = 0)
        {
            int methodID = 18;
            ResultInfo.Result tokenValidation = uow_APIs.repoAPIUserAppTokens.ValidateTokenEntityPermission(token, entityID, methodID);
            if (tokenValidation.ResultType != ResultInfo.ResultType.Ok)
            {
                var msg = new HttpResponseMessage(HttpStatusCode.Unauthorized) { ReasonPhrase = tokenValidation.Message };
                throw new HttpResponseException(new HttpResponseMessage(HttpStatusCode.Forbidden));
            }
            return uow_APIs.repoAPIThings.GetThingsWithWarnings(pageNumber, pageSize, loadParents, loadChilds,locationID);

        }

    }
}