using System;
using System.Collections.Generic;

namespace DynThings.WebAPI.Models
{
    public class APIDataType
    {
        #region :: Public Properties ::
        public long ID { get; set; }
        public string Title { get; set; }

        #endregion

        #region :: Constructor ::
        public APIDataType()
        {
            this.ID = 0;
            this.Title = "";
        }
        #endregion
    }
   

}