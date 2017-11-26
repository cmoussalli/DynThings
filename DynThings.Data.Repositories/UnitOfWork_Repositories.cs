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
    public  class UnitOfWork_Repositories
    {

        public DynThingsEntities dynDB = new DynThingsEntities();


        #region Repositories
        public AlertsRepository repoAlerts
        { get { return new AlertsRepository(dynDB); } }

        public AlertConditionTypesRepository repoAlertConditionTypes
        { get { return new AlertConditionTypesRepository(dynDB); } }

        public DynSettingsRepository repoDynSettings
        { get { return new DynSettingsRepository(dynDB); } }

        public LocationViewsRepository repoLocationViews
        { get { return new LocationViewsRepository(dynDB); } }

        public LocationViewTypesRepository repoLocationViewTypes
        { get { return new LocationViewTypesRepository(dynDB); } }

        public LocationsRepository repoLocations
        { get { return new LocationsRepository(dynDB); } }

        public EndpointsRepository repoEndpoints
        { get { return new EndpointsRepository(dynDB); } }

        public EndpointIOsRepository repoEndpointIOs
        { get { return new EndpointIOsRepository(dynDB); } }

        public EndPointTypesRepository repoEndpointTypes
        { get { return new EndPointTypesRepository(dynDB); } }

        public EndPointTypeCategorysRepository repoEndpointTypeCategorys
        { get { return new EndPointTypeCategorysRepository(dynDB); } }

        public DevicesRepository repoDevices
        { get { return new DevicesRepository(dynDB); } }

        public DeviceCommandsRepository repoDeviceCommands
        { get { return new DeviceCommandsRepository(dynDB); } }

        public EndPointCommandsRepository repoEndPointCommands
        { get { return new EndPointCommandsRepository(dynDB); } }

        public DeviceIOsRepository repoDeviceIOs
        { get { return new DeviceIOsRepository(dynDB); } }

        public IOTypesRepository repoIOTypes
        { get { return new IOTypesRepository(dynDB); } }

        public DynUsersRepository repoDynUsers
        { get { return new DynUsersRepository(dynDB); } }

        public RolesRepository repoRoles
        { get { return new RolesRepository(dynDB); } }

        public ThingsRepository repoThings
        { get { return new ThingsRepository(dynDB); } }

        public ThingExtensionsRepository repoThingExtensions
        { get { return new ThingExtensionsRepository(dynDB); } }

        public ThingExtensionValuesRepository repoThingExtensionValues
        { get { return new ThingExtensionValuesRepository(dynDB); } }

        public ThingEndsRepository repoThingEnds
        { get { return new ThingEndsRepository(dynDB); } }

        public ThingCategorysRepository repoThingCategorys
        { get { return new ThingCategorysRepository(dynDB); } }

        public MediaFilesRepository repoMediaFiles
        { get { return new MediaFilesRepository(dynDB); } }

        public UserNotificationsRepository repoUserNotification
        { get { return new UserNotificationsRepository(dynDB); } }

        public SystemEntitysRepository repoEntitys
        { get { return new SystemEntitysRepository(dynDB); } }

        public DynThingsAppsRepository repoApps
        { get { return new DynThingsAppsRepository(dynDB); } }

        public AppThingCategorysRepository repoAppThingCategorys
        { get { return new AppThingCategorysRepository(dynDB); } }


        #endregion




    }
}
