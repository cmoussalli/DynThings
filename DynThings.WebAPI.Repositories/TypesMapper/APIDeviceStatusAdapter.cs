using DynThings.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DynThings.Data.Models.ViewModels;
using AutoMapper;
using DynThings.WebAPI.Models;

namespace DynThings.WebAPI.TypesMapper
{

    public static class APIDeviceStatusAdapter
    {
        public static APIDeviceStatus fromDeviceStatus(DeviceStatu sourceDeviceStatus)
        {
            APIDeviceStatus result = new APIDeviceStatus();
            result.ID = sourceDeviceStatus.ID;
            result.Title = sourceDeviceStatus.Title;
            
            return result;
        }
    }


}
