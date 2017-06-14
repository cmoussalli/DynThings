using System;
using System.Collections.Generic;

namespace DynThings.WebAPI.Models
{

    #region APIPlatformInfo
    public class APIPlatformInfo
    {
        #region :: Public Properites ::
        public string Title { get; set; }
        public bool DevMode { get; set; }

        #endregion

        #region :: Constructor ::
        public APIPlatformInfo()
        {
            this.Title = "";
            this.DevMode = false;
        }
        #endregion

    }
    #endregion


}