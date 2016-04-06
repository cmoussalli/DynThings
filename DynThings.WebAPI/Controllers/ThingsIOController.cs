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

        #region Test
        [HttpGet]
        public string Get()
        {
            return "hai";
        }
        #endregion




        #region Devices
        #region :: Submit input from device ::
        [HttpPost]
        public ApiResponse SubmitDeviceInput(DeviceIO deviceInput)
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


        #endregion


        #region EndPoints
        #region :: Submit input from endpoints ::
        [HttpPost]
        public ApiResponse SubmitEndPointInput(EndPointIO oEndPointIO)
        {
            ApiResponse oApiResponse = new ApiResponse();
            //Validate KeyPass
            try
            {
                if (string.IsNullOrEmpty(oEndPointIO.KeyPass))
                {
                    ResultInfo.Result result = UnitOfWork.resultInfo.GetResultByID(1);
                    oApiResponse = typesMapper.fromResult(result);
                    return oApiResponse;
                }

                //Parse KeyPass
                EndpointsRepository oEndpointsRepository = new EndpointsRepository();
                Guid endPointGuid;
                if (Guid.TryParse(oEndPointIO.KeyPass, out endPointGuid))
                {
                    //endPoint keyPass Validation
                    DynThings.Data.Models.Endpoint oEndpoint = oEndpointsRepository.Find(endPointGuid);
                    if (oEndpoint != null)
                    {
                        //Try Parse ExecutionTimeStamp to DateTime
                        DateTime execTime;
                        if (DateTime.TryParse(oEndPointIO.ExectionTimeStamp, out execTime))
                        { }
                        else
                        {//DateTime Parse Failed
                            ResultInfo.Result result = UnitOfWork.resultInfo.GetResultByID(1);
                            oApiResponse = typesMapper.fromResult(result);
                            return oApiResponse;
                        }

                        //Submit Data to Database
                        EndpointIOsRepository oEndpointIOsRepository = new EndpointIOsRepository();
                        ResultInfo.Result repoResult = oEndpointIOsRepository.Add(oEndpoint.ID, oEndPointIO.Value.ToString(), EndpointIOsRepository.EndPointIOType.Input, execTime);

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


        #endregion
    }
}
