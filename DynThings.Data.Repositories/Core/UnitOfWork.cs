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
        #region Repositories
        public static LocationViewsRepository repoLocationViews = new LocationViewsRepository();
        public static LocationsRepository repoLocations = new LocationsRepository();
        public static EndpointsRepository repoEndpoints = new EndpointsRepository();
        public static EndpointIOsRepository repoEndpointIOs = new EndpointIOsRepository();
        public static EndPointTypesRepository repoEndpointTypes = new EndPointTypesRepository();
        public static DevicesRepositories repoDevices = new DevicesRepositories();

        #endregion



        #region Enums
        public enum RepositoryMethodResultType
        {
            Ok = 1,
            Failed = 2
        }

        #endregion
    }
}
