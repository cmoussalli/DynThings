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
    public class AppMediaFilesRepository
    {
        #region Constructor
        public AppMediaFilesRepository(DynThingsEntities dbSource)
        {
            db = dbSource;
        }

        #endregion

        #region props
        public DynThingsEntities db;
        #endregion


        #region Get PagedList
        public IPagedList GetPagedList(string search,long appID, int pageNumber, int recordsPerPage)
        {
            IPagedList mFiles = db.AppMediaFiles
              .Where(e => 
              (e.ID > 0 && search == null || e.ID > 0 && e.Title.Contains(search))
                && (appID == null || appID == 0 || e.AppID == appID)              
              )
              .OrderBy(e => e.Title).ToList()
              .ToPagedList(pageNumber, recordsPerPage);
            return mFiles;
        }
        #endregion

        #region GetList
        /// <summary>
        /// Get All App MediaFiles list
        /// </summary>
        /// <returns>List of MediaFiles</returns>
        public List<AppMediaFile> GetList(long appID)
        {
            List<AppMediaFile> appMediaFiles= db.AppMediaFiles
                .Where(m => 
                (appID == null || appID == 0 || m.AppID == appID)
                )
                .OrderBy(m => m.Title).ToList();
            return appMediaFiles;
        }

        #endregion

        #region Find
        public AppMediaFile Find(long id)
        {
            AppMediaFile appMediaFile = new AppMediaFile();
            List<AppMediaFile> appMediaFiles = db.AppMediaFiles.Where(m => m.ID == id).OrderBy(m => m.Title).ToList();
            if (appMediaFiles.Count == 1)
            {
                appMediaFile = appMediaFiles[0];
            }
            else
            {
                throw new Exception("Not Found");
            }
            return appMediaFile;
        }

        #endregion

       
    }
}
