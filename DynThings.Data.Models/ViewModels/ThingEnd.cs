
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
        public VMDevice Device { get; set; }

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
            end.IconID = long.Parse(source.IconID.ToString());
            this.EndPoint = end;

            VMDevice dev = new VMDevice();
            dev.ID = source.DeviceID;
            dev.Title = source.DeviceTitle;
            dev.IsConnected = (bool)source.IsConnected;
            this.Device = dev;

            this.LastSubmitValue = source.LastIOValue;
            this.LastSubmitTimeStamp = source.LastIOTimeStamp;

        }

        #endregion
    }






}
