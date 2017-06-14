using DynThings.Data.Models;
using DynThings.Data.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DynThings.WebAPI.Models.TypesMapper
{

    public static class APIDeviceAdapter
    {
        public static APIDevice fromDevice(Device sourceDevice)
        {
            APIDevice result = new APIDevice();
            result.ID = sourceDevice.ID;
            result.Guid = System.Guid.Parse(sourceDevice.GUID.ToString());
            result.KeyPass = System.Guid.Parse(sourceDevice.KeyPass.ToString());
            result.Title = sourceDevice.Title;
            result.PinCode = sourceDevice.PinCode;
            result.StatusID = (long)sourceDevice.StatusID;
            result.StatusTitle = sourceDevice.DeviceStatu.Title;
            result.IsConnected = sourceDevice.IsConnected0;
            result.IsConnectedDelay = sourceDevice.IsConnectedDelay;
            result.LastConnectionTimeStamp = sourceDevice.LastConnectionTimeStamp;
            result.UTC_Diff = sourceDevice.UTC_Diff;
            //Get Endpoints
            List<APIEndPoint> ens = new List<APIEndPoint>();
            foreach (Endpoint end in sourceDevice.Endpoints)
            {
                APIEndPoint apiEnd = APIEndPointAdapter.fromEndpoint(end);
                ens.Add(apiEnd);
            }
            result.EndPoints = ens;

            //Get Commands
            List<APIDeviceCommand> cmds = new List<APIDeviceCommand>();
            foreach(DeviceCommand cmd in sourceDevice.DeviceCommands)
            {
                APIDeviceCommand apiCmd = APIDeviceCommandAdapter.fromDeviceCommand(cmd);
                cmds.Add(apiCmd);
            }
            result.DeviceCommands = cmds;

            return result;
        }
    }

    public static class DeviceAdapter
    {
        public static Device fromAPIDevice(APIDevice sourceAPIDevice)
        {
            Device result = new Device();
            result.ID = sourceAPIDevice.ID;
            result.GUID = System.Guid.Parse(sourceAPIDevice.Guid.ToString());
            result.KeyPass = System.Guid.Parse(sourceAPIDevice.KeyPass.ToString());
            result.Title = sourceAPIDevice.Title;
            result.PinCode = sourceAPIDevice.PinCode;
            result.StatusID = (long)sourceAPIDevice.StatusID;

            List<Endpoint> ens = new List<Endpoint>();
            foreach (APIEndPoint end in sourceAPIDevice.EndPoints)
            {
                Endpoint End = new Endpoint();
                End.ID = end.ID;
                End.GUID = end.GUID;
                End.KeyPass = end.KeyPass;
                End.PinCode = end.PinCode;
                End.Title = end.Title;
                End.TypeID = end.TypeID;
                End.DeviceID = end.DeviceID;

                ens.Add(End);
            }

            result.Endpoints = ens;
            return result;
        }
    }

}
