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
