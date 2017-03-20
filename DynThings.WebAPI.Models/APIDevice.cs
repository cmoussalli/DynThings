////////////////////////////////////////////////////////////////
// Created by : Caesar Moussalli                              //
// TimeStamp  : 07-04-2016                                    //
// Content    :  APIDevice Properties                         //
// Notes      :                                               //
////////////////////////////////////////////////////////////////
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
    public class APIDevice
    {
        #region :: Public Properties ::

        public long ID { get; set; }
        public Guid Guid { get; set; }
        public Guid KeyPass { get; set; }
        public string PinCode { get; set; }
        public string Title { get; set; }
        public long StatusID { get; set; }
        public APIDeviceStatus APIDeviceStatus { get; set; }
        public int UTC_Diff { get; set; }
        public int IsConnectedDelay { get; set; }
        public bool IsConnected { get; set; }
        public Nullable<System.DateTime> LastConnectionTimeStamp { get; set; }


        public List<APIDeviceCommand> APIDeviceCommands { get; set; }
        public List<APIEndPoint> APIEndPoints { get; set; }

        #endregion

        #region :: Constructor ::
        public APIDevice()
        {
            this.ID = 0;
            this.Guid = Guid.Empty;
            this.KeyPass = Guid.Empty;
            this.PinCode = "";
            this.Title = "";
            this.StatusID = 1;
            this.APIDeviceStatus = new APIDeviceStatus();
            this.UTC_Diff = 0;
            this.IsConnectedDelay = 0;
            this.IsConnected = false;
            this.APIDeviceCommands = new List<APIDeviceCommand>();
            this.APIEndPoints = new List<APIEndPoint>();
        }
        #endregion
    }

   

}