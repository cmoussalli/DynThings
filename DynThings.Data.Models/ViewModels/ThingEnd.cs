
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DynThings.Data.Models.ViewModels
{
    public class ThingEnd
    {
        public VMLocation Location { get; set; }
        public VMThing Thing { get; set; }
        //public VMDevice Device { get; set; }
        public VMEndPoint EndPoint { get; set; }

        public string LastSubmitValue { get; set; }
        public DateTime? LastSubmitTimeStamp { get; set; }

        #region Converters

        public void ConvertFromQuery_GetThingEndsList(GetThingEnds_Result source)
        {
            VMLocation loc = new VMLocation();
            loc.ID = source.LocationID;
            loc.Title = source.LocationTitle;
            this.Location = loc;

            VMThing tng = new VMThing();
            tng.ID = source.ThingID;
            tng.Title = source.ThingTitle;
            tng.CategoryID = source.ThingCategoryID;
            tng.CategoryTitle = source.ThingCategoryTitle;
            this.Thing = tng;

            VMEndPoint end = new VMEndPoint();
            end.Measurement = source.EndPointMeasurement;
            end.TypeID = source.EndPointTypeID;
            end.TypeTitle = source.EndPointTypeTitle;
            this.EndPoint = end;


            this.LastSubmitValue = source.LastIOValue;
            this.LastSubmitTimeStamp = source.LastIOTimeStamp;

        }

        #endregion
    }




    public class VMThing
    {
        public long ID { get; set; }
        public string Title { get; set; }
        public long CategoryID { get; set; }
        public string CategoryTitle { get; set; }


    }

    public class VMLocation
    {
        public long ID { get; set; }
        public string Title { get; set; }

    }

    public class VMDevice
    {
        public long ID { get; set; }
        public string Title { get; set; }

    }

    public class VMEndPoint
    {
        public long ID { get; set; }
        public string Title { get; set; }
        public long TypeID { get; set; }
        public string TypeTitle { get; set; }
        public string Measurement { get; set; }
    }







}
