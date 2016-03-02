/////////////////////////////////////////////////////////////////
// Created by : Arshad Ashraf                                   //
// TimeStamp  : 03-02-2016                                      //
// Content    : Handle Api Responses                            //
// Notes      :                                                 //
/////////////////////////////////////////////////////////////////
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Runtime.Serialization;
using System.Web;

namespace DynThings.WebAPI.Models
{
    [DataContract]
    public class ApiResponse
    {
        #region :: Public Properites ::
        [DataMember]
        public bool Success { get; set; }

        [DataMember]
        public string ErrorMessage { get; set; }

        #endregion

        #region :: Constructor ::
        public ApiResponse()
        {
            this.Success = false;
            this.ErrorMessage = string.Empty;
        } 
        #endregion

    }
}