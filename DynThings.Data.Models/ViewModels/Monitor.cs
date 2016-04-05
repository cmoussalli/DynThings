using DynThings.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DynThings.Data.Models.ViewModels
{
   
    public partial class Monitor
    {
        private DynThingsEntities db = new DynThingsEntities();

        #region Properties
        public long ID { get; set; }
        public string Title { get; set; }
        public bool IsActive { get; set; }
        public string OwnerID { get; set; }
        public string X { get; set; }
        public string Y { get; set; }
        public string Z { get; set; }

        public LocationViewType locationViewType { get; set; }

        public List<Location> MLocations;

        #endregion

        #region Methods

        public Monitor GetMonitor(LocationView locationView)
        {
            Monitor monit = new Monitor();

            //Fill Monitor values
            monit.ID = locationView.ID;
            monit.Title = locationView.Title;
            monit.IsActive = (bool)locationView.IsActive;
            monit.locationViewType = locationView.LocationViewType;
            monit.OwnerID = locationView.OwnerID;
            monit.X = locationView.X;
            monit.Y = locationView.Y;
            monit.Z = locationView.Z;


            List<LinkLocationsLocationView> linksLocations = db.LinkLocationsLocationViews.Where(l => l.LocationViewID == locationView.ID).ToList();
            List<long> ids = new List<long>();
            foreach (LinkLocationsLocationView lnk in linksLocations)
            {
                ids.Add((long)lnk.LocationID);
            }

            monit.MLocations = db.Locations.Where(l => l.ID > 0 && ids.Contains(l.ID)).ToList();

            return monit;
        }

        public MonitorLocation GetMonitorLocation(Location location)
        {
            MonitorLocation monitLocation = new MonitorLocation();

            //Fill MonitorLocation values
            monitLocation.ID = location.ID;
            monitLocation.GUID = location.GUID;
            monitLocation.Title = location.Title;
            monitLocation.LongitudeY = location.LongitudeY;
            monitLocation.LatitudeX = location.LatitudeX;
            monitLocation.isActive = location.isActive;
            monitLocation.Status = location.Status;
            monitLocation.IconID = location.IconID;


            List<LinkEndpointsLocation> linksEndPoints = db.LinkEndpointsLocations.Where(l => l.LocationID == location.ID).ToList();
            List<long> ids = new List<long>();
            foreach (LinkEndpointsLocation lnk in linksEndPoints)
            {
                ids.Add((long)lnk.EndpointID);
            }

            monitLocation.endPoints = db.Endpoints.Where(e => e.ID > 0 && ids.Contains(e.ID)).ToList();

            return monitLocation;
        }

        public MonitorEndPoint GetMonitorEndPoint(Endpoint endPoint)
        {
            MonitorEndPoint monitEndPoint = new MonitorEndPoint();
            //Fill MonitorEndPoint values
            monitEndPoint.ID = endPoint.ID;
            monitEndPoint.GUID = endPoint.GUID;
            monitEndPoint.Title = endPoint.Title;
            monitEndPoint.KeyPass = endPoint.KeyPass;
            monitEndPoint.PinCode = endPoint.PinCode;
            monitEndPoint.cssColor = endPoint.CssColor;

            monitEndPoint.TypeID = endPoint.TypeID;
            monitEndPoint.TypeTitle = endPoint.EndPointType.Title;
            monitEndPoint.Measurement = endPoint.EndPointType.measurement;

            monitEndPoint.endPointIOs = db.EndPointIOs.Where(e => e.EndPointID == endPoint.ID).OrderByDescending(e => e.TimeStamp).Take(4).ToList();


            monitEndPoint.LastIOValue = monitEndPoint.endPointIOs[0].Valu;
            monitEndPoint.LastIOTimeStamp = monitEndPoint.endPointIOs[0].TimeStamp;


            return monitEndPoint;
        }

        #endregion

    }


}
