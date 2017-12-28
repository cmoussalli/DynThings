using DynThings.Data.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DynThings.Data.Repositories
{
    public class AppAPIEntitysRepository
    {
        #region Constructor
        public AppAPIEntitysRepository(DynThingsEntities dbSource)
        {
            db = dbSource;
        }

        #endregion

        #region props
        public DynThingsEntities db;
        #endregion


        #region Get AppAPIEntitys PagedList
        public IPagedList GetAppAPIEntitysPagedList(string search, long appID, int pageNumber, int recordsPerPage)
        {
            IPagedList appAPIEntitys = db.AppAPIEntitys
              .Where(e => search == null || e.SystemEntity.Title.Contains(search) && e.AppID == appID)

              .OrderByDescending(e => e.SystemEntity.Title).ToList()
              .ToPagedList(pageNumber, recordsPerPage);
            return appAPIEntitys;
        }
        #endregion

        #region Find AppApiEntity
        public AppAPIEntity FindAppApiEntity(long id)
        {
            AppAPIEntity ent;
            List<AppAPIEntity> ents = db.AppAPIEntitys.Include("SystemEntity").Include("App").Where(l => l.ID == id).ToList();
            if (ents.Count == 1)
            {
                ent = ents[0];
            }
            else
            {
                throw new Exception("Not Found");
            }
            return ent;
        }

        public AppAPIEntity FindAppApiEntity(long appID, long appAPIEntity)
        {
            AppAPIEntity ent;
            List<AppAPIEntity> ents = db.AppAPIEntitys.Include("SystemEntity").Include("App").Where(l => l.AppID == appID && l.SystemEntityID == appAPIEntity).ToList();
            if (ents.Count == 1)
            {
                ent = ents[0];
            }
            else
            {
                throw new Exception("Not Found");
            }
            return ent;
        }

        #endregion

    }
}
