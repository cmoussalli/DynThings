using System;
using System.Collections.Generic;

namespace DynThings.WebAPI.Models
{
    #region Enums : Result Type
    public enum ResultType
    {
        Ok = 0,
        Failed = 10,
        Failed_DevelopmentMode = 11,
        Failed_ProductionMode = 12,
        NotAuthorized = 20,
        Info = 30,
        Unknown = 99
    }
    #endregion

    #region APIResponse
    public class ApiResponse
    {
        #region :: Public Properties ::
        public long ResultID { get; set; }
        public string Message { get; set; }
        public string Reference { get; set; }
        public ResultType ResultType { get; set; }




        public int StatusID { get { return ResultType.GetHashCode(); } }
        public string StatusTitle { get { return ResultType.ToString(); } }
        #endregion

        #region :: Constructor ::
        public ApiResponse()
        {
            this.ResultID = 0;
            this.ResultType = ResultType.Unknown;
            this.Message = "";
            this.Reference ="";
        }
        #endregion

    }
    #endregion



}