
using System;
using System.Collections.Generic;
using System.Linq;


namespace DynThings.WebAPIClient.Models
{
    public class SubmissionEndPointCommandExecuted
    {
        #region :: Public Properties ::

        public long EndPointCommandIOID { get; set; }

        public DateTime? ExectionTimeStamp { get; set; }

        #endregion

        #region :: Constructor ::
        public SubmissionEndPointCommandExecuted()
        {
            this.ExectionTimeStamp = null;
            this.EndPointCommandIOID = 0;
        } 
        #endregion
    }
}