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
        public ApiResponse SubmitDeviceInput(Models.SubmissionDeviceIO deviceInput)
        {
            ApiResponse oApiResponse = new ApiResponse();
            //Validate KeyPass
            try
            {
                if (string.IsNullOrEmpty(deviceInput.KeyPass))
                {
                    ResultInfo.Result result = ResultInfo.GetResultByID(1);
                    oApiResponse = ApiResponseAdapter.fromResult(result);

                    return oApiResponse;
                }

                //Parse KeyPass
                Guid deviceGuid;
                if (Guid.TryParse(deviceInput.KeyPass, out deviceGuid))
                {
                    //Device keyPass Validation
                    DynThings.Data.Models.Device device = UnitOfWork_Repositories.repoDevices.FindByKeyPass(deviceGuid);
                    if (device != null)
                    {
                        //Try Parse ExecutionTimeStamp to DateTime
                        DateTime execTime;
                        if (DateTime.TryParse(deviceInput.ExectionTimeStamp, out execTime))
                        { }
                        else
                        {//DateTime Parse Failed
                            ResultInfo.Result result = ResultInfo.GetResultByID(1);
                            oApiResponse = ApiResponseAdapter.fromResult(result);
                            return oApiResponse;
                        }

                        //Submit Data to Database
                        ResultInfo.Result repoResult = UnitOfWork_Repositories.repoDeviceIOs.Add(device.ID, deviceInput.Value.ToString(), DeviceIOsRepository.deviceIOType.Input, execTime);

                        //Validate Result
                        if (repoResult.ResultType == ResultInfo.ResultType.Ok)
                        {//Submited
                            ResultInfo.Result result = ResultInfo.GenerateOKResult();
                            oApiResponse = ApiResponseAdapter.fromResult(result);
                            return oApiResponse;
                        }
                        else
                        {//Submition Failed
                            ResultInfo.Result result = ResultInfo.GetResultByID(1);
                            oApiResponse = ApiResponseAdapter.fromResult(result);
                            return oApiResponse;
                        }
                    }
                }
                else
                {// KeyPass Parse Failed
                    ResultInfo.Result result = ResultInfo.GetResultByID(1);
                    oApiResponse = ApiResponseAdapter.fromResult(result);
                    return oApiResponse;
                }

            }
            catch (Exception)
            {
                ResultInfo.Result result = ResultInfo.GetResultByID(1);
                oApiResponse = ApiResponseAdapter.fromResult(result);
            }
            return oApiResponse;
        }
        #endregion

        #region :: Submit input from device ::
        [HttpPost]
        public ApiResponse SubmitDeviceLog(Models.SubmissionDeviceIO deviceInput)
        {
            ApiResponse oApiResponse = new ApiResponse();
            //Validate KeyPass
            try
            {
                if (string.IsNullOrEmpty(deviceInput.KeyPass))
                {
                    ResultInfo.Result result = ResultInfo.GetResultByID(1);
                    oApiResponse = ApiResponseAdapter.fromResult(result);

                    return oApiResponse;
                }

                //Parse KeyPass
                Guid deviceGuid;
                if (Guid.TryParse(deviceInput.KeyPass, out deviceGuid))
                {
                    //Device keyPass Validation
                    DynThings.Data.Models.Device device = UnitOfWork_Repositories.repoDevices.FindByKeyPass(deviceGuid);
                    if (device != null)
                    {
                        //Try Parse ExecutionTimeStamp to DateTime
                        DateTime execTime;
                        if (DateTime.TryParse(deviceInput.ExectionTimeStamp, out execTime))
                        { }
                        else
                        {//DateTime Parse Failed
                            ResultInfo.Result result = ResultInfo.GetResultByID(1);
                            oApiResponse = ApiResponseAdapter.fromResult(result);
                            return oApiResponse;
                        }

                        //Submit Data to Database
                        ResultInfo.Result repoResult = UnitOfWork_Repositories.repoDeviceIOs.Add(device.ID, deviceInput.Value.ToString(), DeviceIOsRepository.deviceIOType.Log, execTime);

                        //Validate Result
                        if (repoResult.ResultType == ResultInfo.ResultType.Ok)
                        {//Submited
                            ResultInfo.Result result = ResultInfo.GenerateOKResult();
                            oApiResponse = ApiResponseAdapter.fromResult(result);
                            return oApiResponse;
                        }
                        else
                        {//Submition Failed
                            ResultInfo.Result result = ResultInfo.GetResultByID(1);
                            oApiResponse = ApiResponseAdapter.fromResult(result);
                            return oApiResponse;
                        }
                    }
                }
                else
                {// KeyPass Parse Failed
                    ResultInfo.Result result = ResultInfo.GetResultByID(1);
                    oApiResponse = ApiResponseAdapter.fromResult(result);
                    return oApiResponse;
                }

            }
            catch (Exception)
            {
                ResultInfo.Result result = ResultInfo.GetResultByID(1);
                oApiResponse = ApiResponseAdapter.fromResult(result);
            }
            return oApiResponse;
        }
        #endregion

        #region :: Get device pending Commands ::
        [HttpGet]
        public List<APIDeviceIO> GetDevicePendingCommands(Guid deviceKeyPass)
        {
            List<APIDeviceIO> apiCmds = new List<APIDeviceIO>();
            List<DeviceIO> cmds = UnitOfWork_Repositories.repoDeviceIOs.GetPendingCommandsList(deviceKeyPass);
            foreach (DeviceIO cmd in cmds)
            {
                APIDeviceIO apiCmd = new APIDeviceIO();
                apiCmd = APIDeviceIOAdapter.FromDeviceIO(cmd);
                apiCmds.Add(apiCmd);
            }

            return apiCmds;
        }
        #endregion


        #endregion

        #region EndPoints IO
        #region :: Submit input from endpoints ::
        [HttpPost]
        public ApiResponse SubmitEndPointInput(Models.SubmissionEndPointIO oEndPointInput)
        {
            ApiResponse oApiResponse = new ApiResponse();
            //Validate KeyPass
            try
            {
                if (string.IsNullOrEmpty(oEndPointInput.KeyPass))
                {
                    ResultInfo.Result result = ResultInfo.GetResultByID(1);
                    oApiResponse = ApiResponseAdapter.fromResult(result);
                    return oApiResponse;
                }

                Guid endPointKeyPass;
                if (Guid.TryParse(oEndPointInput.KeyPass, out endPointKeyPass))
                {
                    //endPoint keyPass Validation
                    DynThings.Data.Models.Endpoint oEndpoint = UnitOfWork_Repositories.repoEndpoints.FindByKeyPass(endPointKeyPass);
                    if (oEndpoint != null)
                    {
                        //Try Parse ExecutionTimeStamp to DateTime
                        DateTime execTime;
                        if (oEndPointInput.ExectionTimeStamp == "")
                        {
                            oEndPointInput.ExectionTimeStamp = DateTime.Now.ToString();
                        }
                        if (DateTime.TryParse(oEndPointInput.ExectionTimeStamp, out execTime))
                        { }
                        else
                        {//DateTime Parse Failed
                            ResultInfo.Result result = ResultInfo.GetResultByID(1);
                            oApiResponse = ApiResponseAdapter.fromResult(result);
                            return oApiResponse;
                        }

                        //Submit Data to Database
                        ResultInfo.Result repoResult = UnitOfWork_Repositories.repoEndpointIOs.Add(oEndpoint.ID, oEndPointInput.Value.ToString(), EndpointIOsRepository.EndPointIOType.Input, execTime);

                        //Validate Result
                        if (repoResult.ResultType == ResultInfo.ResultType.Ok)
                        {//Submited
                            ResultInfo.Result result = ResultInfo.GenerateOKResult();
                            oApiResponse = ApiResponseAdapter.fromResult(result);
                            return oApiResponse;
                        }
                        else
                        {//Submition Failed
                            ResultInfo.Result result = ResultInfo.GetResultByID(1);
                            oApiResponse = ApiResponseAdapter.fromResult(result);
                            return oApiResponse;
                        }
                    }
                }
                else
                {// KeyPass Parse Failed
                    ResultInfo.Result result = ResultInfo.GetResultByID(1);
                    oApiResponse = ApiResponseAdapter.fromResult(result);
                    return oApiResponse;
                }

            }
            catch (Exception ex)
            {
                ResultInfo.Result result = ResultInfo.GetResultByID(1);
                oApiResponse = ApiResponseAdapter.fromResult(result);
            }
            return oApiResponse;
        }
        #endregion

        #region :: Submit Log from endpoints ::
        [HttpPost]
        public ApiResponse SubmitEndPointLog(Models.SubmissionEndPointIO oEndPointLog)
        {
            ApiResponse oApiResponse = new ApiResponse();
            //Validate KeyPass
            try
            {
                if (string.IsNullOrEmpty(oEndPointLog.KeyPass))
                {
                    ResultInfo.Result result = ResultInfo.GetResultByID(1);
                    oApiResponse = ApiResponseAdapter.fromResult(result);
                    return oApiResponse;
                }

                //Parse KeyPass
                Guid endPointKeyPass;
                if (Guid.TryParse(oEndPointLog.KeyPass, out endPointKeyPass))
                {
                    //endPoint keyPass Validation
                    DynThings.Data.Models.Endpoint oEndpoint = UnitOfWork_Repositories.repoEndpoints.FindByKeyPass(endPointKeyPass);
                    if (oEndpoint != null)
                    {
                        //Try Parse ExecutionTimeStamp to DateTime
                        DateTime execTime;
                        if (DateTime.TryParse(oEndPointLog.ExectionTimeStamp, out execTime))
                        { }
                        else
                        {//DateTime Parse Failed
                            ResultInfo.Result result = ResultInfo.GetResultByID(1);
                            oApiResponse = ApiResponseAdapter.fromResult(result);
                            return oApiResponse;
                        }

                        //Submit Data to Database
                        ResultInfo.Result repoResult = UnitOfWork_Repositories.repoEndpointIOs.Add(oEndpoint.ID, oEndPointLog.Value.ToString(), EndpointIOsRepository.EndPointIOType.Log, execTime);

                        //Validate Result
                        if (repoResult.ResultType == ResultInfo.ResultType.Ok)
                        {//Submited
                            ResultInfo.Result result = ResultInfo.GenerateOKResult();
                            oApiResponse = ApiResponseAdapter.fromResult(result);
                            return oApiResponse;
                        }
                        else
                        {//Submition Failed
                            ResultInfo.Result result = ResultInfo.GetResultByID(1);
                            oApiResponse = ApiResponseAdapter.fromResult(result);
                            return oApiResponse;
                        }
                    }
                }
                else
                {// KeyPass Parse Failed
                    ResultInfo.Result result = ResultInfo.GetResultByID(1);
                    oApiResponse = ApiResponseAdapter.fromResult(result);
                    return oApiResponse;
                }

            }
            catch (Exception)
            {
                ResultInfo.Result result = ResultInfo.GetResultByID(1);
                oApiResponse = ApiResponseAdapter.fromResult(result);
            }
            return oApiResponse;
        }
        #endregion

        #region :: Get endpoint pending Commands ::
        [HttpGet]
        public List<APIEndPointIO> GetEndPointPendingCommands(Guid endPointKeyPass)
        {
            List<APIEndPointIO> apiCmds = new List<APIEndPointIO>();
            List<EndPointIO> cmds = UnitOfWork_Repositories.repoEndpointIOs.GetPendingCommandsList(endPointKeyPass);
            foreach (EndPointIO cmd in cmds)
            {
                APIEndPointIO apiCmd = new APIEndPointIO();
                apiCmd = APIEndPointIOAdapter.FromEndPointIO(cmd);
                apiCmds.Add(apiCmd);
            }

            return apiCmds;
        }
        #endregion
        #endregion




    }
}
