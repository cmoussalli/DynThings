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
            Failed_ProductionMode = 2,
            NotAuthorized = 3,
            Info = 4,
            Unknown =99
        }
        #endregion

        #region Result Model
        public class Result
        {
            #region Constructors
            internal Result(long resultID, ResultType resultType, long reference)
            {
                ResultID = resultID;
                ResultType = resultType;
                Message = "";
                Title = "";
                Reference = reference;
            }
            internal Result(long resultID, ResultType resultType, long reference, string title)
            {
                ResultID = resultID;
                ResultType = resultType;
                Message = "";
                Title = Message;
                Reference = reference;
            }
            internal Result(long resultID, ResultType resultType, long reference, string title, string message)
            {
                ResultID = resultID;
                ResultType = resultType;
                Title = title;
                Message = message;
                Reference = reference;
            }
            #endregion

            #region Props
            public long ResultID { get; set; }
            public ResultType ResultType { get; set; }
            public string Title { get; set; }
            public string Message { get; set; }
            public long Reference { get; set; }

            #endregion
        }
        #endregion



        #region Method: Generate Ok Result
        public static Result GenerateOKResult()
        {
            return new Result(0, ResultType.Ok, 0);
        }
        public static Result GenerateOKResult(string title)
        {
            return new Result(0, ResultType.Ok, 0, title,"");
        }
        public static Result GenerateOKResult(string title, long referenceID)
        {
            return new Result(0, ResultType.Ok, referenceID, title);
        }
        public static Result GenerateOKResult(string title, string message)
        {
            return new Result(0, ResultType.Ok, 0, title, message);
        }
        public static Result GenerateOKResult(long referenceID)
        {
            return new Result(0, ResultType.Ok, referenceID);
        }
        public static Result GenerateOKResult(string title, string message, long referenceID)
        {
            return new Result(0, ResultType.Ok, referenceID, title, message);
        }

        #endregion

        #region Method: Generate Error Result
        public static Result GenerateErrorResult()
        {
            return GenerateErrorResult("","",0);
        }

        public static Result GenerateErrorResult(string title)
        {
            return GenerateErrorResult(title, "", 0);
        }

        public static Result GenerateErrorResult(string title, string message)
        {
            return GenerateErrorResult(title, message, 0);
        }

        public static Result GenerateErrorResult(string title, string message, long resultID)
        {
            ResultType rt = new ResultType();
            try
            {

                if (Config.DevelopmentMode == true)
                {
                    rt = ResultType.Failed_DevelopmentMode;
                }
                else
                {
                    rt = ResultType.Failed_ProductionMode;
                    message = "";
                }
            }
            catch
            {
                rt = ResultType.Failed_DevelopmentMode;
            }
            return new Result(0, rt, resultID, title, message);
        }
        #endregion

        #region Method: Generate Error Result based on Database, But First =>>>>>>>> VALIDATE DEV MODE <<<<<<<
        public static Result GetResultByID(long resultID)
        {
            return GetResultByID(resultID, 0);
        }

        public static Result GetResultByID(long resultID, long referenceID)
        {
            ResultMessage msg = db.ResultMessages.Find(resultID);
            string msgTxt = "";
            ResultType rt = new ResultType();
            if (msg.IsError == false)
            { rt = ResultType.Ok; }
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

            Result res = new Result(resultID, rt, referenceID, "", msg.Message);
            res = new Result(msg.ID, rt, referenceID, "", msg.Message);

            return res;
        }

        #endregion

        #region Method: Generate NotAuthorized Result

        public static Result GenerateNotAuthorizedResult(string title)
        {
            return GenerateNotAuthorizedResult(title, "", 0);
        }

        public static Result GenerateNotAuthorizedResult(string title, string message)
        {
            return GenerateNotAuthorizedResult(title, message, 0);
        }

        public static Result GenerateNotAuthorizedResult(string title, string message, long resultID)
        {
            return new Result(0, ResultType.NotAuthorized, resultID, title, message);
        }
        #endregion


    }
}
