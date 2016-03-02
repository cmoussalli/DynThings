/////////////////////////////////////////////////////////////////
// Created by : Arshad Ashraf                                   //
// TimeStamp  : 03-02-2016                                      //
// Content    : Handle Device Input, Log And Commands           //
// Notes      :                                                 //
/////////////////////////////////////////////////////////////////
using DynThings.Data.Repositories;
using DynThings.WebAPI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace DynThings.WebAPI.Controllers
{
    public class DeviceController : Controller
    {
        [HttpPut]
        #region :: SendInputToDevice ::
        
        public ApiResponse SendInputToDevice(DeviceEntitiy deviceEntity)
        {
            ApiResponse oApiResponse = new ApiResponse();

            try
            {
                if (string.IsNullOrEmpty(deviceEntity.KeyPass))
                {
                    if (string.IsNullOrEmpty(deviceEntity.KeyPass))
                    {
                        oApiResponse.ErrorMessage = "KeyPass value cannot be blank";
                        return oApiResponse;
                    }
                }
                //Getting DeviceID based on keyPass Value
                DevicesRepositories oDevicesRepositories = new DevicesRepositories();
                Guid deviceGuid;

                if (Guid.TryParse(deviceEntity.KeyPass, out deviceGuid))
                {
                    //Device keyPass Validation
                    DynThings.Data.Models.Device device = oDevicesRepositories.FindByKeyPass(deviceGuid);
                    if (device != null)
                    {
                        DeviceIOsRepository oDeviceIOsRepository = new DeviceIOsRepository();
                        ResultInfo.Result repoResult = oDeviceIOsRepository.Add(device.ID, deviceEntity.Value.ToString(), DeviceIOsRepository.deviceIOType.Input);
                        if (repoResult.ResultType == ResultInfo.ResultType.Ok)
                        {
                            //Created!
                            oApiResponse.Success = true;
                            oApiResponse.ErrorMessage = "Input processed successfully.";
                            return oApiResponse;
                        }
                        else
                        {
                            oApiResponse.ErrorMessage = "Error while adding input";
                            return oApiResponse;
                        }
                    }
                }
                else
                {
                    oApiResponse.ErrorMessage = "Invalid device keypass input";
                    return oApiResponse;
                }

            }
            catch (Exception)
            {
                oApiResponse.Success = false;
                oApiResponse.ErrorMessage = "Some Error Occured While Sendint Input To Device.";
            }
            return oApiResponse;
        } 
        #endregion
    }
}
