/////////////////////////////////////////////////////////////////
// Created by : Caesar Moussalli                               //
// TimeStamp  : 31-1-2016                                      //
// Content    : Extend the properties of Location Model        //
// Notes      : Don't add Behavior in this class               //
/////////////////////////////////////////////////////////////////
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DynThings.Data.Models
{
    public partial class Location
    {


        /// <summary>
        /// Get List of associated Endpoints
        /// </summary>
        public List<Endpoint> EndPoints
        {
            get
            {
                DynThingsEntities db = new DynThingsEntities();
                List<Endpoint> ends = new List<Endpoint>();
                List<LinkEndpointsLocation> lnks = db.LinkEndpointsLocations.Where(l => l.LocationID == this.ID).ToList();
                foreach (LinkEndpointsLocation lnk in lnks)
                {
                    ends.Add(lnk.Endpoint);
                }
                return ends;
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

    }
}
