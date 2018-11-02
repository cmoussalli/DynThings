using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DynThings.Core;
using DynThings.Data.Models;
using PagedList;
using ResultInfo;

namespace DynThings.Data.Repositories
{
    public class AppThingExtensionsRepository
    {
        #region Constructor
        public AppThingExtensionsRepository(DynThingsEntities dbSource)
        {
            db = dbSource;
        }

        #endregion

        #region props
        public DynThingsEntities db;
        #endregion


        #region GetList
        public List<AppThingExtension> GetList()
        {
            List<AppThingExtension> appThingExtensions = db.AppThingExtensions.ToList();
            return appThingExtensions;
        }
        public List<AppThingExtension> GetList(long appId)
        {
            List<AppThingExtension> appThingExtensions = db.AppThingExtensions.Where
                (
                    e => e.AppID == appId
                ).ToList();
            return appThingExtensions;
        }
        #endregion

        #region Get PagedList
        public IPagedList GetPagedList(string search, long appID, int pageNumber, int recordsPerPage)
        {
            IPagedList appThingExtensions = db.AppThingExtensions
              .Where(e =>
              (search == null || search == "" || e.Title.Contains(search))
              && (appID == 0 || appID == null || appID == e.AppID)
              )
              .OrderBy(e => e.Title).ToList()
              .ToPagedList(pageNumber, recordsPerPage);
            return appThingExtensions;
        }
        #endregion

        #region Find
        public AppThingExtension Find(long id)
        {
            AppThingExtension appThingExtension = new AppThingExtension();
            List<AppThingExtension> appThingExtensions = db.AppThingExtensions
                //.Include("AppAPIEntitys").Include("AppStatuss")
                .Where(l => l.ID == id).ToList();
            if (appThingExtensions.Count == 1)
            {
                appThingExtension = appThingExtensions[0];
            }
            else
            {
                throw new Exception("Not Found");
            }
            return appThingExtension;
        }

        #endregion

        #region Add
        public ResultInfo.Result Add(Guid guid, string code, string title, string thingCategoryCode, int dataTypeId, bool isList, long appID, string userID)
        {
            AppThingExtension appThingExtension = new AppThingExtension();
            //Save new app in database 
            try
            {
                appThingExtension.GUID = guid;
                appThingExtension.Code = code;
                appThingExtension.AppID = appID;
                appThingExtension.AppThingCategoryCode = thingCategoryCode;
                appThingExtension.Title = title;
                appThingExtension.DataTypeID = dataTypeId;
                appThingExtension.IsList = isList;
                db.AppThingExtensions.Add(appThingExtension);
                db.SaveChanges();
                return Result.GenerateOKResult("Saved", appThingExtension.ID.ToString());
            }
            catch (Exception ex)
            {
                return Result.GenerateFailedResult("Error", ex.Message);
            }
        }

        #endregion

        #region Edit
        public ResultInfo.Result Edit(long id, string title, int dataTypeId, bool isList, string userID)
        {
            try
            {
                AppThingExtension appThingExtension = db.AppThingExtensions.Find(id);
                appThingExtension.Title = title;
                appThingExtension.DataTypeID = dataTypeId;
                appThingExtension.IsList = isList;
                db.SaveChanges();
                return Result.GenerateOKResult("Saved", appThingExtension.ID.ToString());
            }
            catch
            {
                return Result.GenerateFailedResult();
            }
        }


        #endregion

        #region Delete
        public ResultInfo.Result Delete(long id, string userID)
        {
            try
            {
                AppThingExtension appThingExtension = db.AppThingExtensions.Find(id);
                db.AppThingExtensions.Remove(appThingExtension);
                db.SaveChanges();
                return Result.GenerateOKResult("Deleted", appThingExtension.ID.ToString());
            }
            catch
            {
                return Result.GenerateFailedResult();
            }
        }

        #endregion


    }
}
