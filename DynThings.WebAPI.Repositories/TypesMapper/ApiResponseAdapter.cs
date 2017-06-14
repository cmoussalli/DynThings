using DynThings.Core;
using DynThings.Data.Models;
using DynThings.WebAPI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DynThings.WebAPI.TypesMapper
{
    public static  class ApiResponseAdapter
    {
        public static ApiResponse fromResult(ResultInfo.Result sourceResult)
        {
            ApiResponse result = new ApiResponse();
            result.ResultID = sourceResult.ResultID;
            result.Message = sourceResult.Message;
            result.Reference = sourceResult.Reference;
            result.StatusID = sourceResult.ResultType.GetHashCode();
            if (sourceResult.ResultType.GetHashCode().ToString() == "0")
            {
                result.StatusTitle = "OK";
            }
            else
            {
                result.StatusTitle = "Error";
            }
            return result;
        }
    }

}
