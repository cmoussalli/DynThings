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
    public static class UnitOfWork
    {
        private static DynThingsEntities dynDB = new DynThingsEntities();

        public static ResultInfo resultInfo = new ResultInfo(dynDB);

        #region Repositories
        public static DynSettingsRepository repoDynSettings = new DynSettingsRepository(dynDB);
        public static LocationViewsRepository repoLocationViews = new LocationViewsRepository(dynDB);
        public static LocationViewTypesRepository repoLocationViewTypes = new LocationViewTypesRepository(dynDB);
        public static LocationsRepository repoLocations = new LocationsRepository(dynDB);
        public static EndpointsRepository repoEndpoints = new EndpointsRepository(dynDB);
        public static EndpointIOsRepository repoEndpointIOs = new EndpointIOsRepository(dynDB);
        public static EndPointTypesRepository repoEndpointTypes = new EndPointTypesRepository(dynDB);
        public static DevicesRepositories repoDevices = new DevicesRepositories(dynDB);
        public static DeviceCommandsRepository repoDeviceCommands = new DeviceCommandsRepository(dynDB);
        public static EndPointCommandsRepository repoEndPointCommands = new EndPointCommandsRepository(dynDB);
        public static DeviceIOsRepository repoDeviceIOs = new DeviceIOsRepository(dynDB);
        public static IOTypesRepository repoIOTypes = new IOTypesRepository(dynDB);


        #endregion




    }
}
