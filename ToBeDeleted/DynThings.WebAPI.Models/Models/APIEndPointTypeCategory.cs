/////////////////////////////////////////////////////////////////
// Created by : Caesar Moussalli                                //
// TimeStamp  : 07-05-2017                                      //
// Content    :  APIEndPointTypeCategory Properties             //
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
    public class APIEndPointTypeCategory
    {
        #region :: Public Properties ::
        public long ID { get; set; }
        public string Title { get; set; }

        #endregion

        #region :: Constructor ::
        public APIEndPointTypeCategory()
        {
            this.ID = 0;
            this.Title = "";
        }
        #endregion
    }
   

}