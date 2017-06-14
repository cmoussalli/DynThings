using DynThings.Data.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Runtime.Serialization;
using System.Web;

namespace DynThings.WebAPI.Models
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
        public long ResultID { get; set; }
        public long StatusID { get; set; }
        public string StatusTitle { get; set; }
        public string Message { get; set; }
        public long Reference { get; set; }

        #endregion

        #region :: Constructor ::
        public ApiResponse()
        {
            this.ResultID = 99;
            this.StatusID = 0;
            this.StatusTitle = "";
            this.Message = "";
            this.Reference = 0;
        }
        #endregion

    }
    #endregion



}