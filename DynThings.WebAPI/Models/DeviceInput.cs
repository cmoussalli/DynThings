/////////////////////////////////////////////////////////////////
// Created by : Arshad Ashraf                                   //
// TimeStamp  : 03-02-2016                                      //
// Content    :  Device Properties                              //
// Notes      :                                                 //
/////////////////////////////////////////////////////////////////
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DynThings.WebAPI.Models
{
    public class DeviceInput
    {
        #region :: Public Properties ::

        public string KeyPass { get; set; }

        public decimal Value { get; set; }

        public string ExectionTimeStamp { get; set; }

        #endregion

        #region :: Constructor ::
        public DeviceInput()
        {
            this.KeyPass = string.Empty;
            this.ExectionTimeStamp = string.Empty;
            this.Value = -99;
        } 
        #endregion
    }
}