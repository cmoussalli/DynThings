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
using DynThings.Data.Models;
using DynThings.WebAPI.Models.TypesMapper;

namespace DynThings.WebAPI.Controllers
{
    public class ThingsIOController : ApiController
    {
   
        #region Test
        [HttpGet]
        public string Get()
        {
            return "Test OK";
        }
        #endregion


        #region Devices IO
        #region :: Submit input from device ::
        [HttpPost]
        public ApiResponse SubmitDeviceInput(Models.DeviceIO deviceInput)
        {
            ApiResponse oApiResponse = new ApiResponse();
            //Validate KeyPass
            try
            {
                if (string.IsNullOrEmpty(deviceInput.KeyPass))
                {
                    ResultInfo.Result result = UnitOfWork.resultInfo.GetResultByID(1);
                    oApiResponse = ApiResponseAdapter.fromResult(result);
                    
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
                            oApiResponse = ApiResponseAdapter.fromResult(result);
                            return oApiResponse;
                        }

                        //Submit Data to Database
                        DeviceIOsRepository oDeviceIOsRepository = new DeviceIOsRepository();
                        ResultInfo.Result repoResult = oDeviceIOsRepository.Add(device.ID, deviceInput.Value.ToString(), DeviceIOsRepository.deviceIOType.Input, execTime);

                        //Validate Result
                        if (repoResult.ResultType == ResultInfo.ResultType.Ok)
                        {//Submited
                            ResultInfo.Result result = UnitOfWork.resultInfo.GenerateOKResult();
                            oApiResponse = ApiResponseAdapter.fromResult(result);
                            return oApiResponse;
                        }
                        else
                        {//Submition Failed
                            ResultInfo.Result result = UnitOfWork.resultInfo.GetResultByID(1);
                            oApiResponse = ApiResponseAdapter.fromResult(result);
                            return oApiResponse;
                        }
                    }
                }
                else
                {// KeyPass Parse Failed
                    ResultInfo.Result result = UnitOfWork.resultInfo.GetResultByID(1);
                    oApiResponse = ApiResponseAdapter.fromResult(result);
                    return oApiResponse;
                }

            }
            catch (Exception)
            {
                ResultInfo.Result result = UnitOfWork.resultInfo.GetResultByID(1);
                oApiResponse = ApiResponseAdapter.fromResult(result);
            }
            return oApiResponse;
        }
        #endregion


        #endregion

        #region EndPoints IO
        #region :: Submit input from endpoints ::
        [HttpPost]
        public ApiResponse SubmitEndPointInput(Models.EndPointIO oEndPointInput)
        {
            ApiResponse oApiResponse = new ApiResponse();
            //Validate KeyPass
            try
            {
                if (string.IsNullOrEmpty(oEndPointInput.KeyPass))
                {
                    ResultInfo.Result result = UnitOfWork.resultInfo.GetResultByID(1);
                    oApiResponse = ApiResponseAdapter.fromResult(result);
                    return oApiResponse;
                }

                //Parse KeyPass
                EndpointsRepository oEndpointsRepository = new EndpointsRepository();
                Guid endPointKeyPass;
                if (Guid.TryParse(oEndPointInput.KeyPass, out endPointKeyPass))
                {
                    //endPoint keyPass Validation
                    DynThings.Data.Models.Endpoint oEndpoint = oEndpointsRepository.FindByKeyPass(endPointKeyPass);
                    if (oEndpoint != null)
                    {
                        //Try Parse ExecutionTimeStamp to DateTime
                        DateTime execTime;
                        if (DateTime.TryParse(oEndPointInput.ExectionTimeStamp, out execTime))
                        { }
                        else
                        {//DateTime Parse Failed
                            ResultInfo.Result result = UnitOfWork.resultInfo.GetResultByID(1);
                            oApiResponse = ApiResponseAdapter.fromResult(result);
                            return oApiResponse;
                        }

                        //Submit Data to Database
                        EndpointIOsRepository oEndPointInputsRepository = new EndpointIOsRepository();
                        ResultInfo.Result repoResult = oEndPointInputsRepository.Add(oEndpoint.ID, oEndPointInput.Value.ToString(), EndpointIOsRepository.EndPointIOType.Input, execTime);

                        //Validate Result
                        if (repoResult.ResultType == ResultInfo.ResultType.Ok)
                        {//Submited
                            ResultInfo.Result result = UnitOfWork.resultInfo.GenerateOKResult();
                            oApiResponse = ApiResponseAdapter.fromResult(result);
                            return oApiResponse;
                        }
                        else
                        {//Submition Failed
                            ResultInfo.Result result = UnitOfWork.resultInfo.GetResultByID(1);
                            oApiResponse = ApiResponseAdapter.fromResult(result);
                            return oApiResponse;
                        }
                    }
                }
                else
                {// KeyPass Parse Failed
                    ResultInfo.Result result = UnitOfWork.resultInfo.GetResultByID(1);
                    oApiResponse = ApiResponseAdapter.fromResult(result);
                    return oApiResponse;
                }

            }
            catch (Exception)
            {
                ResultInfo.Result result = UnitOfWork.resultInfo.GetResultByID(1);
                oApiResponse = ApiResponseAdapter.fromResult(result);
            }
            return oApiResponse;
        }
        #endregion

        #region :: Submit Log from endpoints ::
        [HttpPost]
        public ApiResponse SubmitEndPointLog(Models.EndPointIO oEndPointLog)
        {
            ApiResponse oApiResponse = new ApiResponse();
            //Validate KeyPass
            try
            {
                if (string.IsNullOrEmpty(oEndPointLog.KeyPass))
                {
                    ResultInfo.Result result = UnitOfWork.resultInfo.GetResultByID(1);
                    oApiResponse = ApiResponseAdapter.fromResult(result);
                    return oApiResponse;
                }

                //Parse KeyPass
                EndpointsRepository oEndpointsRepository = new EndpointsRepository();
                Guid endPointKeyPass;
                if (Guid.TryParse(oEndPointLog.KeyPass, out endPointKeyPass))
                {
                    //endPoint keyPass Validation
                    DynThings.Data.Models.Endpoint oEndpoint = oEndpointsRepository.FindByKeyPass(endPointKeyPass);
                    if (oEndpoint != null)
                    {
                        //Try Parse ExecutionTimeStamp to DateTime
                        DateTime execTime;
                        if (DateTime.TryParse(oEndPointLog.ExectionTimeStamp, out execTime))
                        { }
                        else
                        {//DateTime Parse Failed
                            ResultInfo.Result result = UnitOfWork.resultInfo.GetResultByID(1);
                            oApiResponse = ApiResponseAdapter.fromResult(result);
                            return oApiResponse;
                        }

                        //Submit Data to Database
                        EndpointIOsRepository oEndPointInputsRepository = new EndpointIOsRepository();
                        ResultInfo.Result repoResult = oEndPointInputsRepository.Add(oEndpoint.ID, oEndPointLog.Value.ToString(), EndpointIOsRepository.EndPointIOType.Log, execTime);

                        //Validate Result
                        if (repoResult.ResultType == ResultInfo.ResultType.Ok)
                        {//Submited
                            ResultInfo.Result result = UnitOfWork.resultInfo.GenerateOKResult();
                            oApiResponse = ApiResponseAdapter.fromResult(result);
                            return oApiResponse;
                        }
                        else
                        {//Submition Failed
                            ResultInfo.Result result = UnitOfWork.resultInfo.GetResultByID(1);
                            oApiResponse = ApiResponseAdapter.fromResult(result);
                            return oApiResponse;
                        }
                    }
                }
                else
                {// KeyPass Parse Failed
                    ResultInfo.Result result = UnitOfWork.resultInfo.GetResultByID(1);
                    oApiResponse = ApiResponseAdapter.fromResult(result);
                    return oApiResponse;
                }

            }
            catch (Exception)
            {
                ResultInfo.Result result = UnitOfWork.resultInfo.GetResultByID(1);
                oApiResponse = ApiResponseAdapter.fromResult(result);
            }
            return oApiResponse;
        }
        #endregion

        #endregion



       
    }
}
