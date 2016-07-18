/////////////////////////////////////////////////////////////////
// Created by : Caesar Moussalli                               //
// TimeStamp  : 26-5-2016                                      //
// Content    : Associate Repositories to the Unit of Work     //
// Notes      : Send DB context to repositories to reduce DB   //
//              connectivity sessions count                    //
/////////////////////////////////////////////////////////////////
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DynThings.Data.Models;

namespace DynThings.Data.Reports
{
    public static class UnitOfWork_Reports
    {
        private static DynThingsEntities dynDB = new DynThingsEntities();


        #region Reports
        public static EndpointsReport rptEndpoints = new EndpointsReport(dynDB);
        public static ThingsReport rptThings = new ThingsReport(dynDB);


        #endregion




    }
}
