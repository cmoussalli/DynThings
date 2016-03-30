using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DynThings.Data.Models;

namespace DynThings.Data.Repositories
{
    public class ResultInfo
    {
        private DynThingsEntities db = new DynThingsEntities();

        #region Enums
        public enum ResultType
        {
            Ok = 0,
            Failed = 1
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
        public Result GenerateOKResult()
        {
            return new Result(0,ResultType.Ok, "",0);
        }
        public Result GenerateOKResult(string message, long referenceID)
        {
            return new Result(0, ResultType.Ok, message,referenceID);
        }
        public Result GenerateOKResult(string message)
        {
            return new Result(0, ResultType.Ok, message, 0);
        }
        public Result GenerateOKResult(long referenceID)
        {
            return new Result(0, ResultType.Ok, "", referenceID);
        }

        #endregion

        #region Method: Generate Error Result based on Database
        public Result GetResultByID(long resultID)
        {
            ResultMessage msg = db.ResultMessages.Find(resultID);
            ResultType rt = new ResultType();
            if (msg.IsError == false)
            { rt = ResultType.Ok;}
            else
            { rt = ResultType.Failed; }
            Result res = new Result(msg.ID, rt, msg.Message,0);
            return res;
        }

        #endregion



    }
}
