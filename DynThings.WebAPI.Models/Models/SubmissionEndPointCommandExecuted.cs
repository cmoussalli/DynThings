/////////////////////////////////////////////////////////////////
// Created by :  Caesar Moussalli                              //
// TimeStamp  :  18-04-2017                                    //
// Content    :  EndPoint Command IO Properties                //
// Notes      :                                                //
/////////////////////////////////////////////////////////////////
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DynThings.Data.Repositories;

namespace DynThings.WebAPI.Models
{
    public class SubmissionEndPointCommandExecuted
    {
        #region :: Public Properties ::

        public long EndPointCommandIOID { get; set; }

        public DateTime? ExectionTimeStamp { get; set; }

        #endregion

        #region :: Constructor ::
        public SubmissionEndPointCommandExecuted()
        {
            this.ExectionTimeStamp = null;
            this.EndPointCommandIOID = 0;
        } 
        #endregion
    }
}