using System;
using System.Collections.Generic;
using System.Text;
using DynThings.WebAPI.Models;

namespace DynThings.WebAPI.Models.ResponseModels
{
    public class APIDeviceResponseModels
    {
        public class GetDevicesList
        {
            public List<APIDevice> Devices { get; set; }


            public PagingInfoResponseModel PagingInfo { get; set; }

            public GetDevicesList()
            {
                Devices = new List<APIDevice>();
            }
        }


    }
}
