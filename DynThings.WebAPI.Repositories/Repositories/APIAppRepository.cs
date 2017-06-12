using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DynThings.Core;
using DynThings.Data.Models;
using DynThings.WebAPI.Models;
using DynThings.WebAPI.TypesMapper;
using DynThings.WebAPI.Repositories;
using PagedList;
using System.Security.Cryptography;

namespace DynThings.WebAPI.Repositories
{
    public class APIAppRepository
    {
        #region Constructor
        public APIAppRepository(DynThingsEntities dbSource)
        {
            db = dbSource;
        }

        #endregion

        #region props
        private DynThingsEntities db;
        #endregion

        

        #region Methods
        #region Get App Info
        public APIApp GetAppInfo(Guid appGuid)
        {
            APIApp result = new APIApp();
            try
            {
            List<App> apps = db.Apps.Where(a => a.GUID == appGuid).ToList();
                if (apps.Count == 0)
                {//App Not Exist
                    throw new Exception("Wrong App GUID");
                }
                else
                {//App is Exist
                    result = TypesMapper. APIAppAdapter.fromApp(apps[0]);
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }

            return result;
        }
        #endregion

        
        #endregion

    }
}
