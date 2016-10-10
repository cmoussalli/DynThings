using Microsoft.AspNet.SignalR;
using Microsoft.AspNet.SignalR.Hubs;
using System;

namespace DynThings.WebPortal.Helpers
{
    public class SignalRServices
    {
        public static void ThingEnd_Input(long thingID,long endpointTypeID)
        {
            signalrhub.static_sendtoall("thingendInput",thingID.ToString() + "_" + endpointTypeID.ToString());
        }

        public static void ThingEnd_Log()
        {
            signalrhub.static_sendtoall("thingendLog", "");
        }
    }
}