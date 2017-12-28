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
    public class DynThingsAppsRepository
    {
        #region Constructor
        public DynThingsAppsRepository(DynThingsEntities dbSource)
        {
            db = dbSource;
        }

        #endregion

        #region props
        public DynThingsEntities db;
        #endregion


        #region GetList
        public List<App> GetList()
        {
            List<App> ends = db.Apps.ToList();
            return ends;
        }
        #endregion

        #region Get PagedList
        public IPagedList GetPagedList(string search, int pageNumber, int recordsPerPage)
        {
            IPagedList apps = db.Apps
              .Where(e => search == null || e.Title.Contains(search))
              .OrderBy(e => e.Title).ToList()
              .ToPagedList(pageNumber, recordsPerPage);
            return apps;
        }
        #endregion

        #region Find
        public App Find(long id)
        {
            App app = new App();
            List<App> apps = db.Apps.Include("AppAPIEntitys").Include("AppStatuss").Where(l => l.ID == id).ToList();
            if (apps.Count == 1)
            {
                app = apps[0];
            }
            else
            {
                throw new Exception("Not Found");
            }
            return app;
        }

        #endregion

        #region Add
        public ResultInfo.Result Add(string title,string description , string createdBy )
        {
            App app = new App();
            //Validate UserID
            List<AspNetUser> usrs = db.AspNetUsers.Where(u => u.Id == createdBy).ToList();
            if (usrs.Count != 1)
            {
                return ResultInfo.GetResultByID(1);
            }
            //Save new app in database 
            try
            {
                app.GUID = Guid.NewGuid();
                app.Key = Guid.NewGuid();
                app.Title = title;
                app.Description = description;
                app.CreatedByID = createdBy;
                app.DevelopedByName = usrs[0].FullName;
                app.CreateDate = DateTime.Now;
                app.StatusID = 1;
                app.IsStoreApp = false;
                app.Version = 0;
                db.Apps.Add(app);
                db.SaveChanges();
                return ResultInfo.GenerateOKResult("Saved", app.ID);
            }
            catch (Exception ex)
            {
                return ResultInfo.GenerateErrorResult("Error",ex.Message);
            }
        }

        #endregion

        #region Edit
        public ResultInfo.Result EditMain(long id, string title, string description, int statusID,double version )
        {
            try
            {
                App app = db.Apps.Find(id);
                app.Title = title;
                app.Description = description;
                app.StatusID = statusID;
                app.Version = version;
                db.SaveChanges();
                return ResultInfo.GenerateOKResult("Saved", app.ID);
            }
            catch
            {
                return ResultInfo.GetResultByID(1);
            }
        }

        public ResultInfo.Result EditMain(long id, string title, string description, int statusID, double version,bool isStoreApp, string developedByName,DateTime storeAppLastUpdate )
        {
            try
            {
                App app = db.Apps.Find(id);
                app.Title = title;
                app.Description = description;
                app.StatusID = statusID;
                app.Version = version;
                app.IsStoreApp = isStoreApp;
                app.DevelopedByName = developedByName;
                app.StoreAppLastUpdate = storeAppLastUpdate;
                db.SaveChanges();
                return ResultInfo.GenerateOKResult("Saved", app.ID);
            }
            catch
            {
                return ResultInfo.GetResultByID(1);
            }
        }

        #endregion

        #region Delete
        public ResultInfo.Result Delete(long id)
        {
            try
            {
                App app = db.Apps.Find(id);
                db.Apps.Remove(app);
                db.SaveChanges();
                return ResultInfo.GenerateOKResult("Deleted", app.ID);
            }
            catch
            {
                return ResultInfo.GetResultByID(1);
            }
        }

        #endregion



        #region Attach AppAPIEntity
        public ResultInfo.Result AttachAppAPIEntity(long appID, long EntityID)
        {
            try
            {
                //validate if associate already exists
                List<AppAPIEntity> appAPIEntitys = db.AppAPIEntitys.Where(a => a.AppID == appID && a.SystemEntityID == EntityID).ToList();
                if (appAPIEntitys.Count > 0)
                {
                    return ResultInfo.GetResultByID(1);
                }

                //Add Link to Database
                AppAPIEntity lnk = new AppAPIEntity();
                lnk.AppID = appID;
                lnk.SystemEntityID = EntityID;
                db.AppAPIEntitys.Add(lnk);
                db.SaveChanges();
                return ResultInfo.GenerateOKResult("Saved");
            }
            catch (Exception ex)
            {
                return ResultInfo.GenerateErrorResult(ex.Message);
            }
        }
        #endregion
        #region DeAttach AppAPIEntity
        public ResultInfo.Result DeAttachAppAPIEntity(long appID, long systemEntityID)
        {
            try
            {
                List<AppAPIEntity> lnks = db.AppAPIEntitys.Where(l => l.AppID == appID && l.SystemEntityID == systemEntityID).ToList();
                if (lnks.Count ==0)
                {
                    return ResultInfo.GetResultByID(1);
                }
                db.AppAPIEntitys.Remove(lnks[0]);
                db.SaveChanges();
                return ResultInfo.GenerateOKResult("Saved");
            }
            catch
            {
                return ResultInfo.GetResultByID(1);
            }
        }
        #endregion


        #region Get AppThingTypes PagedList
        public IPagedList GetAppThingTypesPagedList(string search, long appID, int pageNumber, int recordsPerPage)
        {
            IPagedList appThingTypes = db.AppThingCategorys
              .Where(e => search == null || (e.Title.Contains(search) || e.Code.Contains(search))
              && e.AppID == appID)

              .OrderBy(e => e.Title).ToList()
              .ToPagedList(pageNumber, recordsPerPage);
            return appThingTypes;
        }
        #endregion


    }
}
