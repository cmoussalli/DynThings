/////////////////////////////////////////////////////////////////
// Created by : Arshad Ashraf                                   //
// TimeStamp  : 03-02-2016                                      //
// Content    : Handle Device Input, Log And Commands           //
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

namespace DynThings.WebAPI.Controllers
{
    public class ThingsIOController : ApiController
    {
        public TypesMapper typesMapper = new TypesMapper();

        [HttpGet]
        public string Get()
        {
            return "hai";
        }

        #region :: Submit input from device ::
        [HttpPost]
        public ApiResponse SubmitDeviceInput(DeviceInput deviceInput)
        {
            ApiResponse oApiResponse = new ApiResponse();
            //Validate KeyPass
            try
            {
                if (string.IsNullOrEmpty(deviceInput.KeyPass))
                {
                    ResultInfo.Result result = UnitOfWork.resultInfo.GetResultByID(1);
                    oApiResponse = typesMapper.fromResult(result);
                    return oApiResponse;
                }

                //Parse KeyPass
                DevicesRepositories oDevicesRepositories = new DevicesRepositories();
                Guid deviceGuid;
                if (Guid.TryParse(deviceInput.KeyPass, out deviceGuid))
                {
                    //Device keyPass Validation
                    DynThings.Data.Models.Device device = oDevicesRepositories.FindByKeyPass(deviceGuid);
                    if (device != null)
                    {
                        //Try Parse ExecutionTimeStamp to DateTime
                        DateTime execTime;
                        if (DateTime.TryParse(deviceInput.ExectionTimeStamp, out execTime))
                        { }else
                        {//DateTime Parse Failed
                            ResultInfo.Result result = UnitOfWork.resultInfo.GetResultByID(1);
                            oApiResponse = typesMapper.fromResult(result);
                            return oApiResponse;
                        }

                        //Submit Data to Database
                        DeviceIOsRepository oDeviceIOsRepository = new DeviceIOsRepository();
                        ResultInfo.Result repoResult = oDeviceIOsRepository.Add(device.ID, deviceInput.Value.ToString(), DeviceIOsRepository.deviceIOType.Input, execTime);

                        //Validate Result
                        if (repoResult.ResultType == ResultInfo.ResultType.Ok)
                        {//Submited
                            ResultInfo.Result result = UnitOfWork.resultInfo.GenerateOKResult();
                            oApiResponse = typesMapper.fromResult(result);
                            return oApiResponse;
                        }
                        else
                        {//Submition Failed
                            ResultInfo.Result result = UnitOfWork.resultInfo.GetResultByID(1);
                            oApiResponse = typesMapper.fromResult(result);
                            return oApiResponse;
                        }
                    }
                }
                else
                {// KeyPass Parse Failed
                    ResultInfo.Result result = UnitOfWork.resultInfo.GetResultByID(1);
                    oApiResponse = typesMapper.fromResult(result);
                    return oApiResponse;
                }

            }
            catch (Exception)
            {
                ResultInfo.Result result = UnitOfWork.resultInfo.GetResultByID(1);
                oApiResponse = typesMapper.fromResult(result);
            }
            return oApiResponse;
        }
        #endregion


    }
}
