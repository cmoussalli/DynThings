/////////////////////////////////////////////////////////////////
// Created by : Caesar Moussalli                               //
// TimeStamp  : 14-11-2016                                     //
// Content    : IO submition APIs                              //
// Notes      : Use HTTPGet to send data in URL                //
//              Or, use HTTPPost to send data in body          //
//                                                             //
/////////////////////////////////////////////////////////////////

using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DynThings.WebAPI.Models;
using DynThings.Data.Repositories;

namespace DynThings.WebPortal.Controllers.API
{
    public class AppAccountController : ApiController
    {
        UnitOfWork_Repositories uof_repos = new UnitOfWork_Repositories();

        /// <summary>
        /// Validate the AppKey registration.
        /// </summary>
        /// <param name="appKey">The AppKey to be validated.</param>
        /// <returns>APIRespone includes the result.</returns>
        [HttpPost]
        public ApiResponse Validate(Guid appKey)
        {
            ApiResponse response = new ApiResponse();
            response.Message = "Valide";
            return response;
        }

        public ApiResponse AppInfo(Guid appKey)
        {
            ApiResponse response = new ApiResponse();

            return response;
        }
    }
}
