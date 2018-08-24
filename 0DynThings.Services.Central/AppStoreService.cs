using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using DynThings.Data.Models;
using DynThings.Data.Repositories;
using DynThingsCentral.Core;
using DynThingsCentral.WebAPI.Models;
using DynThingsCentral.WebAPI.RequestModels;
using DynThingsCentral.WebAPI.ResponseModels;
using DynThingsCentral.WebAPI.Client;



namespace DynThings.Services.Central
{
    public class AppStoreService
    {
        UnitOfWork_Repositories uow_Data = new UnitOfWork_Repositories();
        CentralClient client = new CentralClient();


        #region Constructor
        public AppStoreService(string centralURL)
        {
            client.BaseUrl = centralURL;
        }
        #endregion


        public async Task<List<APIApp>> GetAppsListAsync(string searchFor, int page, int itemsPerPage )
        {
            List<APIApp> apiApps = new List<APIApp>();

            APIAppRequestModels.GetAppsList requestModel = new APIAppRequestModels.GetAppsList();
            requestModel.LoadAllowedActions = true;
            requestModel.LoadAllowedEntities = true;
            requestModel.LoadThingExtensions = true;
            requestModel.LoadThingTypes = true;
            requestModel.SearchFor = searchFor;
            requestModel.PageNumber = page;
            requestModel.RecordsPerPage = itemsPerPage;
            APIAppResponseModels.GetAppsList responseModel = await client.Apps.GetAppListAsync(requestModel);
            apiApps = responseModel.Apps;


            return apiApps;
        }




    }
}
