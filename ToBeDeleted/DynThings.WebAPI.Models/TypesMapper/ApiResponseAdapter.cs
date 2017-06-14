using DynThings.Core;
using DynThings.Data.Models;
using DynThings.Data.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DynThings.WebAPI.Models.TypesMapper
{
    public static  class ApiResponseAdapter
    {
        public static ApiResponse fromResult(ResultInfo.Result sourceResult)
        {
            ApiResponse result = new ApiResponse();
            result.resultID = sourceResult.ResultID;
            result.Message = sourceResult.Message;
            result.Reference = sourceResult.Reference;

            if (sourceResult.ResultType.GetHashCode().ToString() == "0")
            {
                result.Status = "OK";
            }
            else
            {
                result.Status = "Error";
            }
            return result;
        }
    }

}
