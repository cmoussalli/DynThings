using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DynThings.Core;
using DynThings.Data.Models;


namespace DynThings.Data.Repositories
{
    public class SystemEntitysRepository
    {
        #region Constructor
        public SystemEntitysRepository(DynThingsEntities dbSource)
        {
            db = dbSource;
        }

        #endregion

        #region props
        public DynThingsEntities db;
        #endregion


        #region GetList
        public List<SystemEntity> GetList()
        {
            List<SystemEntity> entities = db.SystemEntitys
                .OrderBy(c => c.Title).ToList();
            return entities;
        }

        #endregion
    }
}
