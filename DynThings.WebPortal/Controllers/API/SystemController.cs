using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

using DynThings.Core;
using DynThings.Data.Models;
using DynThings.Data.Repositories;
using DynThings.WebAPI.Models;
using DynThings.Core.Languages;
using System.IO;
using System.Web;
using DynThings.Services.Central;
using System.Threading.Tasks;
using ResultInfo;

namespace DynThings.WebPortal.Controllers.API
{
    public class SystemController : ApiController
    {
        UnitOfWork_Repositories uow_data = new UnitOfWork_Repositories();
        UnitOfWork_CentralServices uow_CentralService = new UnitOfWork_CentralServices();


        [HttpGet]
        public APISystemInfo Info()
        {
            APISystemInfo sys = new APISystemInfo();
            DynSetting dynSetting = uow_data.repoDynSettings.GetConfig();

            ComponentInfo c1 = new ComponentInfo();
            c1.Component = "Database";
            c1.Version = dynSetting.DBVersion;
            sys.Components.Add(c1);


            //sys.DBVersion = dynSetting.DBVersion;
            //sys.CoreVersion = Core.VersionControl.GetVersion();
            //sys.DataModelsVersion = DynThings.Data.Models.VersionControl.GetVersion();
            //sys.DataRepositoriesVersion = DynThings.Data.Repositories.VersionControl.GetVersion();
            //sys.DataReportsVersion = DynThings.Data.Reports.VersionControl.GetVersion();
            //sys.APIModelsVersion = DynThings.WebAPI.Models.VersionControl.GetVersion();
            //sys.APIRepositoriesVersion = DynThings.WebAPI.Repositories.VersionControl.GetVersion();
            //sys.LanguagesVersion = DynThings.Core.Languages.VersionControl.GetVersion();
            //sys.WidgetVersion = DynThings.Data.WidgetModels.VersionControl.GetVersion();
            //sys.CentralServicesVersion = DynThings.Services.Central.VersionControl.GetVersion();
            //sys.PortalVersion = WebPortal.VersionControl.GetVersion();

            sys.DeploymentDate = dynSetting.DeploymentTimeStamp;
            sys.PortalTimeZone = dynSetting.App_TimeZone;
            return sys;
        }

        [HttpGet]
        public Result GetUpdate()
        {
            Result result = Result.GenerateFailedResult();
            string localFile = Path.Combine(HttpContext.Current.Server.MapPath("~/imgs"), "100.png");
            WebClient client = new WebClient();

            client.DownloadFile("http://dynthings.com/mediafiles/7.png", localFile);
            
            result = Result.GenerateOKResult();
            return result;
        }

        [HttpGet]
        public async Task<Result> InstallDBChangesUpdates()
        {
            Result result = Result.GenerateFailedResult();
            try
            {
               result =  await uow_CentralService.dbChangesService.InstallDBChanges();
            }
            catch (Exception ex)
            {
                result.Message = ex.Message;
            }
            return result;
        }



    }
}
