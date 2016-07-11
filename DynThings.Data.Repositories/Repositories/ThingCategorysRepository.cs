/////////////////////////////////////////////////////////////////
// Created by : Caesar Moussalli                               //
// TimeStamp  : 10-2-2016                                      //
// Content    : Handle ThingCategorys CRUD                           //
// Notes      :                                                //
/////////////////////////////////////////////////////////////////

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DynThings.Data.Models;
using DynThings.Core;

namespace DynThings.Data.Repositories
{
    public class ThingCategorysRepository
    {
        #region Constructor
        public DynThingsEntities db { get; set; }
        public ThingCategorysRepository(DynThingsEntities dynThingsEntities)
        {
            db = dynThingsEntities;
        }
        #endregion


        #region GetList
        /// <summary>
        /// Get All Endpoint Types list
        /// </summary>
        /// <returns>List of Endpoint Types</returns>
        public List<ThingCategory> GetList()
        {
            List<ThingCategory> types = db.ThingCategorys.ToList();
            return types;
        }

        #endregion

        #region Find
        /// <summary>
        /// Find Endpoint Type by EndPoint Type ID
        /// </summary>
        /// <param name="id">EndPoint Type ID</param>
        /// <returns>Endpoint object</returns>
        public ThingCategory Find(long id)
        {
            ThingCategory epType = new ThingCategory();
            List<ThingCategory> epTypes = db.ThingCategorys.Where(l => l.ID == id).ToList();
            if (epTypes.Count == 1)
            {
                epType = epTypes[0];
            }
            else
            {
                throw new Exception("Not Found");
            }
            return epType;
        }

        #endregion

        #region Create
        public ResultInfo.Result Add(string Title, string measurment, long TypeCategoryID, long IconID)
        {
            try
            {
                ThingCategory cat = new ThingCategory();
                cat.Title = Title;
                db.ThingCategorys.Add(cat);
                db.SaveChanges();
                return ResultInfo.GenerateOKResult("Saved", cat.ID);
            }
            catch
            {
                return ResultInfo.GetResultByID(1);
            }
        }

        #endregion
    }
}
