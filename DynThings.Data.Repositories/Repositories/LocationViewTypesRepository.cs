/////////////////////////////////////////////////////////////////
// Created by : Caesar Moussalli                               //
// TimeStamp  : 15-2-2016                                      //
// Content    : Handle LocationViewTypes CRUD                  //
// Notes      :                                                //
/////////////////////////////////////////////////////////////////
using DynThings.Core;
using DynThings.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DynThings.Data.Repositories
{
    public class LocationViewTypesRepository
    {
        #region Constructor
        public LocationViewTypesRepository(DynThingsEntities dbSource)
        {
            db = dbSource;
        }

        #endregion

        #region props
        public DynThingsEntities db;
        #endregion

        #region GetList
        /// <summary>
        /// Get list of LocationView Types
        /// </summary>
        /// <returns>List of LocationView Types </returns>
        public List<LocationViewType> GetList()
        {
            List<LocationViewType> locViewTypes = db.LocationViewTypes.ToList();
            return locViewTypes;
        }
        #endregion


    }
}
