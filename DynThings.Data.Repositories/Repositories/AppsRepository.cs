﻿using System;
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

        public App Find(Guid guid)
        {
            App app = new App();
            List<App> apps = db.Apps.Include("AppAPIEntitys").Include("AppStatuss").Where(l => l.GUID == guid).ToList();
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
        public ResultInfo.Result Add(string title, string description, string createdBy)
        {
            App app = new App();
            //Validate UserID
            List<AspNetUser> usrs = db.AspNetUsers.Where(u => u.Id == createdBy).ToList();
            if (usrs.Count != 1)
            {
                return Result.GenerateFailedResult();
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
                app.Version = 1;
                db.Apps.Add(app);
                db.SaveChanges();
                return Result.GenerateOKResult("Saved", app.ID.ToString());
            }
            catch (Exception ex)
            {
                return Result.GenerateFailedResult("Error", ex.Message);
            }
        }

        #endregion

        #region Edit
        public ResultInfo.Result EditMain(long id, string title, string description)
        {
            try
            {
                App app = db.Apps.Find(id);
                app.Title = title;
                app.Description = description;
                db.SaveChanges();
                return Result.GenerateOKResult("Saved", app.ID.ToString());
            }
            catch
            {
                return Result.GenerateFailedResult();
            }
        }

        public ResultInfo.Result EditMain(long id, string title, string description, int statusID, double version, bool isStoreApp, string developedByName, DateTime storeAppLastUpdate)
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
                return Result.GenerateOKResult("Saved", app.ID.ToString());
            }
            catch
            {
                return Result.GenerateFailedResult();
            }
        }

        #endregion

        #region Delete
        public ResultInfo.Result Delete(long id)
        {
            try
            {
                db.AppDelete(id);
                return Result.GenerateOKResult("Deleted", id.ToString());
            }
            catch
            {
                return Result.GenerateFailedResult();
            }
        }

        #endregion

        #region Publish
        public ResultInfo.Result Publish(long id)
        {
            db.PublishApp(id);
            return Result.GenerateOKResult("Published", id.ToString());
        }

        #endregion

        #region UnPublish
        public ResultInfo.Result UnPublish(long id)
        {
            db.UnPublishApp(id);
            return Result.GenerateOKResult("UnPublished", id.ToString());

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
                    return Result.GenerateFailedResult();
                }

                //Add Link to Database
                AppAPIEntity lnk = new AppAPIEntity();
                lnk.AppID = appID;
                lnk.SystemEntityID = EntityID;
                db.AppAPIEntitys.Add(lnk);
                db.SaveChanges();
                return Result.GenerateOKResult("Saved");
            }
            catch (Exception ex)
            {
                return Result.GenerateFailedResult(ex.Message);
            }
        }
        #endregion
        #region DeAttach AppAPIEntity
        public ResultInfo.Result DeAttachAppAPIEntity(long appID, long systemEntityID)
        {
            try
            {
                List<AppAPIEntity> lnks = db.AppAPIEntitys.Where(l => l.AppID == appID && l.SystemEntityID == systemEntityID).ToList();
                if (lnks.Count == 0)
                {
                    return Result.GenerateFailedResult();
                }
                db.AppAPIEntitys.Remove(lnks[0]);
                db.SaveChanges();
                return Result.GenerateOKResult("Saved");
            }
            catch
            {
                return Result.GenerateFailedResult();
            }
        }
        #endregion









    }
}
