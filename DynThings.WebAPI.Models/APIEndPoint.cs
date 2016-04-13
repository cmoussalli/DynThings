/////////////////////////////////////////////////////////////////
// Created by : Caesar Moussalli                                //
// TimeStamp  : 07-04-2016                                      //
// Content    :  APIEndPoint Properties                         //
// Notes      :                                                 //
/////////////////////////////////////////////////////////////////
using DynThings.Data.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Runtime.Serialization;
using System.Web;
using DynThings.Data.Models;

namespace DynThings.WebAPI.Models
{
    public class APIEndPoint
    {
        #region :: Public Properties ::
        public long ID { get; set; }
        public System.Guid GUID { get; set; }
        public System.Guid KeyPass { get; set; }
        public string PinCode { get; set; }
        public string Title { get; set; }
        public long DeviceID { get; set; }
        public long TypeID { get; set; }
        #endregion

        #region :: Constructor ::
        public APIEndPoint()
        {
            this.ID = 0;
            //this.Guid = Guid.Empty;
            this.KeyPass = Guid.Empty;
            this.PinCode = "";
            this.Title = "";
            this.DeviceID = 0;
            this.TypeID = 0;
        }
        #endregion
    }
   

}