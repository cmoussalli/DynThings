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
    public class DeviceEntitiy
    {
        #region :: Public Properties ::

        public string KeyPass { get; set; }

        public decimal Value { get; set; }

        public string ExectionTimeStamp { get; set; }

        List<CommandEnitity> DeviceCommands { get; set; }

        #endregion

        #region :: Constructor ::
        public DeviceEntitiy()
        {
            this.KeyPass = string.Empty;
            this.ExectionTimeStamp = string.Empty;
            this.Value = -99;
            this.DeviceCommands = new List<CommandEnitity>();
        } 
        #endregion
    }
}