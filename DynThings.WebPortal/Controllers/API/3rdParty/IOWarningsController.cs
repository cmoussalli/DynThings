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
using ResultInfo;

namespace DynThings.WebPortal.Controllers.API
{
    public class IOWarningsController : BaseAPIController
    {
        #region Props
        long entityID ;

        #endregion

        #region Constructors
        public IOWarningsController()
        {
            entityID = unitOfWork_WebAPI.repoAPIIOWarnings.EntityID;
        }
        #endregion


        public List<APIEndPointIOWarning> GetEndPointIOWarnings(Guid token, int pageNumber, int pageSize, string searchFor="",long locationID = 0 , long viewID=0)
        {
            int methodID = 16;
            ApiResponse tokenValidation = unitOfWork_WebAPI.repoAPIUserAppTokens.ValidateTokenEntityPermission(token, entityID,methodID);
            if (tokenValidation.ResultType != ResultType.Ok)
            {
                var msg = new HttpResponseMessage(HttpStatusCode.Unauthorized) { ReasonPhrase = tokenValidation.Message };
                throw new HttpResponseException(new HttpResponseMessage(HttpStatusCode.Forbidden));
            }
            return unitOfWork_WebAPI.repoAPIIOWarnings.GetEndPointIOWarnings(pageNumber,pageSize,locationID,viewID);

        }

       

    }
}