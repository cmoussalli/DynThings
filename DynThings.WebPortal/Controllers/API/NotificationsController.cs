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
using DynThings.WebAPI.Models.TypesMapper;
using Microsoft.AspNet.Identity;

namespace DynThings.WebAPI.Controllers.API
{
    //[Authorize()]
    public class NotificationsController : ApiController
    {

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
                ResultInfo.Result result = ResultInfo.GetResultByID(1);
                oApiResponse = ApiResponseAdapter.fromResult(result);
                return oApiResponse;
            }

            try
            {
                oApiResponse.Status = "Ok";
                int notisCount = UnitOfWork_Repositories.repoUserNotification.GetUnseenNotifications( User.Identity.GetUserId(), lastNotificationID).Count;
                oApiResponse.Message = notisCount.ToString();
            }
            catch (Exception ex)
            {
                ResultInfo.Result result = ResultInfo.GetResultByID(1);
                oApiResponse = ApiResponseAdapter.fromResult(result);
            }
            return oApiResponse;
        }
        #endregion






    }
}
