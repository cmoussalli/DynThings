using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DynThings.Data.Models;

namespace DynThings.Core
{
    public static class ResultInfo
    {
        public static DynThingsEntities db = new DynThingsEntities();
       

        #region Enums
        public enum ResultType
        {
            Ok = 0,
            Failed_DevelopmentMode = 1,
            Failed_ProductionMode =2
        }
        #endregion

        #region Result Model
        public class Result
        {
            internal Result(long resultID, ResultType resultType, string message,long reference)
            {
                ResultID = resultID;
                ResultType = resultType;
                Message = message;
                Reference = reference;
            }
            public long ResultID { get; set; }
            public ResultType ResultType { get; set; }
            public string Message { get; set; }
            public long Reference { get; set; }
        }
        #endregion

        

        #region Method: Generate Ok Result
        public static Result GenerateOKResult()
        {
            return new Result(0,ResultType.Ok, "",0);
        }
        public static Result GenerateOKResult(string message, long referenceID)
        {
            return new Result(0, ResultType.Ok, message,referenceID);
        }
        public static Result GenerateOKResult(string message)
        {
            return new Result(0, ResultType.Ok, message, 0);
        }
        public static Result GenerateOKResult(long referenceID)
        {
            return new Result(0, ResultType.Ok, "", referenceID);
        }

        #endregion

        #region Method: Generate Error Result based on Database, But First =>>>>>>>> VALIDATE DEV MODE <<<<<<<
        public static Result GetResultByID(long resultID)
        {
            return GetResultByID(resultID, 0);
        }

        public static Result GetResultByID(long resultID,long referenceID)
        {
            ResultMessage msg = db.ResultMessages.Find(resultID);
            string msgTxt = "";
            ResultType rt = new ResultType();
            if (msg.IsError == false)
            { rt = ResultType.Ok;}
            else
            {
                if (Config.DevelopmentMode == true)
                {
                rt = ResultType.Failed_DevelopmentMode;
                    msgTxt = msg.Message;
                }
                else
                {
                    rt = ResultType.Failed_ProductionMode;
                }
            }

            Result res = new Result(resultID, rt,msgTxt, referenceID);
            res = new Result(msg.ID, rt, msg.Message,0);
            
            return res;
        }

        #endregion



        //#region Helper: Return Production Mode Result
        //public static Result GenerateProductionModeResult(long resultID)
        //{
        //    Result result = new Result(resultID, ResultType.Failed_ProductionMode, "", 0);
        //    return result;
        //}

        //public static Result GenerateProductionModeResult(long resultID, long referenceID)
        //{
        //    Result result = new Result(resultID, ResultType.Failed_ProductionMode, "", referenceID);
        //    return result;
        //}
        //#endregion

        #region Helper: Generate Error Result

        public static Result GenerateErrorResult(string message)
        {
            return new Result(0, ResultType.Failed_DevelopmentMode, message,0);
        }

        public static Result GenerateErrorResult(string message,long resultID)
        {
            return new Result(0, ResultType.Failed_DevelopmentMode, message, resultID);
        }
        #endregion




    }
}
