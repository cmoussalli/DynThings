using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DynThings.Data.Models;

namespace DynThings.Data.Repositories
{
    public  class ResultInfo
    {
        private DynThingsEntities db = new DynThingsEntities();

        #region Enums
        public enum ResultType
        {
            Ok = 0,
            Failed = 1
        }
        #endregion

        public class Result
        {
            internal Result(long resultID, ResultType resultType, string message)
            {
                ResultID = resultID;
                ResultType = resultType;
                Message = message;
            }
            public long ResultID { get; set; }
            public ResultType ResultType { get; set; }
            public string Message { get; set; }
        }

        public  Result GenerateOKResult()
        {
            return new Result(0,ResultType.Ok, "");
        }

        public  Result GetResultByID(long resultID)
        {
            ResultMessage msg = db.ResultMessages.Find(resultID);
            ResultType rt = new ResultType();
            if (msg.IsError == false)
            { rt = ResultType.Ok;}
            else
            { rt = ResultType.Failed; }
            Result res = new Result(msg.ID, rt, msg.Message);
            return res;
        }

        



    }
}
