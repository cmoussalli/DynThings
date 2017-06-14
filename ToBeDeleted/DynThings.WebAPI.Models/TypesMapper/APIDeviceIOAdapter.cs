using DynThings.Data.Models;
using DynThings.Data.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DynThings.WebAPI.Models.TypesMapper
{
    public static class APIDeviceIOAdapter
    {
        public static APIDeviceIO FromDeviceIO(DeviceIO sourceDeviceIO)
        {
            APIDeviceIO result = new APIDeviceIO();
            result.ID = sourceDeviceIO.ID;
            result.DeviceID = long.Parse(sourceDeviceIO.DeviceID.ToString());
            result.IOTypeID = long.Parse(sourceDeviceIO.IOTypeID.ToString());
            result.Valu = sourceDeviceIO.Valu;
            result.TimeStamp = DateTime.Parse( sourceDeviceIO.TimeStamp.ToString());
            result.ExecTimeStamp = sourceDeviceIO.ExecTimeStamp;
            result.ScheduleTimeStamp = sourceDeviceIO.ScheduleTimeStamp;

            return result;
        }
    }


}
