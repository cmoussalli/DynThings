﻿/////////////////////////////////////////////////////////////////
// Created by : Caesar Moussalli                                //
// TimeStamp  : 07-05-2017                                      //
// Content    :  APIEndPointType Properties                     //
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
    public class APIEndPointType
    {
        #region :: Public Properties ::
        public long ID { get; set; }
        public string Title { get; set; }
        public string measurement { get; set; }
        public APIEndPointTypeCategory EndPointTypeCategory { get; set; }
        public Nullable<long> IconID { get; set; }


        #endregion

        #region :: Constructor ::
        public APIEndPointType()
        {
            this.ID = 0;
            this.Title = "";
            this.measurement = "";
            this.EndPointTypeCategory = new APIEndPointTypeCategory();
            this.IconID = 0;
        }
        #endregion
    }
   

}