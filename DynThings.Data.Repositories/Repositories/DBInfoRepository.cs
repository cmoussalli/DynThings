using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DynThings.Core;
using DynThings.Data.Models;
using DynThings.Data.Models.ProcedureModels;
using PagedList;
using ResultInfo;

namespace DynThings.Data.Repositories
{
    public class DBInfoRepository
    {
        #region Constructor
        public DBInfoRepository(DynThingsEntities dbSource)
        {
            db = dbSource;
        }

        #endregion

        #region props
        public DynThingsEntities db;
        #endregion


        public DBServerInfo GetDBServerInfo()
        {
            DBServerInfo res = new DBServerInfo();
            INFO_Server_Result info = db.INFO_Server().ToList()[0];
            res.Name = info.ServerName;
            try
            {
                res.Memory = info.Memory /1024;

            }
            catch
            {
                res.Memory = 0;
            }
            res.Edition = info.Edition;
            res.Version = info.Version;
            return res;
        }









    }
}
