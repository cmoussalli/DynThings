/////////////////////////////////////////////////////////////////
// Created by : Caesar Moussalli                                //
// TimeStamp  : 14-05-2017                                      //
// Content    :  APILocationViewType Properties                 //
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
    public class APILocationViewType
    {
        #region :: Public Properties ::
        public Nullable<long> ID { get; set; }
        public string Title { get; set; }

        #endregion

        #region :: Constructor ::
        public APILocationViewType()
        {
            this.ID = 0;
            this.Title = "";
        }
        #endregion
    }
   

}