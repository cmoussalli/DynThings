using System;
using System.Collections.Generic;


namespace DynThings.WebAPI.Models
{
    public class APIEndPoint
    {
        #region :: Public Properties ::
        public long ID { get; set; }
        public System.Guid GUID { get; set; }
        public System.Guid KeyPass { get; set; }
        public string Title { get; set; }

        public bool IsNumericOnly { get; set; }
        public Nullable<float> MinValue { get; set; }
        public Nullable<float> MaxValue { get; set; }
        public Nullable<float> LowRange { get; set; }
        public Nullable<float> HighRange { get; set; }

        public Nullable<long> LastIOID { get; set; }
        public string LastIOValue { get; set; }
        public Nullable<System.DateTime> LastIOTimeStamp { get; set; }
        public Nullable<System.DateTime> LastIOTimeStampUTC { get; set; }



        #region Master Types
        public APIEndPointType EndPointType { get; set; }
        #endregion

        #region Parents
        public APIDevice Device { get; set; }
        public APIThing Thing { get; set; }
        #endregion


        #endregion

        #region :: Constructor ::
        public APIEndPoint()
        {
            this.ID = 0;
            //this.Guid = Guid.Empty;
            this.KeyPass = Guid.Empty;
            this.Title = "";
            this.Device = new APIDevice();
            this.EndPointType = new APIEndPointType();
            this.Thing = new APIThing();
        }
        #endregion
    }
   

}