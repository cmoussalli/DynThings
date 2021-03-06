﻿/////////////////////////////////////////////////////////////////
// Created by : Caesar Moussalli                               //
// TimeStamp  : 28-3-2016                                      //
// Content    : Handle IO Types CRUD                           //
// Notes      :                                                //
/////////////////////////////////////////////////////////////////
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DynThings.Data.Models;
using PagedList;

namespace DynThings.Data.Repositories
{
    public class IOTypesRepository
    {
        #region Constructor
        public IOTypesRepository(DynThingsEntities dbSource)
        {
            db = dbSource;
        }

        #endregion

        #region props
        public DynThingsEntities db;
        #endregion


        public List<IOType> GetList(bool EnableUnspecified)
        {
            List<IOType> iotyps = db.IOTypes.ToList();
            return iotyps;
        }

    }
}
