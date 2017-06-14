using DynThings.Data.Models;
using DynThings.Data.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DynThings.WebAPI.Models.TypesMapper
{

    public static class APIEndPointIOAdapter
    {
        public static APIEndPointIO FromEndPointIO(EndPointIO sourceEndPointIO)
        {
            APIEndPointIO result = new APIEndPointIO();
            result.ID = sourceEndPointIO.ID;
            result.EndPointID = sourceEndPointIO.EndPointID;
            result.IOTypeID = sourceEndPointIO.IOTypeID;
            result.Valu = sourceEndPointIO.Valu;
            result.TimeStamp = sourceEndPointIO.TimeStamp;
            result.ExecTimeStamp = sourceEndPointIO.ExecTimeStamp;
            result.ScheduleTimeStamp = sourceEndPointIO.ScheduleTimeStamp;

            return result;
        }
    }

  

}
