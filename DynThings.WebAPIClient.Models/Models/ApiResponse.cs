
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Runtime.Serialization;

namespace DynThings.WebAPIClient.Models
{
    #region Enums : Result Type
    public enum ResultType
    {
        Ok = 0,
        Failed = 1
    }
    #endregion

    #region APIResponse
    public class ApiResponse
    {
        #region :: Public Properites ::
        public long resultID { get; set; }
        public string Status { get; set; }
        public string Message { get; set; }
        public long Reference { get; set; }

        #endregion

        #region :: Constructor ::
        public ApiResponse()
        {
            this.resultID = 0;
            this.Status = "";
            this.Message = "";
            this.Reference = 0;
        }
        #endregion

    }
    #endregion



}