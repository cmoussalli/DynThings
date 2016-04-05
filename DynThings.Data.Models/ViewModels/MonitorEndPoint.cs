using DynThings.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DynThings.Data.Models.ViewModels
{
   public partial class MonitorEndPoint
    {
        public long ID { get; set; }
        public System.Guid GUID { get; set; }
        public System.Guid KeyPass { get; set; }
        public string PinCode { get; set; }
        public string Title { get; set; }
        public long TypeID { get; set; }
        public string TypeTitle { get; set; }
        public string Measurement { get; set; }

        public CssColor cssColor { get; set; }

        public List<Alert> alerts { get; set; }
        public List<EndPointIO> endPointIOs { get; set; }



        //public string TileIcon { get; set; }
        //public string TitleColor { get; set; }

        public string LastIOValue { get; set; }
        public DateTime LastIOTimeStamp { get; set; }
    }
}
