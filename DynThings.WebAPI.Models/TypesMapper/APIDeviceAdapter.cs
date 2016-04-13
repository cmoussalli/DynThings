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

            List<APIEndPoint> ens = new List<APIEndPoint>();
            foreach (Endpoint end in sourceDevice.Endpoints)
            {
                APIEndPoint apiEnd = new APIEndPoint();
                apiEnd.ID = end.ID;
                apiEnd.GUID = end.GUID;
                apiEnd.KeyPass = end.KeyPass;
                apiEnd.PinCode = end.PinCode;
                apiEnd.Title = end.Title;
                apiEnd.TypeID = end.TypeID;
                apiEnd.DeviceID = end.DeviceID;

                ens.Add(apiEnd);
            }

            result.APIEndPoints = ens;
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
            foreach (APIEndPoint end in sourceAPIDevice.APIEndPoints)
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
