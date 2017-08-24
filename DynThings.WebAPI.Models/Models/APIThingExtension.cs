using System;
using System.Collections.Generic;

namespace DynThings.WebAPI.Models
{
    public class APIThingExtension
    {
        #region :: Public Properties ::
        public long ID { get; set; }
        public System.Guid GUID { get; set; }
        public string Code { get; set; }
        public string Title { get; set; }
        public bool IsList { get; set; }

        #region Master Types
        public APIDataType DataType { get; set; }
        public APIThingsType ThingType { get; set; }
        #endregion

        #region Parents

        #endregion

        #region Childs
        public List<APIThingExtensionValue> APIThingExtensionValues { get; set; }

        #endregion

        #endregion

        #region :: Constructor ::
        public APIThingExtension()
        {
            this.ID = 0;
            this.GUID = System.Guid.NewGuid();
            this.Code = "";
            this.Title = "";
            this.IsList = false;
            this.DataType = new APIDataType();
            this.ThingType = new APIThingsType();
            
        }
        #endregion
    }
}
