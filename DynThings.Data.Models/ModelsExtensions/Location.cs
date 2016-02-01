using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DynThings.Data.Models
{
    public partial class Location
    {
        private DynThingsEntities db = new DynThingsEntities();

        public List<Endpoint> EndPoints
        {
            get
            {
                List<Endpoint> ends = new List<Endpoint>();
                List<LinkEndpointsLocation> lnks = db.LinkEndpointsLocations.Where(l => l.LocationID == this.ID).ToList();
                foreach (LinkEndpointsLocation lnk in lnks)
                {
                    ends.Add(lnk.Endpoint);
                }
                return ends;
            }
        }
    }
}
