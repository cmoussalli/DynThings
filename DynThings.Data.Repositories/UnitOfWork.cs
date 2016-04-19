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
        public static ResultInfo resultInfo = new ResultInfo();

        #region Repositories
        public static DynSettingsRepository repoDynSettings = new DynSettingsRepository();
        public static LocationViewsRepository repoLocationViews = new LocationViewsRepository();
        public static LocationViewTypesRepository repoLocationViewTypes = new LocationViewTypesRepository();
        public static LocationsRepository repoLocations = new LocationsRepository();
        public static EndpointsRepository repoEndpoints = new EndpointsRepository();
        public static EndpointIOsRepository repoEndpointIOs = new EndpointIOsRepository();
        public static EndPointTypesRepository repoEndpointTypes = new EndPointTypesRepository();
        public static DevicesRepositories repoDevices = new DevicesRepositories();
        public static DeviceCommandsRepository repoDeviceCommands = new DeviceCommandsRepository();
        public static EndPointCommandsRepository repoEndPointCommands = new EndPointCommandsRepository();
        public static DeviceIOsRepository repoDeviceIOs = new DeviceIOsRepository();
        public static IOTypesRepository repoIOTypes = new IOTypesRepository();


        #endregion




    }
}
