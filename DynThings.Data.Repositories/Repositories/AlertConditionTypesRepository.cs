/////////////////////////////////////////////////////////////////
// Created by : Caesar Moussalli                               //
// TimeStamp  : 10-9-2016                                      //
// Content    : Handle AlertConditionTypes CRUD                //
// Notes      :                                                //
/////////////////////////////////////////////////////////////////

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DynThings.Data.Models;
using DynThings.Core;
using PagedList;

namespace DynThings.Data.Repositories
{
    public class AlertConditionTypesRepository
    {
        #region Constructor
        public AlertConditionTypesRepository(DynThingsEntities dbSource)
        {
            db = dbSource;
        }

        #endregion

        #region props
        public DynThingsEntities db;
        #endregion


        #region GetList
        public List<AlertConditionType> GetList()
        {
            List<AlertConditionType> types = db.AlertConditionTypes
                .OrderBy(c => c.Title).ToList();
            return types;
        }

        #endregion


    }
}
