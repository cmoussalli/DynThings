using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DynThings.Core;
using DynThings.Data.Models;
using DynThings.WebAPI.Models;
using ResultInfo;

namespace DynThings.WebAPI.TypesMapper
{
    public static  class ApiResponseAdapter
    {
        public static ApiResponse fromResult(Result sourceResult)
        {
            ApiResponse result = new ApiResponse();
            result.ResultID = sourceResult.ResultID;
            result.Message = sourceResult.Title + ": " + sourceResult.Message;
            result.Reference = sourceResult.Reference;
            switch (sourceResult.ResultType)
            {
                case Result.Result_Type.Ok:
                    result.ResultType = ResultType.Ok;
                    break;
                case Result.Result_Type.Failed:
                    result.ResultType = ResultType.Failed;
                    break;
                case Result.Result_Type.Failed_DevelopmentMode:
                    result.ResultType = ResultType.Failed_DevelopmentMode;
                    break;
                case Result.Result_Type.Failed_ProductionMode:
                    result.ResultType = ResultType.Failed_ProductionMode;
                    break;
                case Result.Result_Type.Info:
                    result.ResultType = ResultType.Info;
                    break;
                case Result.Result_Type.NotAuthorized:
                    result.ResultType = ResultType.NotAuthorized;
                    break;
                default:
                    result.ResultType = ResultType.Unknown;
                    break;
            }

            return result;
        }
    }

}
