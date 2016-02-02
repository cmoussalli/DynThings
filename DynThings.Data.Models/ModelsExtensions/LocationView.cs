/////////////////////////////////////////////////////////////////
// Created by : Caesar Moussalli                               //
// TimeStamp  : 31-1-2016                                      //
// Content    : Extend the properties of LocationView Model    //
// Notes      : Don't add Behavior in this class               //
/////////////////////////////////////////////////////////////////
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DynThings.Data.Models
{
    public partial class LocationView
    {
        private DynThingsEntities db = new DynThingsEntities();
 
        /// <summary>
        /// Get List of associated Locations
        /// </summary>
        public List<Location> Locations
        {
            get
            {
                List<Location> locs = new List<Location>();
                List<LinkLocationsLocationView> lnks = db.LinkLocationsLocationViews.Where(l => l.LocationView.ID == this.ID).ToList();
                foreach (LinkLocationsLocationView lnk in lnks)
                {
                    locs.Add(lnk.Location);
                }
                return locs;
            }
        }

    }
}
