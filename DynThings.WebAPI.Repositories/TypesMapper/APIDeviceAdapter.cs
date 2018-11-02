using DynThings.Data.Models;
using DynThings.WebAPI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DynThings.WebAPI.TypesMapper
{

    public static class APIDeviceAdapter
    {
        public static APIDevice fromDevice(Device sourceDevice, bool loadEndPoints, bool loadDeviceCommands)
        {
            APIDevice result = new APIDevice();
            result.ID = sourceDevice.ID;
            result.Guid = System.Guid.Parse(sourceDevice.GUID.ToString());
            result.KeyPass = System.Guid.Parse(sourceDevice.KeyPass.ToString());
            result.Title = sourceDevice.Title;
            result.IsConnected = sourceDevice.IsConnected0;
            result.IsConnectedDelay = sourceDevice.IsConnectedDelay;
            result.LastConnectionTimeStamp = sourceDevice.LastConnectionTimeStamp;
            result.UTC_Diff = sourceDevice.UTC_Diff;

            #region Load Master Types
            result.DeviceStatus = TypesMapper.APIDeviceStatusAdapter.fromDeviceStatus(sourceDevice.DeviceStatu);
            #endregion

            #region Load Parents

            #endregion

            #region Load Childs
            #region Load Endpoints
            if (loadEndPoints)
            {

                #region EndPoints
                List<APIEndPoint> ens = new List<APIEndPoint>();
                foreach (Endpoint end in sourceDevice.Endpoints)
                {
                    APIEndPoint apiEnd = APIEndPointAdapter.fromEndpoint(end, false, false);
                    ens.Add(apiEnd);
                }
                result.EndPoints = ens;
                #endregion
            }
            #endregion

            #region Load DeviceCommands
            if (loadDeviceCommands)
            {
                #region Device Commands
                List<APIDeviceCommand> cmds = new List<APIDeviceCommand>();
                foreach (DeviceCommand cmd in sourceDevice.DeviceCommands)
                {
                    APIDeviceCommand apiCmd = APIDeviceCommandAdapter.fromDeviceCommand(cmd, false);
                    cmds.Add(apiCmd);
                }
                result.DeviceCommands = cmds;
                #endregion
            }
            #endregion
            #endregion


            return result;
        }
    }

    //public static class DeviceAdapter
    //{
    //    public static Device fromAPIDevice(APIDevice sourceAPIDevice)
    //    {
    //        Device result = new Device();
    //        result.ID = sourceAPIDevice.ID;
    //        result.GUID = System.Guid.Parse(sourceAPIDevice.Guid.ToString());
    //        result.KeyPass = System.Guid.Parse(sourceAPIDevice.KeyPass.ToString());
    //        result.Title = sourceAPIDevice.Title;
    //        result.PinCode = sourceAPIDevice.PinCode;
    //        result.StatusID = (long)sourceAPIDevice.DeviceStatus.ID;

    //        List<Endpoint> ens = new List<Endpoint>();
    //        foreach (APIEndPoint end in sourceAPIDevice.EndPoints)
    //        {
    //            Endpoint End = new Endpoint();
    //            End.ID = end.ID;
    //            End.GUID = end.GUID;
    //            End.KeyPass = end.KeyPass;
    //            End.Title = end.Title;
    //            End.TypeID = end.EndPointType.ID;
    //            End.DeviceID = end.Device.ID;

    //            ens.Add(End);
    //        }

    //        result.Endpoints = ens;
    //        return result;
    //    }
    //}

}
