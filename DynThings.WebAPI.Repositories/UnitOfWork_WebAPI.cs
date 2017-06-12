using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
using System.Web;
using System.Web.ModelBinding;
using System.Net.Http;
using System.Security.Cryptography;
using DynThings.Core;
using DynThings.WebAPI.Models;
using DynThings.Data.Models;

namespace DynThings.WebAPI.Repositories
{
    public class UnitOfWork_WebAPI
    {
        #region Props
        public DynThingsEntities dynDB = new DynThingsEntities();

        #endregion



        #region Repositories
        public APIAppRepository repoAPIApp
        { get { return new APIAppRepository(dynDB); } }

        public APIUserAppTokensRepository repoAPIUserAppTokens
        { get { return new APIUserAppTokensRepository(dynDB); } }

        public APILocationViewsRepository repoAPILocationViews
        { get { return new APILocationViewsRepository(dynDB); } }

        public APILocationsRepository repoAPILocations
        { get { return new APILocationsRepository(dynDB); } }

        public APIUtilizationsRepository repoAPIUtilizations
        { get { return new APIUtilizationsRepository(dynDB); } }

        public APIDevicesRepository repoAPIDevices
        { get { return new APIDevicesRepository(dynDB); } }

        public APIDeviceCommandsRepository repoAPIDeviceCommands
        { get { return new APIDeviceCommandsRepository(dynDB); } }

        public APIThingEndsRepository repoAPIThingEnds
        { get { return new APIThingEndsRepository(dynDB); } }

        public APIEndPointsRepository repoAPIEndPoints
        { get { return new APIEndPointsRepository(dynDB); } }

        public APIEndPointCommandsRepository repoAPIEndPointCommands
        { get { return new APIEndPointCommandsRepository(dynDB); } }

        public APIThingsRepository repoAPIThings
        { get { return new APIThingsRepository(dynDB); } }


        #endregion



    }
}
