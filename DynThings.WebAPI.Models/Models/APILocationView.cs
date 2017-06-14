using System;
using System.Collections.Generic;

namespace DynThings.WebAPI.Models
{
    public class APILocationView
    {
        #region :: Public Properties ::
        public long ID { get; set; }

        public string Title { get; set; }

        public bool IsActive { get; set; }

        public string OwnerID { get; set; }

        public string X { get; set; }

        public string Y { get; set; }

        public string Z { get; set; }

        #region Master Types
        public APILocationViewType LocationViewType { get; set; }

        #endregion

        #region Parents

        #endregion

        #region Childs
        public List<APILocation> Locations { get; set; }
        public int LocationsCount { get; set; }

        #endregion



        #endregion

        #region :: Constructor ::
        public APILocationView()
        {
            this.ID = 0;
            this.IsActive = false;
            this.LocationsCount = 0;
            this.LocationViewType = new APILocationViewType();
            this.OwnerID = "";
            this.Title = "";
            this.X = "";
            this.Y = "";
            this.Z = "";
            this.Locations = new List<APILocation>();
        }
        #endregion
    }
}
