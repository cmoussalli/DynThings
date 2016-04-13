using DynThings.Data.Models;
using DynThings.Data.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DynThings.WebAPI.Models.TypesMapper
{

    public static class APIDeviceCommandAdapter
    {
        public static APIDeviceCommand fromDeviceCommand(DeviceCommand sourceDeviceCommand)
        {
            APIDeviceCommand result = new APIDeviceCommand();
            result.ID = sourceDeviceCommand.ID;
            result.CommandCode = sourceDeviceCommand.CommandCode;
            result.Description = sourceDeviceCommand.Description;
            result.OwnerID = sourceDeviceCommand.OwnerID;
            result.Title = sourceDeviceCommand.Title;
            result.DeviceID = sourceDeviceCommand.DeviceID;

            return result;
        }
    }

   

}
