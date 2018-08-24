/////////////////////////////////////////////////////////////////
// Created by : Caesar Moussalli                               //
// TimeStamp  : 14-07-2016                                     //
// Content    : IO submition APIs                              //
// Notes      : Use HTTPGet to send data in URL                //
//              Or, use HTTPPost to send data in body          //
//                                                             //
/////////////////////////////////////////////////////////////////

using DynThings.Core;
using DynThings.Data.Models;
using DynThings.Data.Repositories;
using DynThings.WebAPI;
using DynThings.WebAPI.Models;
using DynThings.WebAPI.TypesMapper;
using DynThings.WebPortal;
using Microsoft.AspNet.SignalR;
using Microsoft.AspNet.SignalR.Hubs;
using Microsoft.AspNet.SignalR.Configuration;
using Microsoft.AspNet.SignalR.Hosting;
using Microsoft.AspNet.SignalR.Infrastructure;
using Microsoft.AspNet.SignalR.Owin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DynThings.WebPortal.Helpers;
using System.Net.Mail;


namespace DynThings.WebAPI.Controllers
{
    public class ThingsIOController : ApiController
    {
        UnitOfWork_Repositories uof_repos = new UnitOfWork_Repositories();

        #region Validate
        [HttpGet]
        public string Get()
        {
            return "Test OK";
        }

        [HttpGet]
        public APIPlatformInfo PlatformInfo()
        {
            APIPlatformInfo apiPlatformInfo = new APIPlatformInfo();
            //Get Platform Info from DynThings.Core
            apiPlatformInfo.DevMode = Config.DevelopmentMode;
            apiPlatformInfo.Title = Config.PlatformTitle;
            return apiPlatformInfo;
        }
        #endregion

        #region Core
        #region Submit Input
        private ApiResponse CoreSubmitEndPointInput(Models.SubmissionEndPointIO oEndPointInput)
        {
            ApiResponse oApiResponse = new ApiResponse();
            try
            {
                //Validate KeyPass
                if (string.IsNullOrEmpty(oEndPointInput.KeyPass))
                {
                    ResultInfo.Result result = ResultInfo.GenerateErrorResult("Keypass is missing");
                    oApiResponse = ApiResponseAdapter.fromResult(result);
                    return oApiResponse;
                }

                Guid endPointKeyPass;
                if (Guid.TryParse(oEndPointInput.KeyPass, out endPointKeyPass))
                {
                    //endPoint keyPass Validation
                    DynThings.Data.Models.Endpoint oEndpoint = uof_repos.repoEndpoints.FindByKeyPass(endPointKeyPass);

                    if (oEndpoint != null)
                    {
                        //Try Parse ExecutionTimeStamp to DateTime
                        DateTime execTime;
                        if (oEndPointInput.ExectionTimeStamp == "")
                        {
                            oEndPointInput.ExectionTimeStamp = DateTime.UtcNow.AddHours(int.Parse(oEndpoint.Device.UTC_Diff.ToString())).ToString();
                        }
                        if (DateTime.TryParse(oEndPointInput.ExectionTimeStamp, out execTime))
                        {
                        }
                        else
                        {//DateTime Parse Failed
                            ResultInfo.Result result = ResultInfo.GenerateErrorResult("DateTime is not in correct format");
                            oApiResponse = ApiResponseAdapter.fromResult(result);
                            return oApiResponse;
                        }

                        //Submit Data to Database
                        ResultInfo.Result repoResult = uof_repos.repoEndpointIOs.SubmitInput(endPointKeyPass, oEndPointInput.Value.ToString(), execTime);

                        oApiResponse = ApiResponseAdapter.fromResult(repoResult);
                    }
                }
                else
                {// KeyPass Parse Failed
                    ResultInfo.Result result = ResultInfo.GenerateErrorResult("Keypass is not valid");
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

        #region Submit Log
        private ApiResponse CoreSubmitEndPointLog(Models.SubmissionEndPointIO oEndPointLog)
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

                Guid endPointKeyPass;
                if (Guid.TryParse(oEndPointLog.KeyPass, out endPointKeyPass))
                {
                    //endPoint keyPass Validation
                    DynThings.Data.Models.Endpoint oEndpoint = uof_repos.repoEndpoints.FindByKeyPass(endPointKeyPass);

                    if (oEndpoint != null)
                    {
                        //Try Parse ExecutionTimeStamp to DateTime
                        DateTime execTime;
                        if (oEndPointLog.ExectionTimeStamp == "")
                        {
                            oEndPointLog.ExectionTimeStamp = DateTime.UtcNow.AddHours(int.Parse(oEndpoint.Device.UTC_Diff.ToString())).ToString();
                        }
                        if (DateTime.TryParse(oEndPointLog.ExectionTimeStamp, out execTime))
                        {
                        }
                        else
                        {//DateTime Parse Failed
                            ResultInfo.Result result = ResultInfo.GetResultByID(1);
                            oApiResponse = ApiResponseAdapter.fromResult(result);
                            return oApiResponse;
                        }

                        //Submit Data to Database
                        ResultInfo.Result repoResult = uof_repos.repoEndpointIOs.SubmitLog(endPointKeyPass, oEndPointLog.Value.ToString(), execTime);
                        oApiResponse = ApiResponseAdapter.fromResult(repoResult);

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

        #region Command Executed
        private ApiResponse CoreSetEndPointPendingCommandAsExecuted(SubmissionEndPointCommandExecuted submission)
        {
            ApiResponse oApiResponse = ApiResponseAdapter.fromResult(ResultInfo.GenerateErrorResult());
            try
            {
                return ApiResponseAdapter.fromResult(uof_repos.repoEndpointIOs.SetCommandAsExecuted(submission.EndPointCommandIOID,submission.EndPointKeyPass, submission.ExectionTimeStamp));
            }
            catch
            {

            }
            return oApiResponse;
        }
        #endregion

        #endregion

        #region Devices IO
        #region :: Submit from device :: input
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
                    DynThings.Data.Models.Device device = uof_repos.repoDevices.FindByKeyPass(deviceGuid);
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
                        ResultInfo.Result repoResult = uof_repos.repoDeviceIOs.Add(device.ID, deviceInput.Value.ToString(), DeviceIOsRepository.deviceIOType.Input, execTime);

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

        #region :: Submit from device :: Log
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
                    DynThings.Data.Models.Device device = uof_repos.repoDevices.FindByKeyPass(deviceGuid);
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
                        ResultInfo.Result repoResult = uof_repos.repoDeviceIOs.Add(device.ID, deviceInput.Value.ToString(), DeviceIOsRepository.deviceIOType.Log, execTime);

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

        //#region :: Get device pending :: Commands
        //[HttpGet]
        //public List<APIDeviceIO> GetDevicePendingCommands(Guid deviceKeyPass)
        //{
        //    List<APIDeviceIO> apiCmds = new List<APIDeviceIO>();
        //    List<DeviceIO> cmds = uof_repos.repoDeviceIOs.GetPendingCommandsList(deviceKeyPass);
        //    foreach (DeviceIO cmd in cmds)
        //    {
        //        APIDeviceIO apiCmd = new APIDeviceIO();
        //        apiCmd = APIDeviceIOAdapter.FromDeviceIO(cmd);
        //        apiCmds.Add(apiCmd);
        //    }

        //    return apiCmds;
        //}
        //#endregion


        #endregion

        #region EndPoints IO
        #region :: Submit input from endpoints ::
        [HttpPost]
        public ApiResponse SubmitEndPointInput(Models.SubmissionEndPointIO endPointInput)
        {
            return CoreSubmitEndPointInput(endPointInput);
        }

        [HttpGet]
        public ApiResponse SubmitEndPointInput(string keypass, string value)
        {
            SubmissionEndPointIO sub = new SubmissionEndPointIO();
            sub.KeyPass = keypass;
            sub.Value = value;
            return CoreSubmitEndPointInput(sub);
        }
        #endregion

        #region :: Submit Log from endpoints ::
        [HttpPost]
        public ApiResponse SubmitEndPointLog(Models.SubmissionEndPointIO endPointLog)
        {

            return CoreSubmitEndPointLog(endPointLog);
        }

        [HttpGet]
        public ApiResponse SubmitEndPointLog(string keypass, string value)
        {
            SubmissionEndPointIO sub = new SubmissionEndPointIO();
            sub.KeyPass = keypass;
            sub.Value = value;
            return CoreSubmitEndPointLog(sub);
        }
        #endregion

        #region :: Get endpoint pending Commands ::
        [HttpGet]
        public List<APIEndPointIO> GetEndPointPendingCommands(Guid endPointKeyPass)
        {
            List<APIEndPointIO> apiCmds = new List<APIEndPointIO>();
            List<EndPointIO> cmds = uof_repos.repoEndpointIOs.GetPendingCommandsList(endPointKeyPass);
            foreach (EndPointIO cmd in cmds)
            {
                APIEndPointIO apiCmd = new APIEndPointIO();
                apiCmd = APIEndPointIOAdapter.fromEndpointIO(cmd);
                apiCmds.Add(apiCmd);
            }

            return apiCmds;
        }
        #endregion

        #region :: Set endpoint pending Command as Executed ::
        [HttpPost]
        public ApiResponse SetEndPointCommandAsExecuted(SubmissionEndPointCommandExecuted submission)
        {
            return CoreSetEndPointPendingCommandAsExecuted(submission);
        }

        [HttpGet]
        public ApiResponse SetEndPointCommandAsExecuted(long commandIOID, DateTime? execTimeStamp)
        {
            SubmissionEndPointCommandExecuted submission = new SubmissionEndPointCommandExecuted();
            submission.EndPointCommandIOID = commandIOID;
            submission.ExectionTimeStamp = execTimeStamp;
            return CoreSetEndPointPendingCommandAsExecuted(submission);
        }

        [HttpGet]
        public ApiResponse SetEndPointCommandAsExecuted0(long commandIOID,string keypass)
        {
            SubmissionEndPointCommandExecuted submission = new SubmissionEndPointCommandExecuted();
            submission.EndPointKeyPass = Guid.Parse(keypass);
            submission.EndPointCommandIOID = commandIOID;
            submission.ExectionTimeStamp = DateTime.Now;
            return CoreSetEndPointPendingCommandAsExecuted(submission);
        }
        #endregion
        #endregion


    }
}
