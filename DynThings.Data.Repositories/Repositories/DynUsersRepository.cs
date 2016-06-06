using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DynThings.Data.Models;
using PagedList;
using DynThings.Core;

namespace DynThings.Data.Repositories
{
    public class DynUsersRepository
    {
        #region Constructor
        public DynThingsEntities db { get; set; }
        public DynUsersRepository(DynThingsEntities dynThingsEntities)
        {
            db = dynThingsEntities;
        }
        #endregion


        #region Get PagedList
        public IPagedList GetPagedList(string search, int pageNumber, int recordsPerPage)
        {
            IPagedList usrs = db.AspNetUsers
                .Where(
                l => search == null || l.UserName.Contains(search))
                              .OrderBy(l => l.UserName).ToList()
              .ToPagedList(pageNumber, recordsPerPage);
            return usrs;
        }
        #endregion

        #region Find
        /// <summary>
        /// Find DynUser by DynUser ID
        /// </summary>
        /// <param name="ID">DynUser ID</param>
        /// <returns>DynUser object</returns>
        public AspNetUser Find(string ID)
        {
            AspNetUser usr = db.AspNetUsers.Find(ID);
            return usr;
        }
        #endregion

        public string GetUserName(string ID)
        {
            AspNetUser usr = db.AspNetUsers.Find(ID);
            return usr.FullName;
        }

        


    }
}
