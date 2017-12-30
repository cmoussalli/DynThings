using DynThings.Data.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DynThings.Data.Repositories
{
    public class DataTypesRepository
    {
        #region Constructor
        public DataTypesRepository(DynThingsEntities dbSource)
        {
            db = dbSource;
        }

        #endregion

        #region props
        public DynThingsEntities db;
        #endregion

        #region GetList
        public List<DataType> GetList()
        {
            List<DataType> dataTypes = db.DataTypes.ToList();
            return dataTypes;
        }

        #endregion

    }
}
