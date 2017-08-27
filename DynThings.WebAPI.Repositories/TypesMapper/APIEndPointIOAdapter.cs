using DynThings.Data.Models;
using DynThings.WebAPI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DynThings.WebAPI.TypesMapper
{

    public static class APIEndPointIOAdapter
    {
        public static APIEndPointIO fromEndpointIO(EndPointIO sourceEndPointIO)
        {
            APIEndPointIO result = new APIEndPointIO();
            result.ID = sourceEndPointIO.ID;
            result.EndPointID = sourceEndPointIO.EndPointID;
            result.ExecTimeStamp = sourceEndPointIO.ExecTimeStamp;
            result.TimeStamp = sourceEndPointIO.TimeStamp;
            result.ScheduleTimeStamp = sourceEndPointIO.ScheduleTimeStamp;
            result.Valu = sourceEndPointIO.Valu;

            return result;
        }
    }


}
