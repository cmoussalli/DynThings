using DynThings.Data.Models;
using DynThings.WebAPI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DynThings.WebAPI.TypesMapper
{
    public static class APIDeviceCommandAdapter
    {
        public static APIDeviceCommand fromDeviceCommand(DeviceCommand sourceDeviceCommand,bool loadParents,bool loadChilds)
        {
            APIDeviceCommand apiCmd = new APIDeviceCommand();
            apiCmd.ID = sourceDeviceCommand.ID;
            apiCmd.Title = sourceDeviceCommand.Title;
            apiCmd.Description = sourceDeviceCommand.Description;
            apiCmd.CommandCode = sourceDeviceCommand.CommandCode;

            #region Parents
            if (loadParents)
            {
                #region Device
                apiCmd.Device = TypesMapper.APIDeviceAdapter.fromDevice(sourceDeviceCommand.Device,false,false);

                #endregion

            }
            #endregion
            return apiCmd;
        }
    }

   

}
