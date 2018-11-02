using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DynThings.Core;
using DynThings.Data.Repositories;
using DynThings.WebAPI;
using DynThings.WebAPI.Models;
using DynThings.Data.Models;
using DynThings.WebAPI.TypesMapper;
using Microsoft.AspNet.Identity;
using ResultInfo;

namespace DynThings.WebAPI.Controllers.API
{
    //[Authorize()]
    public class NotificationsController : ApiController
    {
        UnitOfWork_Repositories uof_repos = new UnitOfWork_Repositories();


        [HttpGet]
        public string Get()
        {
            return "Test OK";
        }


        #region GetNotifications
        [HttpGet]
        public ApiResponse GetNotifications(long lastNotificationID)
        {
            ApiResponse oApiResponse = new ApiResponse();
            if (User.Identity.Name == "")
            {
                Result result = Result.GenerateFailedResult();
                oApiResponse = ApiResponseAdapter.fromResult(result);
                return oApiResponse;
            }

            try
            {
                oApiResponse.ResultType = ResultType.Ok;
                int notisCount = uof_repos.repoUserNotification.GetUnseenNotifications( User.Identity.GetUserId(), lastNotificationID).Count;
                oApiResponse.Message = notisCount.ToString();
            }
            catch (Exception ex)
            {
                Result result = Result.GenerateFailedResult();
                oApiResponse = ApiResponseAdapter.fromResult(result);
            }
            return oApiResponse;
        }
        #endregion






    }
}
