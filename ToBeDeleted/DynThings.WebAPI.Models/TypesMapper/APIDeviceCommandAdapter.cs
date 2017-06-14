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
            APIDeviceCommand apiCmd = new APIDeviceCommand();
            apiCmd.ID = sourceDeviceCommand.ID;
            apiCmd.Title = sourceDeviceCommand.Title;
            apiCmd.Description = sourceDeviceCommand.Description;
            apiCmd.CommandCode = sourceDeviceCommand.CommandCode;
            apiCmd.DeviceID = sourceDeviceCommand.DeviceID;
            apiCmd.OwnerID = sourceDeviceCommand.OwnerID;
            return apiCmd;
        }
    }

   

}
