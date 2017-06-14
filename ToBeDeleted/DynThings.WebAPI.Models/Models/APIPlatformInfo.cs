/////////////////////////////////////////////////////////////////
// Created by : Caesar Moussalli                                //
// TimeStamp  : 22-08-2016                                      //
// Content    : Platform Main Info                              //
// Notes      :                                                 //
/////////////////////////////////////////////////////////////////
using DynThings.Data.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Runtime.Serialization;
using System.Web;

namespace DynThings.WebAPI.Models
{

    #region APIPlatformInfo
    public class APIPlatformInfo
    {
        #region :: Public Properites ::
        public string Title { get; set; }
        public bool DevMode { get; set; }

        #endregion

        #region :: Constructor ::
        public APIPlatformInfo()
        {
            this.Title = "";
            this.DevMode = false;
        }
        #endregion

    }
    #endregion


}