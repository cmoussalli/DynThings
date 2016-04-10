/////////////////////////////////////////////////////////////////
// Created by : Caesar Moussalli                                //
// TimeStamp  : 05-04-2016                                      //
// Content    :  EndPoint IO Properties                         //
// Notes      :                                                 //
/////////////////////////////////////////////////////////////////
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DynThings.Data.Repositories;

namespace DynThings.WebAPI.Models
{
    public class EndPointIO
    {
        #region :: Public Properties ::

        public string KeyPass { get; set; }

        public decimal Value { get; set; }

        public string ExectionTimeStamp { get; set; }

        #endregion

        #region :: Constructor ::
        public EndPointIO()
        {
            this.KeyPass = string.Empty;
            this.ExectionTimeStamp = string.Empty;
            this.Value = -99;
        } 
        #endregion
    }
}