using System;
using System.Collections.Generic;
using System.Text;
using DynThings.WebAPI.Models;

namespace DynThings.WebAPI.Models.ResponseModels
{
    public class APIDeviceCommandResponseModels
    {
        public class GetDeviceCommandsList
        {
            public List<APIDeviceCommand> DeviceCommands { get; set; }


            public PagingInfoResponseModel PagingInfo { get; set; }

            public GetDeviceCommandsList()
            {
                DeviceCommands = new List<APIDeviceCommand>();
            }
        }


    }
}
