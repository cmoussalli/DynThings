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
    public class IOWarningsController : ApiController
    {
        #region Props
        UnitOfWork_WebAPI uow_APIs = new UnitOfWork_WebAPI();
        long entityID ;

        #endregion

        #region Constructors
        public IOWarningsController()
        {
            entityID = uow_APIs.repoAPIIOWarnings.EntityID;
        }
        #endregion


        public List<APIEndPointIOWarning> GetEndPointIOWarnings(Guid token, int pageNumber, int pageSize, string searchFor="",long locationID = 0 , long viewID=0)
        {
            int methodID = 16;
            ResultInfo.Result tokenValidation = uow_APIs.repoAPIUserAppTokens.ValidateTokenEntityPermission(token, entityID,methodID);
            if (tokenValidation.ResultType != ResultInfo.ResultType.Ok)
            {
                var msg = new HttpResponseMessage(HttpStatusCode.Unauthorized) { ReasonPhrase = tokenValidation.Message };
                throw new HttpResponseException(new HttpResponseMessage(HttpStatusCode.Forbidden));
            }
            return uow_APIs.repoAPIIOWarnings.GetEndPointIOWarnings(pageNumber,pageSize,locationID,viewID);

        }

       

    }
}