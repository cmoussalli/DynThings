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
        #endregion

        //#region Get PagedList
        //public IPagedList GetPagedList(string search,int appID, int pageNumber, int recordsPerPage)
        //{
        //    IPagedList apps = db.Apps
        //      .Where(a => 
        //      (search == null || a.Title.Contains(search))
        //      && (appID == 0 || appID == null || appID == a.ID)
        //      && (a.)
        //      )
        //      .OrderBy(a => a.Title).ToList()
        //      .ToPagedList(pageNumber, recordsPerPage);
        //    return apps;
        //}
        //#endregion

        //#region Find
        //public AppThingExtension Find(long id)
        //{
        //    AppThingExtension appThingExtension = new AppThingExtension();
        //    List<AppThingExtension> appThingExtensions = db.AppThingExtensions
        //        //.Include("AppAPIEntitys").Include("AppStatuss")
        //        .Where(l => l.ID == id).ToList();
        //    if (appThingExtensions.Count == 1)
        //    {
        //        appThingExtension = appThingExtensions[0];
        //    }
        //    else
        //    {
        //        throw new Exception("Not Found");
        //    }
        //    return appThingExtension;
        //}

        //#endregion

        //#region Add
        //public ResultInfo.Result Add(string title,string code , Guid guid,Guid iconGuid,long appID,string userID)
        //{
        //    AppThingExtension appThingExtension = new AppThingExtension();
        //    //Save new app in database 
        //    try
        //    {
        //        appThingExtension.AppID = appID;
        //        appThingExtension.Title = title;
        //        appThingExtension.Code = code;
        //        appThingExtension.GUID = guid;
        //        appThingExtension.IconGUID = iconGuid;
        //        db.AppThingExtensions.Add(appThingExtension);
        //        db.SaveChanges();
        //        return ResultInfo.GenerateOKResult("Saved", appThingExtension.ID);
        //    }
        //    catch (Exception ex)
        //    {
        //        return ResultInfo.GenerateErrorResult("Error",ex.Message);
        //    }
        //}

        //#endregion

        //#region Edit
        //public ResultInfo.Result Edit(long id, string title, Guid iconGuid, string userID)
        //{
        //    try
        //    {
        //        AppThingExtension appThingExtension = db.AppThingExtensions.Find(id);
        //        appThingExtension.Title = title;
        //        appThingExtension.IconGUID = iconGuid;
        //        db.SaveChanges();
        //        return ResultInfo.GenerateOKResult("Saved", appThingExtension.ID);
        //    }
        //    catch
        //    {
        //        return ResultInfo.GetResultByID(1);
        //    }
        //}

        //#endregion

        //#region Delete
        //public ResultInfo.Result Delete(long id,string userID)
        //{
        //    try
        //    {
        //        AppThingExtension appThingExtension = db.AppThingExtensions.Find(id);
        //        db.AppThingExtensions.Remove(appThingExtension);
        //        db.SaveChanges();
        //        return ResultInfo.GenerateOKResult("Deleted", appThingExtension.ID);
        //    }
        //    catch
        //    {
        //        return ResultInfo.GetResultByID(1);
        //    }
        //}

        //#endregion



    }
}
