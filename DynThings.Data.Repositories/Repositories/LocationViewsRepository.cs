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

namespace DynThings.Data.Repositories
{
    public class LocationViewsRepository
    {
        private DynThingsEntities db;
        #region Constructor
        public LocationViewsRepository(DynThingsEntities dbContext)
        {
            db = dbContext;
        }
        #endregion

        /// <summary>
        /// Get All Location Views
        /// </summary>
        /// <returns>List of LocationViews</returns>
        public List<LocationView> GetAll()
        {
            List<LocationView> locViews = db.LocationViews.ToList();
            return locViews;
        }

        /// <summary>
        /// Find LocationView by LocationView ID
        /// </summary>
        /// <param name="ID">LocationView ID</param>
        /// <returns>LocationView object</returns>
        public LocationView Find(long ID)
        {
            LocationView locView = new LocationView();
            List<LocationView> locViews = db.LocationViews.Where(v => v.ID == ID).ToList();
            if (locViews.Count == 1)
            {
                locView = locViews[0];
            }else
            {
                throw new  Exception("Not Found");
            }
            return locView;
        }
    }
}
