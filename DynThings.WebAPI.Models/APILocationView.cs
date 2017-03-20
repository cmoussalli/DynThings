using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DynThings.WebAPI.Models
{
    public class APILocationView
    {
        #region :: Public Properties ::
        public long ID { get; set; }

        public string Title { get; set; }

        public bool IsActive { get; set; }

        public string OwnerID { get; set; }

        public long LocationViewTypeID { get; set; }

        public string X { get; set; }

        public string Y { get; set; }

        public string Z { get; set; }

        public int LocationsCount { get; set; }
        #endregion

        #region :: Constructor ::
        public APILocationView()
        {
            this.ID = 0;
            this.IsActive = false;
            this.LocationsCount = 0;
            this.LocationViewTypeID = 0;
            this.OwnerID = "";
            this.Title = "";
            this.X = "";
            this.Y = "";
            this.Z = "";

        }
        #endregion
    }
}
