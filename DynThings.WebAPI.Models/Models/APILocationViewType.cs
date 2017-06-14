using System;
using System.Collections.Generic;

namespace DynThings.WebAPI.Models
{
    public class APILocationViewType
    {
        #region :: Public Properties ::
        public Nullable<long> ID { get; set; }
        public string Title { get; set; }

        #endregion

        #region :: Constructor ::
        public APILocationViewType()
        {
            this.ID = 0;
            this.Title = "";
        }
        #endregion
    }
   

}