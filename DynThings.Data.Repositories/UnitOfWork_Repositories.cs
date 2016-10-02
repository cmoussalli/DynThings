/////////////////////////////////////////////////////////////////
// Created by : Caesar Moussalli                               //
// TimeStamp  : 31-1-2016                                      //
// Content    : Associate Repositories to the Unit of Work     //
// Notes      : Send DB context to repositories to reduce DB   //
//              connectivity sessions count                    //
/////////////////////////////////////////////////////////////////
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DynThings.Data.Models;

namespace DynThings.Data.Repositories
{
    public static class UnitOfWork_Repositories
    {

        private static DynThingsEntities dynDB = new DynThingsEntities();

        //public static ResultInfo resultInfo = new ResultInfo(db);

        #region Repositories
        public static DynSettingsRepository repoDynSettings = new DynSettingsRepository(dynDB);
        public static LocationViewsRepository repoLocationViews = new LocationViewsRepository(dynDB);
        public static LocationViewTypesRepository repoLocationViewTypes = new LocationViewTypesRepository(dynDB);
        public static LocationsRepository repoLocations = new LocationsRepository(dynDB);
        public static EndpointsRepository repoEndpoints = new EndpointsRepository(dynDB);
        public static EndpointIOsRepository repoEndpointIOs = new EndpointIOsRepository(dynDB);
        public static EndPointTypesRepository repoEndpointTypes = new EndPointTypesRepository(dynDB);
        public static DevicesRepository repoDevices = new DevicesRepository(dynDB);
        public static DeviceCommandsRepository repoDeviceCommands = new DeviceCommandsRepository(dynDB);
        public static EndPointCommandsRepository repoEndPointCommands = new EndPointCommandsRepository(dynDB);
        public static DeviceIOsRepository repoDeviceIOs = new DeviceIOsRepository(dynDB);
        public static IOTypesRepository repoIOTypes = new IOTypesRepository(dynDB);
        public static DynUsersRepository repoDynUsers = new DynUsersRepository(dynDB);
        public static RolesRepository repoRoles = new RolesRepository(dynDB);
        public static ThingsRepository repoThings = new ThingsRepository(dynDB);
        public static ThingCategorysRepository repoThingCategorys = new ThingCategorysRepository(dynDB);
        public static MediaFilesRepository repoMediaFiles = new MediaFilesRepository(dynDB);
        public static AlertsRepository repoAlerts = new AlertsRepository(dynDB);
        public static AlertConditionTypesRepository repoAlertConditionTypes = new AlertConditionTypesRepository(dynDB);
        public static UserNotificationsRepository repoUserNotification = new UserNotificationsRepository(dynDB);
        #endregion




    }
}
