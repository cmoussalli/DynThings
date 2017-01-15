
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DynThings.Data.Models;
using DynThings.Core;
using PagedList;

namespace DynThings.Data.Repositories
{
    public class AppStatussRepository
    {
        #region Constructor
        public AppStatussRepository(DynThingsEntities dbSource)
        {
            db = dbSource;
        }

        #endregion

        #region props
        public DynThingsEntities db;
        #endregion


        #region GetList
        public List<AppStatuss> GetList()
        {
            List<AppStatuss> statuss = db.AppStatusses
                .OrderBy(c => c.Title).ToList();
            return statuss;
        }

        #endregion


    }
}
