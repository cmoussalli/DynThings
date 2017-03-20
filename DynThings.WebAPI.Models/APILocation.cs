using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DynThings.WebAPI.Models
{
    public class APILocation
    {
        #region :: Public Properties ::
        public long ID { get; set; }
        public System.Guid GUID { get; set; }
        public string Title { get; set; }
        public string LongitudeY { get; set; }
        public string LatitudeX { get; set; }
        public bool isActive { get; set; }
        public long Status { get; set; }
        public long IconID { get; set; }
        #endregion

        #region :: Constructor ::
        public APILocation()
        {
            this.ID = 0;
            this.GUID = System.Guid.NewGuid();
            this.Title = "";
            this.LongitudeY = "";
            this.LatitudeX = "";
            this.isActive = false;
            this.Status = 0;
            this.IconID = 0;

        }
        #endregion
    }
}
