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

            return result;
        }
    }

}
