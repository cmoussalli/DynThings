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
        #region DB Context
        private static DynThingsEntities db = new DynThingsEntities();
        #endregion

        #region Repositories
        public static LocationViewsRepository repoLocationViews = new LocationViewsRepository(db);
        public static LocationsRepository repoLocations = new LocationsRepository(db);
        public static EndpointsRepository repoEndpoints = new EndpointsRepository(db);

        #endregion
    }
}
