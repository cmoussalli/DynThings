/////////////////////////////////////////////////////////////////
// Created by : Caesar Moussalli                                //
// TimeStamp  : 13-04-2016                                      //
// Content    :  APIDevice Command Properties                   //
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
    public class APIDeviceCommand
    {
        #region :: Public Properties ::
        public long ID { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public Nullable<long> DeviceID { get; set; }
        public string CommandCode { get; set; }
        public string OwnerID { get; set; }


        #endregion

        //#region :: Constructor ::
        //public APIDevice()
        //{
        //    this.ID = 0;
        //    this.Guid = Guid.Empty;
        //    this.KeyPass = Guid.Empty;
        //    this.PinCode = "";
        //    this.Title = "";
        //    this.StatusID = 1;

        //}
        //#endregion
    }

}