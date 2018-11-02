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
            LocationViewsService = new LocationViewsServices(host);
            LocationsService = new LocationsServices(host);
            ThingsService = new ThingsServices(host);

            DevicesService = new DevicesServices(host);
            EndPointsService = new EndPointsServices(host);
            ThingEndsService = new ThingEndsServices(host);
            DeviceCommandsService = new DeviceCommandsServices(host);
            EndPointCommandsService = new EndPointCommandsServices(host);

            AppsService = new AppsServices(host);
            IOService = new IOServices(host);
            WarningsService = new WarningsServices(host);
        }

        #endregion

        #region Props
        public HostConfig host { get; set; }
        public TokenServices TokenService { get; set; }

        public LocationViewsServices LocationViewsService { get; set; }
        public LocationsServices LocationsService { get; set; }
        public ThingsServices ThingsService{ get; set; }
        public DevicesServices DevicesService { get; set; }
        public EndPointsServices EndPointsService { get; set; }
        public DeviceCommandsServices DeviceCommandsService { get; set; }
        public EndPointCommandsServices EndPointCommandsService { get; set; }
        public ThingEndsServices ThingEndsService { get; set; }

        public AppsServices AppsService { get; set; }
        public IOServices IOService { get; set; }
        public WarningsServices WarningsService { get; set; }
        #endregion




    }
}
