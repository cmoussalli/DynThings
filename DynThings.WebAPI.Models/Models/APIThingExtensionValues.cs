using System;
using System.Collections.Generic;

namespace DynThings.WebAPI.Models
{
    public class APIThingExtensionValue
    {
        #region :: Public Properties ::
        public long ID { get; set; }
        public string Value { get; set; }

        #region Master Types
        #endregion

        #region Parents
        public APIThingExtension ThingExtension { get; set; }
        public APIThing Thing { get; set; }
        #endregion

        #region Childs
        
        #endregion

        #endregion

        #region :: Constructor ::
        public APIThingExtensionValue()
        {
            this.ID = 0;
            this.Value = "";
            this.Thing = new APIThing();
            this.ThingExtension = new APIThingExtension();
        }
        #endregion
    }
}
