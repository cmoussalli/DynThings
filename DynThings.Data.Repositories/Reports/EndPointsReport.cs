/////////////////////////////////////////////////////////////////
// Created by : Caesar Moussalli                               //
// TimeStamp  : 31-1-2016                                      //
// Content    : Handle Endpoint CRUD                           //
// Notes      :                                                //
/////////////////////////////////////////////////////////////////
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DynThings.Data.Models;
using PagedList;

namespace DynThings.Data.Reports
{
    public class ReportsRepository
    {
        #region Constructor
        public DynThingsEntities db{ get; set; }
        public ReportsRepository(DynThingsEntities dynThingsEntities)
        {
            this.db = dynThingsEntities;
        }
        #endregion


        #region GetList
        public List<Endpoint> GetList(bool EnableUnspecified)
        {
            List<Endpoint> ends = new List<Endpoint>();
            if (EnableUnspecified == true)
            {
                Endpoint end0 = new Endpoint();
                end0.ID = 0;
                end0.Title = "-Select All-";
                ends.Add(end0);
                ends.AddRange(db.Endpoints.OrderBy(e => e.Title).ToList());
            }
            return ends;
        }
        public List<Endpoint> GetList()
        {
            List<Endpoint> ends = db.Endpoints.Include("EndPointCommands").ToList();
            return ends;
        }
        #endregion

      



    }
}
