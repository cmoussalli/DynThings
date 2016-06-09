using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PagedList;
using DynThings.Core;
using DynThings.Data.Models;

namespace DynThings.Data.Repositories
{
    public class RolesRepository
    {
        #region Constructor
        public DynThingsEntities db { get; set; }
        public RolesRepository(DynThingsEntities dynThingsEntities)
        {
            db = dynThingsEntities;
        }
        #endregion


        #region Get List
        public List<AspNetRole> GetList()
        {
            List<AspNetRole> roles = db.AspNetRoles.ToList();
            return roles;
        }
        #endregion

        #region Get PagedList
        public IPagedList GetPagedList(string search, int pageNumber, int recordsPerPage)
        {
            IPagedList roles = db.AspNetRoles
                .Where(
                l => search == null || l.Name.Contains(search))
                              .OrderBy(l => l.Name).ToList()
              .ToPagedList(pageNumber, recordsPerPage);
            return roles;
        }
        #endregion

        #region Find
        public AspNetRole Find(string ID)
        {
            AspNetRole rol = db.AspNetRoles.Find(ID);
            return rol;
        }
        #endregion

        public List<AspNetRole> GetListByUserID(string userID)
        {
            List<AspNetRole> roles = db.AspNetUsers.Find(userID).AspNetRoles.ToList();
            return roles;
        }
    }
}
