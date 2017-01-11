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
    public class MediaFilesRepository
    {
        #region Constructor
        public DynThingsEntities db { get; set; }
        public MediaFilesRepository(DynThingsEntities dynThingsEntities)
        {
            db = dynThingsEntities;
        }
        #endregion


        #region Get PagedList
        public IPagedList GetPagedList(string search, int pageNumber, int recordsPerPage)
        {
            IPagedList mFiles = db.MediaFiles
              .Where(e => e.ID > 0 && search == null || e.ID > 0 && e.Title.Contains(search))
              .OrderBy(e => e.Title).ToList()
              .ToPagedList(pageNumber, recordsPerPage);
            return mFiles;
        }
        #endregion

        #region GetList
        /// <summary>
        /// Get All Endpoint Types list
        /// </summary>
        /// <returns>List of Endpoint Types</returns>
        public List<MediaFile> GetList()
        {
            List<MediaFile> types = db.MediaFiles.OrderBy(c => c.Title).ToList();
            return types;
        }

        #endregion

        #region Find
        /// <summary>
        /// Find Endpoint Type by EndPoint Type ID
        /// </summary>
        /// <param name="id">EndPoint Type ID</param>
        /// <returns>Endpoint object</returns>
        public MediaFile Find(long id)
        {
            MediaFile epType = new MediaFile();
            List<MediaFile> epTypes = db.MediaFiles.Where(c => c.ID == id).OrderBy(c => c.Title).ToList();
            if (epTypes.Count == 1)
            {
                epType = epTypes[0];
            }
            else
            {
                throw new Exception("Not Found");
            }
            return epType;
        }

        #endregion

        #region Add
        public ResultInfo.Result Add(string Title)
        {
            try
            {
                MediaFile cat = new MediaFile();
                cat.Title = Title;
                db.MediaFiles.Add(cat);
                db.SaveChanges();
                return ResultInfo.GenerateOKResult("Saved", cat.ID);
            }
            catch
            {
                return ResultInfo.GetResultByID(1);
            }
        }

        #endregion

        #region Edit
        public ResultInfo.Result Edit(long ID, string Title)
        {
            try
            {
                MediaFile cat = db.MediaFiles.Find(ID);
                cat.Title = Title;
                db.SaveChanges();
                return ResultInfo.GenerateOKResult("Saved", cat.ID);
            }
            catch
            {
                return ResultInfo.GetResultByID(1);
            }
        }

        #endregion

        #region Delete
        public ResultInfo.Result Delete(long ID)
        {
            try
            {
                //Check if the requested Category is used
                List<ThingCategory> thingCategorys = db.ThingCategorys.Where(t => t.IconID == ID).ToList();
                List<EndPointType> endPointTypes = db.EndPointTypes.Where(t => t.IconID == ID).ToList();

                if (thingCategorys.Count + endPointTypes.Count > 0)
                {// Used
                    return ResultInfo.GetResultByID(1);
                }

                //Execute Delete and return result
                MediaFile media = db.MediaFiles.Find(ID);
                db.MediaFiles.Remove(media);
                db.SaveChanges();
                return ResultInfo.GenerateOKResult("Saved", media.ID);
            }
            catch
            {
                return ResultInfo.GetResultByID(1);
            }
        }

        #endregion
    }
}
