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

namespace DynThings.Services.Central
{
    public class AppStoreService
    {
        //UnitOfWork_Repositories uow_Data = new UnitOfWork_Repositories();
        CentralClient client = new CentralClient();
        DynThingsEntities db = new DynThingsEntities();
        UnitOfWork_Repositories uow_Repositories = new UnitOfWork_Repositories();

        #region Constructor
        public AppStoreService(string centralURL)
        {
            client.BaseUrl = centralURL;
        }
        #endregion


        public async Task<APIAppResponseModels.GetAppsList> GetAppsListAsync(string searchFor, int page, int itemsPerPage)
        {
            List<APIApp> apiApps = new List<APIApp>();

            APIAppRequestModels.GetAppsList requestModel = new APIAppRequestModels.GetAppsList();
            requestModel.LoadAllowedActions = true;
            requestModel.LoadAllowedEntities = true;
            requestModel.LoadThingExtensions = true;
            requestModel.LoadThingTypes = true;
            requestModel.loadAppEndpointTypes = true;
            requestModel.loadAppMediaFiles = true;
            requestModel.SearchFor = searchFor;
            requestModel.PageNumber = page;
            requestModel.RecordsPerPage = itemsPerPage;
            APIAppResponseModels.GetAppsList responseModel = await client.Apps.GetAppListAsync(requestModel);


            return responseModel;
        }

        public async Task<APIAppResponseModels.GetAppByID> GetAppByIDAsync(long id)
        {
            APIApp apiApp = new APIApp();

            APIAppRequestModels.GetAppByID requestModel = new APIAppRequestModels.GetAppByID();
            requestModel.Id = id;
            requestModel.LoadAllowedActions = true;
            requestModel.LoadAllowedEntities = true;
            requestModel.LoadThingExtensions = true;
            requestModel.loadAppEndpointTypes = true;
            requestModel.LoadThingTypes = true;
            requestModel.loadAppMediaFiles = true;
            APIAppResponseModels.GetAppByID responseModel = await client.Apps.GetAppByIDAsync(requestModel);

            return responseModel;
        }

        public async Task<APIAppResponseModels.GetAppByGUID> GetAppByGUIDAsync(Guid guid)
        {
            APIApp apiApp = new APIApp();

            APIAppRequestModels.GetAppByGUID requestModel = new APIAppRequestModels.GetAppByGUID();
            requestModel.GUID = guid;
            requestModel.LoadAllowedActions = true;
            requestModel.LoadAllowedEntities = true;
            requestModel.LoadThingExtensions = true;
            requestModel.loadAppEndpointTypes = true;
            requestModel.LoadThingTypes = true;
            requestModel.loadAppMediaFiles = true;
            APIAppResponseModels.GetAppByGUID responseModel = await client.Apps.GetAppByGuidAsync(requestModel);

            return responseModel;
        }


        #region InstallStoreApp
        public async Task<App> InstallOrUpdateStoreApp(Guid guid)
        {
            APIAppResponseModels.GetAppByGUID model = await GetAppByGUIDAsync(guid);

            //Verify Install or Update
            List<App> appsList = db.Apps.Where(a => a.GUID == guid).ToList();

            if (appsList.Count == 0)
            {//New App

                #region Install New App from Store

                #region Add App
                ////App
                App app = new App();
                app.GUID = model.App.GUID;
                app.Key = Guid.NewGuid();
                app.Title = model.App.Title;
                app.Description = model.App.Description;
                app.CreatedByID = model.App.DevelopedBy.Id;
                app.CreateDate = model.App.CreateDate;
                app.StatusID = model.App.Status.Id;
                app.IsStoreApp = true;
                app.DevelopedById = model.App.DevelopedBy.Id;
                app.DevelopedByName = model.App.DevelopedBy.FullName;
                app.DevelopedByCompany = model.App.DevelopedBy.Company;
                app.StoreAppLastUpdate = DateTime.Now;
                app.Version = model.App.LatestVersion;
                db.Apps.Add(app);
                db.SaveChanges();
                #endregion


                #region Add APIEntities
                foreach (APISystemEntity api in model.App.AllowedEntities)
                {
                    AppAPIEntity appAPI = new AppAPIEntity();
                    appAPI.AppID = app.ID;
                    appAPI.SystemEntityID = api.ID;
                    db.AppAPIEntitys.Add(appAPI);
                    db.SaveChanges();
                }
                #endregion

                #region Add MediaFiles
                foreach (APIAppMediaFile apiAppMediaFile in model.App.AppMediaFiles)
                {
                    AppMediaFile appMediaFile = new AppMediaFile();
                    appMediaFile.GUID = apiAppMediaFile.GUID;
                    appMediaFile.Title = apiAppMediaFile.Title;
                    appMediaFile.AppID = app.ID;
                    db.AppMediaFiles.Add(appMediaFile);
                    db.SaveChanges();
                }

                #endregion

                #region Add EndpointTypes
                ////App EndpointTypes
                foreach (APIAppEndpointType apiAppEndType in model.App.AppEndpointTypes)
                {
                    AppEndpointType appEndpointType = new AppEndpointType();
                    appEndpointType.Code = apiAppEndType.Code;
                    appEndpointType.GUID = apiAppEndType.GUID;
                    appEndpointType.AppID = app.ID;
                    appEndpointType.Title = apiAppEndType.Title;
                    appEndpointType.Measurement = apiAppEndType.Measurement;
                    appEndpointType.TypeCategoryID = apiAppEndType.TypeCategoryID;
                    appEndpointType.IconGUID = apiAppEndType.IconGuid;
                    db.AppEndpointTypes.Add(appEndpointType);
                    db.SaveChanges();
                }
                #endregion

                #region Add ThingTypes
                ////App ThingTypes
                foreach (APIAppThingType apiAppThingType in model.App.AppThingTypes)
                {
                    AppThingCategory appThingType = new AppThingCategory();
                    appThingType.Code = apiAppThingType.Code;
                    appThingType.GUID = apiAppThingType.GUID;
                    appThingType.AppID = app.ID;
                    appThingType.Title = apiAppThingType.Title;
                    appThingType.IconGUID = apiAppThingType.IconGuid;

                    db.AppThingCategorys.Add(appThingType);
                    db.SaveChanges();
                }
                #endregion

                #region Add ThingTypeExtension
                ////App ThingTypes
                foreach (APIAppThingExtension apiAppThingExtension in model.App.AppThingExtensions)
                {
                    AppThingExtension appThingExtension = new AppThingExtension();
                    appThingExtension.Code = apiAppThingExtension.Code;
                    appThingExtension.GUID = apiAppThingExtension.GUID;
                    appThingExtension.AppID = app.ID;
                    appThingExtension.Title = apiAppThingExtension.Title;
                    appThingExtension.AppThingCategoryCode = apiAppThingExtension.ThingTypeCode;
                    appThingExtension.DataTypeID = (int)apiAppThingExtension.DataType.ID;
                    appThingExtension.IsList = apiAppThingExtension.IsList;

                    db.AppThingExtensions.Add(appThingExtension);
                    db.SaveChanges();
                }
                #endregion

                #endregion

            }

            else
            {// Update App
                #region Update Existing App from Store

                #region Update App
                App app = appsList[0];
                app.GUID = model.App.GUID;
                app.Key = Guid.NewGuid();
                app.Title = model.App.Title;
                app.Description = model.App.Description;
                app.CreatedByID = model.App.DevelopedBy.Id;
                app.CreateDate = model.App.CreateDate;
                app.StatusID = model.App.Status.Id;
                app.IsStoreApp = true;
                app.DevelopedById = model.App.DevelopedBy.Id;
                app.DevelopedByName = model.App.DevelopedBy.FullName;
                app.DevelopedByCompany = model.App.DevelopedBy.Company;
                app.StoreAppLastUpdate = DateTime.Now;
                app.Version = model.App.LatestVersion;
                db.SaveChanges();
                #endregion


                #region Add Missing APIEntities
                //Filter Only the missing App API Entities
                var toBeAddedAppAPIEntities_Query =
                    from storeAppEntities in model.App.AllowedEntities
                    where !(from localAppEntities in app.AppAPIEntitys
                           select localAppEntities.SystemEntityID)
                           .Contains(storeAppEntities.ID)
                    select storeAppEntities;
                //Add the Filtered AppAPIEntities to Local App         
                foreach (APISystemEntity api in toBeAddedAppAPIEntities_Query)
                {
                    AppAPIEntity appAPI = new AppAPIEntity();
                    appAPI.AppID = app.ID;
                    appAPI.SystemEntityID = api.ID;
                    db.AppAPIEntitys.Add(appAPI);
                    db.SaveChanges();
                }
                #endregion
                #region Delete Extra APIEntities
                //Filter Only the Extra App API Entities
                var toBeDeletedAppAPIEntities_Query =
                    from localAppEntities in app.AppAPIEntitys
                    where !(from storeAppEntities in model.App.AllowedEntities
                            select storeAppEntities.ID)
                           .Contains(localAppEntities.SystemEntityID)
                    select localAppEntities;
                //Add the Filtered AppAPIEntities to Local App         
                foreach (AppAPIEntity api in toBeDeletedAppAPIEntities_Query)
                {
                    db.AppAPIEntitys.Remove(api);
                    //db.AppAPIEntitys.Where(a => a.AppID == api.AppID && a.SystemEntityID == api.SystemEntityID).ToList()[0];
                    db.SaveChanges();
                }
                #endregion

                #region Add Missing & Update MediaFiles
                List<AppMediaFile> localAppMediaFiles = db.AppMediaFiles.Where(et => et.App.GUID == app.GUID).ToList();
                foreach (APIAppMediaFile apiAppMediaFile in model.App.AppMediaFiles)
                {

                    if (localAppMediaFiles.Any(l => l.GUID == apiAppMediaFile.GUID))
                    {//Exist
                        AppMediaFile toBeUpdatedAppMediaFile = localAppMediaFiles.First(l => l.GUID == apiAppMediaFile.GUID);
                        toBeUpdatedAppMediaFile.Title = apiAppMediaFile.Title;
                        db.SaveChanges();
                    }
                    else
                    {//Not Exist 
                        AppMediaFile toBeAddedAppMediaFile = new AppMediaFile();
                        toBeAddedAppMediaFile.GUID = apiAppMediaFile.GUID;
                        toBeAddedAppMediaFile.AppID = app.ID;
                        toBeAddedAppMediaFile.Title = apiAppMediaFile.Title;
                        db.AppMediaFiles.Add(toBeAddedAppMediaFile);
                        db.SaveChanges();
                    }
                }

                #endregion

                #region Add Missing & Update EndpointTypes
                List<AppEndpointType> localAppEndpointTypes = db.AppEndpointTypes.Where(et => et.App.GUID == app.GUID).ToList();
                foreach(APIAppEndpointType apiAppEndpointType in model.App.AppEndpointTypes)
                {
                    
                    if (localAppEndpointTypes.Any(l => l.GUID == apiAppEndpointType.GUID) )
                    {//Exist
                        AppEndpointType toBeUpdatedAppEndpointType = localAppEndpointTypes.First(l => l.GUID == apiAppEndpointType.GUID);
                        toBeUpdatedAppEndpointType.Title = apiAppEndpointType.Title;
                        toBeUpdatedAppEndpointType.Measurement = apiAppEndpointType.Measurement;
                        toBeUpdatedAppEndpointType.TypeCategoryID = apiAppEndpointType.TypeCategoryID;
                        toBeUpdatedAppEndpointType.Code = apiAppEndpointType.Code;
                        toBeUpdatedAppEndpointType.IconGUID = apiAppEndpointType.IconGuid;
                        db.SaveChanges();
                    }
                    else
                    {//Not Exist 
                        AppEndpointType toBeAddedAppEndpointType = new AppEndpointType();
                        toBeAddedAppEndpointType.GUID = apiAppEndpointType.GUID;
                        toBeAddedAppEndpointType.AppID = app.ID;
                        toBeAddedAppEndpointType.Title = apiAppEndpointType.Title;
                        toBeAddedAppEndpointType.Measurement = apiAppEndpointType.Measurement;
                        toBeAddedAppEndpointType.TypeCategoryID = apiAppEndpointType.TypeCategoryID;
                        toBeAddedAppEndpointType.Code = apiAppEndpointType.Code;
                        toBeAddedAppEndpointType.IconGUID = apiAppEndpointType.IconGuid;
                        db.AppEndpointTypes.Add(toBeAddedAppEndpointType);
                        db.SaveChanges();
                    }
                }

                #endregion

                #region Add Missing & Update ThingTypes
                List<AppThingCategory> localAppThingTypes = db.AppThingCategorys.Where(et => et.App.GUID == app.GUID).ToList();
                foreach (APIAppThingType apiAppThingType in model.App.AppThingTypes)
                {

                    if (localAppThingTypes.Any(l => l.GUID == apiAppThingType.GUID))
                    {//Exist
                        AppThingCategory toBeUpdatedAppThingType = localAppThingTypes.First(l => l.GUID == apiAppThingType.GUID);
                        toBeUpdatedAppThingType.Title = apiAppThingType.Title;
                        toBeUpdatedAppThingType.Code = apiAppThingType.Code;
                        toBeUpdatedAppThingType.IconGUID = apiAppThingType.IconGuid;
                        db.SaveChanges();
                    }
                    else
                    {//Not Exist 
                        AppThingCategory toBeAddedAppThingType = new AppThingCategory();
                        toBeAddedAppThingType.GUID = apiAppThingType.GUID;
                        toBeAddedAppThingType.AppID = app.ID;
                        toBeAddedAppThingType.Title = apiAppThingType.Title;
                        toBeAddedAppThingType.Code = apiAppThingType.Code;
                        toBeAddedAppThingType.IconGUID = apiAppThingType.IconGuid;
                        db.AppThingCategorys.Add(toBeAddedAppThingType);
                        db.SaveChanges();
                    }
                }

                #endregion

                #region Add Missing & Update ThingExtensions
                List<AppThingExtension> localAppThingExtensions = db.AppThingExtensions.Where(et => et.App.GUID == app.GUID).ToList();
                foreach (APIAppThingExtension apiAppThingExtension in model.App.AppThingExtensions)
                {

                    if (localAppThingExtensions.Any(l => l.GUID == apiAppThingExtension.GUID))
                    {//Exist
                        AppThingExtension toBeUpdatedAppThingExtension = localAppThingExtensions.First(l => l.GUID == apiAppThingExtension.GUID);
                        toBeUpdatedAppThingExtension.Title = apiAppThingExtension.Title;
                        toBeUpdatedAppThingExtension.Code = apiAppThingExtension.Code;
                        toBeUpdatedAppThingExtension.AppThingCategoryCode = apiAppThingExtension.ThingTypeCode;
                        toBeUpdatedAppThingExtension.DataTypeID = (int)apiAppThingExtension.DataType.ID;
                        toBeUpdatedAppThingExtension.IsList = apiAppThingExtension.IsList;
                        db.SaveChanges();
                    }
                    else
                    {//Not Exist 
                        AppThingExtension toBeAddedAppThingExtension = new AppThingExtension();
                        toBeAddedAppThingExtension.GUID = apiAppThingExtension.GUID;
                        toBeAddedAppThingExtension.AppID = app.ID;
                        toBeAddedAppThingExtension.Title = apiAppThingExtension.Title;
                        toBeAddedAppThingExtension.Code = apiAppThingExtension.Code;
                        toBeAddedAppThingExtension.AppThingCategoryCode = apiAppThingExtension.ThingTypeCode;
                        toBeAddedAppThingExtension.DataTypeID = (int)apiAppThingExtension.DataType.ID;
                        toBeAddedAppThingExtension.IsList = apiAppThingExtension.IsList;
                        db.AppThingExtensions.Add(toBeAddedAppThingExtension);
                        db.SaveChanges();
                    }
                }

                #endregion


                #endregion
            }

            return db.Apps.Where(a => a.GUID == model.App.GUID).ToList()[0];
        }



        //public ResultInfo.Result GetMediaFile(string guid, string fileName)
        //{
        //    ResultInfo.Result result = Result.GenerateFailedResult();
        //    string localFile = Path.Combine(System.Web.HttpContext.Current.Server.MapPath("~/imgs"), guid + ".png");
        //    WebClient client = new WebClient();

        //    client.DownloadFile("http://dynthings.com/mediafiles/" + guid + ".png", localFile);

        //    result = Result.GenerateOKResult();
        //    return result;
        //}

        #endregion

    }
}
