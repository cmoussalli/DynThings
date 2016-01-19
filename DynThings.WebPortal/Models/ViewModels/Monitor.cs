using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DynThings.WebPortal.Models.ViewModels
{
   

    public class Monitor

    {
        public long ID { get; set; }
        public string Title { get; set; }
        public bool IsActive { get; set; }
        public string OwnerID { get; set; }
        public string X { get; set; }
        public string Y { get; set; }
        public string Z { get; set; }

        public LocationViewType locationViewType { get; set; }

        public List<Location> MLocations;


    }


}
