using System;
using System.Collections.Generic;

namespace DynThings.WebAPI.Models
{
    public class APIThing
    {
        #region :: Public Properties ::

        public long ID { get; set; }

        public string Title { get; set; }

        public int UTC_Diff { get; set; }

        #region Master Types
        public APIThingsType ThingsType { get; set; }

        #endregion

        #region Parents
        public List<APILocation> Locations { get; set; }
        
        #endregion

        #region Childs

        public List<APIThingEnd> ThingEnds { get; set; }
        public int ThingEndsCount { get; set; }

        
        #endregion




        #endregion

        #region :: Constructor ::
        public APIThing()
        {
            this.ID = 0;
            this.Title = "";
            this.ThingsType = new APIThingsType();
            this.UTC_Diff = 0;

            //this.EndPoints = new List<APIEndPoint>();
        }
        #endregion
    }

   

}