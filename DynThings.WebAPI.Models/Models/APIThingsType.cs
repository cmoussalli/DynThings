using System;
using System.Collections.Generic;

namespace DynThings.WebAPI.Models
{
    public class APIThingsType
    {
        #region :: Public Properties ::
        public long ID { get; set; }
        public string Title { get; set; }

        #endregion

        #region :: Constructor ::
        public APIThingsType()
        {
            this.ID = 0;
            this.Title = "";
        }
        #endregion
    }
   

}