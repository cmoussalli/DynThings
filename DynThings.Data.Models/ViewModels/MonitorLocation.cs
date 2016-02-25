using DynThings.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DynThings.Data.Models.ViewModels
{
    public partial class MonitorLocation
    {
        public long ID { get; set; }
        public System.Guid GUID { get; set; }
        public string Title { get; set; }
        public string LongitudeY { get; set; }
        public string LatitudeX { get; set; }
        public bool isActive { get; set; }
        public long Status { get; set; }
        public long IconID { get; set; }

        public List<Endpoint> endPoints { get; set; }
    }
}
