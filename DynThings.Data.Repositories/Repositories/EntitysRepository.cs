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
        #region Props
        public DynThingsEntities db
        {
            get
            {
                return UnitOfWork_Repositories.dynDB;
            }
        }
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
