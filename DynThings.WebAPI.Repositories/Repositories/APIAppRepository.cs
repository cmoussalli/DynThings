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
using DynThings.Data.Repositories;

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
        public UnitOfWork_Repositories uof_Repositories = new UnitOfWork_Repositories();
        #endregion



        #region Methods
        #region Get App Info
        public APIApp GetAppInfo(Guid appGuid)
        {
            APIApp result = new APIApp();
            try
            {
                App app = uof_Repositories.repoApps.Find(appGuid);
                result = TypesMapper.APIAppAdapter.fromApp(app);
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
