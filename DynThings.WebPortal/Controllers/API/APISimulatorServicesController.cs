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
using DynThings.WebAPI.TypesMapper;


namespace DynThings.WebPortal.Controllers
{
    public class APISimulatorServicesController : ApiController
    {
        UnitOfWork_Repositories uof_repos = new UnitOfWork_Repositories();


        #region Get All Devices List
        [HttpGet]
        public List<APIDevice> GetDevicesList(Guid platformKey)
        {
            List<Device> devs = uof_repos.repoDevices.GetList();
            List<APIDevice> apiDevs = new List<APIDevice>();
            foreach (Device dev in devs)
            {
                APIDevice apiDev = APIDeviceAdapter.fromDevice(dev);
                apiDevs.Add(apiDev);
            }
            return apiDevs;
        }
        #endregion

        #region Get Device Info
        [HttpGet]
        public APIDevice GetDeviceInfo(Guid platformKey, Guid deviceKeyPass)
        {
            Device dev = uof_repos.repoDevices.FindByKeyPass(deviceKeyPass);
            APIDevice apiDev = APIDeviceAdapter.fromDevice(dev);
            //List<APIDeviceCommand> apiCmds = new List<APIDeviceCommand>();
            //foreach(DeviceCommand cmd in dev.DeviceCommands)
            //{
            //    APIDeviceCommand apiCmd = APIDeviceCommandAdapter.fromDeviceCommand(cmd);
            //    apiCmds.Add(apiCmd);              
            //}
            //apiDev.APIDeviceCommands = apiCmds;
            return apiDev;
        }
        #endregion



    }
}
