using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DynThings.Core;
using DynThings.Data.Models;
using PagedList;

namespace DynThings.Data.Repositories
{
    public class AppThingCategorysRepository
    {
        #region Constructor
        public AppThingCategorysRepository(DynThingsEntities dbSource)
        {
            db = dbSource;
        }

        #endregion

        #region props
        public DynThingsEntities db;
        #endregion


        #region GetList
        public List<AppThingCategory> GetList()
        {
            List<AppThingCategory> appThingCategorys = db.AppThingCategorys.ToList();
            return appThingCategorys;
        }
        public List<AppThingCategory> GetList(long appId)
        {
            List<AppThingCategory> appThingCategorys = db.AppThingCategorys
                .Where(c => c.AppID == appId).ToList();
            return appThingCategorys;
        }
        #endregion

        #region Get PagedList
        public IPagedList GetPagedList(string search,long appID, int pageNumber, int recordsPerPage)
        {
            IPagedList appThingTypes = db.AppThingCategorys
               .Where(e => search == null || (e.Title.Contains(search) || e.Code.Contains(search))
               && e.AppID == appID)

               .OrderBy(e => e.Title).ToList()
               .ToPagedList(pageNumber, recordsPerPage);
            return appThingTypes;
        }
        #endregion

        #region Find
        public AppThingCategory Find(long id)
        {
            AppThingCategory appThingCategory = new AppThingCategory();
            List<AppThingCategory> appThingCategorys = db.AppThingCategorys
                //.Include("AppAPIEntitys").Include("AppStatuss")
                .Where(l => l.ID == id).ToList();
            if (appThingCategorys.Count == 1)
            {
                appThingCategory = appThingCategorys[0];
            }
            else
            {
                throw new Exception("Not Found");
            }
            return appThingCategory;
        }

        #endregion

        #region Add
        public ResultInfo.Result Add(string title,string code , Guid guid,Guid iconGuid,long appID,string userID)
        {
            AppThingCategory appThingCategory = new AppThingCategory();
            //Save new app in database 
            try
            {
                appThingCategory.AppID = appID;
                appThingCategory.Title = title;
                appThingCategory.Code = code;
                appThingCategory.GUID = guid;
                appThingCategory.IconGUID = iconGuid;
                db.AppThingCategorys.Add(appThingCategory);
                db.SaveChanges();
                return ResultInfo.GenerateOKResult("Saved", appThingCategory.ID);
            }
            catch (Exception ex)
            {
                return ResultInfo.GenerateErrorResult("Error",ex.Message);
            }
        }

        #endregion

        #region Edit
        public ResultInfo.Result Edit(long id, string title, Guid iconGuid, string userID)
        {
            try
            {
                AppThingCategory appThingCategory = db.AppThingCategorys.Find(id);
                appThingCategory.Title = title;
                appThingCategory.IconGUID = iconGuid;
                db.SaveChanges();
                return ResultInfo.GenerateOKResult("Saved", appThingCategory.ID);
            }
            catch
            {
                return ResultInfo.GetResultByID(1);
            }
        }

        #endregion

        #region Delete
        public ResultInfo.Result Delete(long id,string userID)
        {
            try
            {
                AppThingCategory appThingCategory = db.AppThingCategorys.Find(id);
                db.AppThingCategorys.Remove(appThingCategory);
                db.SaveChanges();
                return ResultInfo.GenerateOKResult("Deleted", appThingCategory.ID);
            }
            catch
            {
                return ResultInfo.GetResultByID(1);
            }
        }

        #endregion


    }
}
