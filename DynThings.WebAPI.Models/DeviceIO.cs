/////////////////////////////////////////////////////////////////
// Created by : Arshad Ashraf                                   //
// TimeStamp  : 03-02-2016                                      //
// Content    :  Device IO Properties                           //
// Notes      :                                                 //
/////////////////////////////////////////////////////////////////
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DynThings.WebAPI.Models
{
    public class DeviceIO
    {
        #region :: Public Properties ::

        public string KeyPass { get; set; }

        public decimal Value { get; set; }

        public string ExectionTimeStamp { get; set; }

        #endregion

        #region :: Constructor ::
        public DeviceIO()
        {
            this.KeyPass = string.Empty;
            this.ExectionTimeStamp = string.Empty;
            this.Value = -99;
        } 
        #endregion
    }
}