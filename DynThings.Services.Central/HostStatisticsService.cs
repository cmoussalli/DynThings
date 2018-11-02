using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

using DynThings.Data.Models;
using DynThings.Data.Repositories;
using DynThingsCentral.Core;
using DynThingsCentral.WebAPI.Models;
using DynThingsCentral.WebAPI.RequestModels;
using DynThingsCentral.WebAPI.ResponseModels;
using DynThingsCentral.WebAPI.Client;
using DynThings.Core;
using System.IO;
using System.Net;
using DynThings.Data.Models.ProcedureModels;


namespace DynThings.Services.Central
{
    public class HostStatisticsService
    {
        //UnitOfWork_Repositories uow_Data = new UnitOfWork_Repositories();
        CentralClient client = new CentralClient();
        DynThingsEntities db = new DynThingsEntities();
        UnitOfWork_Repositories uow_Repositories = new UnitOfWork_Repositories();

        #region Constructor
        public HostStatisticsService(string centralURL)
        {
            client.BaseUrl = centralURL;
        }
        #endregion


        public async Task<APIResult> SubmitHostStatistics(string url,string cpuModel,float ram,string moterBoardSN,string serverName)
        {
            APIResult result = new APIResult();
            APIHostStatistics apiHost = new APIHostStatistics();
            apiHost.PlatformIdentifier = Core.Config.PlatformKey;
            apiHost.Title = Core.Config.PlatformTitle;
            apiHost.DeploymentDate = Core.Config.DeploymentTimeStamp;
            apiHost.LastSync = Core.Config.LastCentralSync;
            apiHost.Release = (float)Core.VersionControl.GetVersion();
            apiHost.URL = url;
            apiHost.CPUModel = cpuModel;
            apiHost.RAM = ram;
            apiHost.MotherboardSN = moterBoardSN;
            apiHost.ServerMachineName = serverName;
                

            apiHost.ViewsCount = uow_Repositories.repoLocationViews.GetCount();
            apiHost.LocationsCount = uow_Repositories.repoLocations.GetCount();
            apiHost.ThingsCount = uow_Repositories.repoThings.GetCount();
            apiHost.DevicesCount = uow_Repositories.repoDevices.GetCount();
            apiHost.EndpointsCount = uow_Repositories.repoEndpoints.GetCount();
            apiHost.UsersCount = uow_Repositories.repoDynUsers.GetCount();

            DBServerInfo dBServerInfo = uow_Repositories.repoDBInfo.GetDBServerInfo();
            apiHost.DBMemory = (float)dBServerInfo.Memory;
            apiHost.DBVersion = dBServerInfo.Version;
            apiHost.DBEdition = dBServerInfo.Edition;
            apiHost.DBServerName = dBServerInfo.Name;

            result = await client.Statistics.SubmitHostStatistics(apiHost);
            return result;
        }

     

    }
}
