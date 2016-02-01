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
        private static DynThingsEntities db = new DynThingsEntities();

        public static LocationViewsRepository repoLocationViews = new LocationViewsRepository(db);
        public static LocationsRepository repoLocations = new LocationsRepository(db);
        public static EndpointsRepository repoEndpoints = new EndpointsRepository(db);

    }
}
