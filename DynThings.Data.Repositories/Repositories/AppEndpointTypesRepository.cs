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
    public class AppEndpointTypesRepository
    {
        #region Constructor
        public AppEndpointTypesRepository(DynThingsEntities dbSource)
        {
            db = dbSource;
        }

        #endregion

        #region props
        public DynThingsEntities db;
        #endregion


        #region GetList
        public List<AppEndpointType> GetList()
        {
            List<AppEndpointType> AppEndpointTypes = db.AppEndpointTypes.ToList();
            return AppEndpointTypes;
        }
        public List<AppEndpointType> GetList(long appId)
        {
            List<AppEndpointType> AppEndpointTypes = db.AppEndpointTypes
                .Where(c => c.AppID == appId).ToList();
            return AppEndpointTypes;
        }
        #endregion

        #region Get PagedList
        public IPagedList GetPagedList(string search,long appID, int pageNumber, int recordsPerPage)
        {
            IPagedList appEndpointTypes = db.AppEndpointTypes
              .Where(e => search == null || (e.Title.Contains(search) || e.Code.Contains(search))
              && e.AppID == appID)

              .OrderBy(e => e.Title).ToList()
              .ToPagedList(pageNumber, recordsPerPage);
            return appEndpointTypes;
        }
        #endregion

        #region Find
        public AppEndpointType Find(long id)
        {
            AppEndpointType AppEndpointType = new AppEndpointType();
            List<AppEndpointType> AppEndpointTypes = db.AppEndpointTypes
                //.Include("AppAPIEntitys").Include("AppStatuss")
                .Where(l => l.ID == id).ToList();
            if (AppEndpointTypes.Count == 1)
            {
                AppEndpointType = AppEndpointTypes[0];
            }
            else
            {
                throw new Exception("Not Found");
            }
            return AppEndpointType;
        }

        #endregion

        #region Add
        public ResultInfo.Result Add(string title,string code , Guid guid,Guid iconGuid,string measurement,long typeCategoryID, long appID,string userID)
        {
            AppEndpointType AppEndpointType = new AppEndpointType();
            //Save new app in database 
            try
            {
                AppEndpointType.AppID = appID;
                AppEndpointType.Title = title;
                AppEndpointType.Code = code;
                AppEndpointType.GUID = guid;
                AppEndpointType.IconGUID = iconGuid;
                AppEndpointType.Measurement = measurement;
                AppEndpointType.TypeCategoryID = typeCategoryID;
                db.AppEndpointTypes.Add(AppEndpointType);
                db.SaveChanges();
                return Result.GenerateOKResult("Saved", AppEndpointType.ID.ToString());
            }
            catch (Exception ex)
            {
                return Result.GenerateFailedResult("Error",ex.Message);
            }
        }

        #endregion

        #region Edit
        public ResultInfo.Result Edit(long id, string title, Guid iconGuid, string measurement, long typeCategoryID, string userID)
        {
            try
            {
                AppEndpointType AppEndpointType = db.AppEndpointTypes.Find(id);
                AppEndpointType.Title = title;
                AppEndpointType.IconGUID = iconGuid;
                AppEndpointType.Measurement = measurement;
                AppEndpointType.TypeCategoryID = typeCategoryID;
                db.SaveChanges();
                return Result.GenerateOKResult("Saved", AppEndpointType.ID.ToString());
            }
            catch
            {
                return Result.GenerateFailedResult();
            }
        }

        #endregion

        #region Delete
        public ResultInfo.Result Delete(long id,string userID)
        {
            try
            {
                AppEndpointType AppEndpointType = db.AppEndpointTypes.Find(id);
                db.AppEndpointTypes.Remove(AppEndpointType);
                db.SaveChanges();
                return Result.GenerateOKResult("Deleted", AppEndpointType.ID.ToString());
            }
            catch
            {
                return Result.GenerateFailedResult();
            }
        }

        #endregion



    }
}
