using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DynThings.Core;
using DynThings.WebAPI.Models;
using DynThings.WebAPI.Repositories;
using DynThings.Data.Models;

namespace DynThings.WebPortal.Controllers.API
{
    public class AppsController : ApiController
    {

        #region Props
        UnitOfWork_WebAPI uow_APIs = new UnitOfWork_WebAPI();

        #endregion

        [HttpGet]
        public APIApp GetInfo(Guid guid)
        {
            return uow_APIs.repoAPIApp.GetAppInfo(guid);
        }

       
    }
}
