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

namespace DynThings.Data.Repositories
{
    public class DynSettingsRepository
    {
        public DynThingsEntities db { get; set; }
        public DynSettingsRepository(DynThingsEntities dynThingsEntities)
        {
            db = dynThingsEntities;
        }


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
            }
            else
            {
              return  UnitOfWork.resultInfo.GetResultByID(1);
            }
            return UnitOfWork.resultInfo.GenerateOKResult();
        }
        #endregion
    }
}
