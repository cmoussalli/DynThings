/////////////////////////////////////////////////////////////////
// Created by : Caesar Moussalli                               //
// TimeStamp  : 3-2-2016                                       //
// Content    : Extend the properties of Device Model          //
// Notes      : Don't add Behavior in this class               //
/////////////////////////////////////////////////////////////////

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DynThings.Data.Models
{
    public partial class Device
    {
        private DynThingsEntities db = new DynThingsEntities();

        public bool IsConnected0
        {
            get
            {
                bool result = false;
                DynThingsEntities db = new DynThingsEntities();
                List<EndPointIO> ios = db.EndPointIOs.Where(i => i.Endpoint.DeviceID.ToString() == "1" ).OrderByDescending(eio => eio.TimeStamp).Take(1).ToList();
                if (ios.Count > 0)
                {
                    TimeSpan diff = DateTime.Now - ios[0].TimeStamp;
                    if ( diff.TotalSeconds > this.IsConnectedDelay )
                    { result = false; }
                }
                return result;
            }
        }

    }
}
