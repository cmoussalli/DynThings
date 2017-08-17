using System;

namespace DynThings.WebAPI.ClientServices
{
    public class UnitOfWork
    {
        #region Constructor
        public UnitOfWork(HostConfig hostConfig)
        {
            host = hostConfig;

            TokenService = new TokenServices(host);
            EndPointsService = new EndPointsServices(host);
            LocationViewsService = new LocationViewsServices(host);
            LocationsService = new LocationsServices(host);
            ThingsService = new ThingsServices(host);
            ThingEndsService = new ThingEndsServices(host);
            AppsService = new AppsServices(host);

        }

        #endregion

        #region Props
        public HostConfig host { get; set; }

        public TokenServices TokenService { get; set; }
        public EndPointsServices EndPointsService { get; set; }
        public LocationViewsServices LocationViewsService { get; set; }
        public LocationsServices LocationsService { get; set; }
        public ThingsServices ThingsService{ get; set; }
        public ThingEndsServices ThingEndsService { get; set; }
        public AppsServices AppsService { get; set; }

        #endregion




    }
}
