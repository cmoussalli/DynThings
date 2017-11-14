/////////////////////////////////////////////////////////////////
// Created by : Caesar Moussalli                               //
// TimeStamp  : 19-4-2016                                      //
// Content    : Handle Configs CRUD                          //
// Notes      :                                                //
/////////////////////////////////////////////////////////////////
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DynThings.Data.Models;
using PagedList;
using DynThings.Core;

namespace DynThings.Data.Repositories
{
    public class DynSettingsRepository
    {
        #region Constructor
        public DynSettingsRepository(DynThingsEntities dbSource)
        {
            db = dbSource;
        }

        #endregion

        #region props
        public DynThingsEntities db;
        #endregion


        #region Get Configs
        public DynSetting GetConfig()
        {
            DynSetting con = new DynSetting();
            List<DynSetting> cons =  db.DynSettings.Where(l => l.ID == 1).ToList();
            if (cons.Count == 1)
            {
                con = cons[0];
            }
            else
            {
                throw new Exception("Not Found");
            }
            return con;
        }

        public SetupModels.PlatformConfig GetSetupPlatformConfig()
        {
            SetupModels.PlatformConfig conf = new SetupModels.PlatformConfig();
            DynSetting con = new DynSetting();
            List<DynSetting> cons = db.DynSettings.Where(l => l.ID == 1).ToList();
            if (cons.Count == 1)
            {
                con = cons[0];
                conf.Title = con.PlatformTitle;
                conf.DevelopmentMode = con.DevelopmentMode;
                conf.PublicAccess = con.PublicAccess;
                conf.PublicSignUp = con.PublicSignUP;
                conf.TimeZone = con.App_TimeZone;
            }
            else
            {
                throw new Exception("Not Found");
            }
            return conf;
        }

        #endregion

        #region Update: Grids
        public ResultInfo.Result SetGridRowsCount(int masterGridRowsCount, int childGridRowsCount)
        {
            List<DynSetting> cons = db.DynSettings.Where(l => l.ID == 1).ToList();
            if (cons.Count == 1)
            {
                cons[0].DefaultRecordsPerMaster = masterGridRowsCount;
                cons[0].DefaultRecordsPerChild = childGridRowsCount;
                db.SaveChanges();
                Core.Config.Refresh();
            }
            else
            {
              return  ResultInfo.GetResultByID(1);
            }
            return ResultInfo.GenerateOKResult("Saved");
        }
        #endregion

        #region Update: Development
        public ResultInfo.Result SetDevelopmentMode(bool DevelopmentMode,string mapKey)
        {
            List<DynSetting> cons = db.DynSettings.Where(l => l.ID == 1).ToList();
            if (cons.Count == 1)
            {
                
                cons[0].DevelopmentMode = DevelopmentMode;
                cons[0].MapKey = mapKey;
                db.SaveChanges();
                Core.Config.Refresh();
            }
            else
            {
                return ResultInfo.GetResultByID(1);
            }
            return ResultInfo.GenerateOKResult("Saved");
        }
        #endregion

        #region Update: Reset Platform
        public ResultInfo.Result ResetPlatform()
        {
            List<DynSetting> cons = db.DynSettings.Where(l => l.ID == 1).ToList();
            if (cons.Count == 1)
            {
                cons[0].PlatformKey = Guid.NewGuid();
                cons[0].DeploymentTimeStamp = DateTime.UtcNow;
                cons[0].PlatformTitle = "";
                db.SaveChanges();
                Core.Config.Refresh();
            }
            else
            {
                return ResultInfo.GetResultByID(1);
            }
            return ResultInfo.GenerateOKResult("Reset Ok");
        }
        #endregion
    }
}
