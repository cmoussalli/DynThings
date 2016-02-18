using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DynThings.Data.Repositories
{
    public class ResultInfo
    {
        #region Enums
        public enum ResultType
        {
            Ok = 1,
            Failed = 2
        }

        public class Result
        {
            public Result(ResultType resultType, string message)
            {
                ResultType = resultType;
                Message = message;
            }
            public ResultType ResultType { get; set; }
            public string Message { get; set; }
        }

        public static Result GenerateOKResult()
        {
            return new Result(ResultType.Ok, "");
        }

        public static Result GenerateFailedResult(string message)
        {
            return new Result(ResultType.Failed, message);
        }

        #endregion



    }
}
