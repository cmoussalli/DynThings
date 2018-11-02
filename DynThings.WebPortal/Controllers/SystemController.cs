using DynThings.Services.Central;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Threading.Tasks;
using DynThingsCentral.WebAPI.Models;

namespace DynThings.WebPortal.Controllers
{
    public class SystemController : BaseController
    {

        UnitOfWork_CentralServices uow_CentralService = new UnitOfWork_CentralServices();


        // GET: System
        public ActionResult Index()
        {
            return View();
        }


        #region Submit HostStatistics
        [HttpGet]
        public async Task<string> SubmitHostStatistics()
        {
            APIResult result = await uow_CentralService.hostStatisticsService.SubmitHostStatistics(FullyQualifiedApplicationPath(),"",0,"","");
            
            return result.Message;
        }
        #endregion





        public string FullyQualifiedApplicationPath()
        {
            //Return variable declaration
            var appPath = string.Empty;

            //Getting the current context of HTTP request
            var context = HttpContext;

            //Checking the current context content
            if (context != null)
            {
                //Formatting the fully qualified website url/name
                appPath = string.Format("{0}://{1}{2}{3}",
                                        context.Request.Url.Scheme,
                                        context.Request.Url.Host,
                                        context.Request.Url.Port == 80
                                            ? string.Empty
                                            : ":" + context.Request.Url.Port,
                                        context.Request.ApplicationPath);
            }

            if (!appPath.EndsWith("/"))
                appPath += "/";

            return appPath;

        }

    }
}