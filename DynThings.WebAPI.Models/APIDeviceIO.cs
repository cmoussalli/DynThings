/////////////////////////////////////////////////////////////////
// Created by : Caesar Moussalli                                //
// TimeStamp  : 13-04-2016                                      //
// Content    : APIDeviceIO Properties                          //
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
    public class APIDeviceIO
    {
        #region :: Public Properties ::

        public long ID { get; set; }
        public long DeviceID { get; set; }
        public long IOTypeID { get; set; }
        public string Valu { get; set; }
        public System.DateTime TimeStamp { get; set; }
        public Nullable<System.DateTime> ExecTimeStamp { get; set; }
        public Nullable<System.DateTime> ScheduleTimeStamp { get; set; }

        #endregion

        #region :: Constructor ::
        public APIDeviceIO()
        {
            this.ID = 0;
            this.DeviceID = 0;
            this.IOTypeID = 0;
            this.Valu = "";
          

        }
        #endregion
    }

}