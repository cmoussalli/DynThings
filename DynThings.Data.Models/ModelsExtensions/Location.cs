using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DynThings.Data.Models
{
    public partial class Location
    {

        public List<Endpoint> EndPoints
        {
            get
            {
                DynThingsEntities db = new DynThingsEntities();
                List<Endpoint> ends = new List<Endpoint>();
                List<LinkDevicesLocation> lnks = db.LinkDevicesLocations.Where(l => l.LocationID == this.ID && l.EndByUser == null).ToList();
                foreach (LinkDevicesLocation lnk in lnks)
                {
                    Device dev = db.Devices.Find(lnk.DeviceID);
                    List<Endpoint> devEnds = dev.Endpoints.ToList();
                    ends.AddRange(devEnds);
                }
                return ends;
            }
        }

        public List<Device> Devices
        {
            get
            {
                DynThingsEntities db = new DynThingsEntities();
                List<Device> devs = new List<Device>();
                List<LinkDevicesLocation> lnks = db.LinkDevicesLocations.Where(l => l.LocationID == this.ID).ToList();
                foreach (LinkDevicesLocation lnk in lnks)
                {
                    Device dev = db.Devices.Find(lnk.DeviceID);
                    devs.Add(dev);
                }
                return devs;
            }
        }

        public List<LocationView> locationViews
        {
            get
            {
                DynThingsEntities db = new DynThingsEntities();
                List<LocationView> locs = new List<LocationView>();
                List<LinkLocationsLocationView> lnks = db.LinkLocationsLocationViews.Where(l => l.LocationID == this.ID).ToList();
                foreach (LinkLocationsLocationView lnk in lnks)
                {
                    locs.Add(lnk.LocationView);
                }
                return locs;
            }
        }

        public List<Thing> Things
        {
            get
            {
                DynThingsEntities db = new DynThingsEntities();
                List<Thing> things = new List<Thing>();
                List<LinkThingsLocation> lnks = db.LinkThingsLocations.Where(l => l.LocationID == this.ID).ToList();
                foreach (LinkThingsLocation lnk in lnks)
                {
                    Thing thing = db.Things.Find(lnk.ThingID);
                    things.Add(thing);
                }
                return things;
            }
        }



    }
}
