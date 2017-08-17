using System;
using System.Collections.Generic;

namespace DynThings.WebAPI.Models
{

    public class APIThingEnd
    {
        public long ID { get; set; }

        public string LastIOValue { get; set; }

        public Nullable<long> LastIOID { get; set; }

        public Nullable<System.DateTime> LastIOTimeStamp { get; set; }

        public Nullable<System.DateTime> LastIOTimeStampUTC { get; set; }


        #region Master Types
        public APIEndPointType EndPointType { get; set; }

        #endregion

        #region Parents
        public APIThing Thing { get; set; }
        public APIEndPoint LastIOEndPoint { get; set; }

        #endregion

        //#region Childs
        //public APIEndPoint EndPoint { get; set; }
        //public APIDevice Device { get; set; }
        //#endregion





        #region :: Constructor ::
        public APIThingEnd()
        {
            this.ID = 0;
            this.LastIOID = 0;
            this.LastIOTimeStamp = null;
            this.LastIOTimeStampUTC = null;
            this.LastIOValue = "";
            this.Thing = new APIThing();
            //this.Device = new APIDevice();
            //this.EndPoint = new APIEndPoint();
        }
        #endregion
    }


}