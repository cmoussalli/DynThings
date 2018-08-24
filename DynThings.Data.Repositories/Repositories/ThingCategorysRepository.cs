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
using PagedList;

namespace DynThings.Data.Repositories
{
    public class ThingCategorysRepository
    {
        #region Constructor
        public ThingCategorysRepository(DynThingsEntities dbSource)
        {
            db = dbSource;
        }

        #endregion

        #region props
        public DynThingsEntities db;
        #endregion

        #region Get PagedList
        public IPagedList GetPagedList(string search, int pageNumber, int recordsPerPage)
        {
            IPagedList cats = db.ThingCategorys
              .Where(e => e.ID > 0 && search == null || e.ID > 0 &&  e.Title.Contains(search))
              .OrderBy(e => e.Title).ToList()
              .ToPagedList(pageNumber, recordsPerPage);
            return cats;
        }
        #endregion

        #region GetList
        /// <summary>
        /// Get All Endpoint Types list
        /// </summary>
        /// <returns>List of Endpoint Types</returns>
        public List<ThingCategory> GetList()
        {
            List<ThingCategory> types = db.ThingCategorys.OrderBy(c => c.Title).ToList();
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
            List<ThingCategory> epTypes = db.ThingCategorys.Where(c => c.ID == id).OrderBy(c => c.Title).ToList();
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

        #region Add
        public ResultInfo.Result Add(string Title,long IconID)
        {
            try
            {
                ThingCategory cat = new ThingCategory();
                cat.Title = Title;
                cat.IconID = IconID;
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

        #region Edit
        public ResultInfo.Result Edit(long ID,string Title, long IconID)
        {
            try
            {
                ThingCategory cat = db.ThingCategorys.Find(ID);
                cat.Title = Title;
                cat.IconID = IconID;
                db.SaveChanges();
                return ResultInfo.GenerateOKResult("Saved", cat.ID);
            }
            catch
            {
                return ResultInfo.GetResultByID(1);
            }
        }

        #endregion

        #region Delete
        public ResultInfo.Result Delete(long ID)
        {
            try
            {
                //Check if the requested Category is used
                List<Thing> things = db.Things.Where(t => t.ThingCategory.ID == ID).ToList();
                if (things.Count() > 0)
                {// Used
                    return ResultInfo.GetResultByID(1);
                }

                //Execute Delete and return result
                ThingCategory cat = db.ThingCategorys.Find(ID);
                db.ThingExtensions.RemoveRange(cat.ThingExtensions);
                db.ThingCategorys.Remove(cat);
                db.SaveChanges();
                return ResultInfo.GenerateOKResult("Deleted", cat.ID);
            }
            catch
            {
                return ResultInfo.GetResultByID(1);
            }
        }

        #endregion


    }
}
