using System;
using System.Collections.Generic;

namespace DynThings.WebAPI.Models
{
    public class SubmissionDeviceIO
    {
        #region :: Public Properties ::

        public string KeyPass { get; set; }

        public string Value { get; set; }

        public string ExectionTimeStamp { get; set; }

        #endregion

        #region :: Constructor ::
        public SubmissionDeviceIO()
        {
            this.KeyPass = string.Empty;
            this.ExectionTimeStamp = string.Empty;
            this.Value = "";
        } 
        #endregion
    }
}