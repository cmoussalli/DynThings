
using System;
using System.Collections.Generic;
using System.Linq;


namespace DynThings.WebAPIClient.Models
{
    public class SubmissionEndPointIO
    {
        #region :: Public Properties ::

        public string KeyPass { get; set; }

        public string Value { get; set; }

        public string ExectionTimeStamp { get; set; }

        #endregion

        #region :: Constructor ::
        public SubmissionEndPointIO()
        {
            this.KeyPass = string.Empty;
            this.ExectionTimeStamp = string.Empty;
            this.Value = "";
        } 
        #endregion
    }
}