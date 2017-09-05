using System;
using System.Collections.Generic;

namespace DynThings.WebAPI.Models
{
    public class APIEndPointIOWarning
    {
        #region :: Public Properties ::

        public APIEndPoint SourceEndPoint { get; set; }
        public APIThing SourceThing { get; set; }
        public List<APILocation> AffectedLocations { get; set; }
        public List<APILocationView> AffectedLocationViews { get; set; }


        #endregion

        #region :: Constructor ::
        public APIEndPointIOWarning()
        {
            SourceEndPoint = new APIEndPoint();
            SourceThing = new APIThing();
            AffectedLocations = new List<APILocation>();
            AffectedLocationViews = new List<APILocationView>();
          

        }
        #endregion
    }

}