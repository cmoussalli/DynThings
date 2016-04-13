/////////////////////////////////////////////////////////////////
// Created by : Caesar Moussalli                                //
// TimeStamp  : 10-04-2016                                      //
// Content    : Handle Simulator MetaData                       //
// Notes      :                                                 //
/////////////////////////////////////////////////////////////////

using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DynThings.Core;
using DynThings.Data.Repositories;
using DynThings.WebAPI;
using DynThings.WebAPI.Models;
using DynThings.Data.Models;
using DynThings.WebAPI.Models.TypesMapper;

namespace DynThings.WebPortal.Controllers
{
    public class APISimulatorServicesController : ApiController
    {

        #region Get All Devices List
        [HttpGet]
        public List<APIDevice> GetDevicesList(Guid platformKey)
        {
            List<Device> devs = UnitOfWork.repoDevices.GetList();
            List<APIDevice> apiDevs = new List<APIDevice>();
            foreach (Device dev in devs)
            {
                APIDevice apiDev = APIDeviceAdapter.fromDevice(dev);
                apiDevs.Add(apiDev);
            }
            return apiDevs;
        }
        #endregion

      



    }
}
