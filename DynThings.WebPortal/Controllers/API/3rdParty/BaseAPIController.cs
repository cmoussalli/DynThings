using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using DynThings.WebAPI.Models.RequestModels;
using DynThings.WebAPI.Models.ResponseModels;
using DynThings.WebAPI.Repositories;

namespace DynThings.WebPortal.Controllers.API
{
    [ApiExplorerSettings(IgnoreApi = true)]
    public class BaseAPIController : ApiController
    {
        public UnitOfWork_WebAPI unitOfWork_WebAPI = new UnitOfWork_WebAPI();

        [ApiExplorerSettings(IgnoreApi = true)]
        [HttpPost]
        [ResponseType(typeof(string))]
        public HttpResponseMessage RaiseError(string errorMessage)
        {
            return Request.CreateResponse(HttpStatusCode.BadRequest, errorMessage);
        }

        [ApiExplorerSettings(IgnoreApi = true)]
        [HttpPost]
        [ResponseType(typeof(string))]
        public HttpResponseMessage SendResult(ResultInfo.Result result)
        {
            HttpResponseMessage httpResponse;

            switch (result.ResultType)
            {
                case ResultInfo.Result.Result_Type.Ok:
                    return Request.CreateResponse(HttpStatusCode.OK, result.Message);
                    break;

                case ResultInfo.Result.Result_Type.NotAuthorized:
                    return Request.CreateResponse(HttpStatusCode.Unauthorized, result.Message);
                    break;

                case ResultInfo.Result.Result_Type.Failed:
                case ResultInfo.Result.Result_Type.Failed_DevelopmentMode:
                case ResultInfo.Result.Result_Type.Failed_ProductionMode:
                    return Request.CreateResponse(HttpStatusCode.BadRequest, result.Message);
                    break;

                case ResultInfo.Result.Result_Type.Info:
                    return Request.CreateResponse(HttpStatusCode.OK, result.Message);
                    break;


                default:
                    return Request.CreateResponse(HttpStatusCode.BadRequest, result.Message);
                    break;
            }

        }



        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {

            }
            base.Dispose(disposing);
        }
    }
}
