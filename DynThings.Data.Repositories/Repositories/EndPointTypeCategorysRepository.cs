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
    public class EndPointTypeCategorysRepository
    {
        #region Constructor
        public EndPointTypeCategorysRepository(DynThingsEntities dbSource)
        {
            db = dbSource;
        }

        #endregion

        #region props
        public DynThingsEntities db;
        #endregion



        #region GetList
        /// <summary>
        /// Get All EndPointType Categories list
        /// </summary>
        /// <returns>List of EndPointType Categories</returns>
        public List<EndPointTypeCategory> GetList()
        {
            List<EndPointTypeCategory> cats = db.EndPointTypeCategorys.ToList();
            return cats;
        }

        #endregion

       
    }
}
