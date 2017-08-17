using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DynThings.Core;
using DynThings.Data.Models;
using PagedList;

namespace DynThings.Data.Repositories
{
    public class ThingExtensionsRepository
    {
        #region Constructor
        public ThingExtensionsRepository(DynThingsEntities dbSource)
        {
            db = dbSource;
        }

        #endregion

        #region props
        public DynThingsEntities db;
        #endregion


        #region GetList
        /// <summary>
        /// Get List of all defindes Thing Extenstions
        /// </summary>
        /// <returns>List of all defindes Thing Extenstions</returns>
        public List<ThingExtenstion> GetList()
        {
            List<ThingExtenstion> exts = db.ThingExtenstions.ToList();
            return exts;
        }
        /// <summary>
        /// Get List of Thing Extenstions Filtered by Thing Category
        /// </summary>
        /// <param name="thingCategoryID">Filter Thing Category ID</param>
        /// <returns>List of defindes Thing Extenstions </returns>
        public List<ThingExtenstion> GetList(long thingCategoryID)
        {
            List<ThingExtenstion> exts = db.ThingExtenstions.Where(e => e.ThingCategoryID == thingCategoryID).ToList();
            return exts;
        }

        #endregion

        #region Get PagedList
        /// <summary>
        /// Get paged list of definde Thing Extenstions
        /// </summary>
        /// <param name="search">Search text in the as per 'Title' field</param>
        /// <param name="pageNumber">Paging page number.</param>
        /// <param name="recordsPerPage">Paging items per page.</param>
        /// <returns>Paged list of definde Thing Extenstions</returns>
        public IPagedList GetPagedList(string search, int pageNumber, int recordsPerPage)
        {
            IPagedList exts = db.ThingExtenstions
              .Where(e => search == null || e.Title.Contains(search))
              .OrderBy(e => e.Title).ToList()
              .ToPagedList(pageNumber, recordsPerPage);
            return exts;
        }

        /// <summary>
        /// Get paged list of definde Thing Extenstions
        /// </summary>
        /// <param name="search">Search text in the as per 'Title' field</param>
        /// <param name="pageNumber">Paging page number.</param>
        /// <param name="recordsPerPage">Paging items per page.</param>
        /// <param name="thingCategoryID">Filter </param>
        /// <returns>Paged list of definde Thing Extenstions</returns>
        public IPagedList GetPagedList(string search, int pageNumber, int recordsPerPage, long thingCategoryID)
        {
            IPagedList exts = db.ThingExtenstions
              .Where(e =>
              (search == null || e.Title.Contains(search))
              && (e.ThingCategoryID == thingCategoryID)
              )
              .OrderBy(e => e.Title).ToList()
              .ToPagedList(pageNumber, recordsPerPage);
            return exts;
        }
        #endregion

        #region Find
        /// <summary>
        /// Get a specific Thing Extenstion Definition.
        /// </summary>
        /// <param name="id">The requested defeinition ID.</param>
        /// <returns>Thing Extenstion definition.</returns>
        public ThingExtenstion Find(long id)
        {
            ThingExtenstion ext = new ThingExtenstion();
            List<ThingExtenstion> exts = db.ThingExtenstions.Include("DataType").Include("ThingCategory").Include("ThingExtenstionValues").Where(l => l.ID == id).ToList();
            if (exts.Count == 1)
            {
                ext = exts[0];
            }
            else
            {
                throw new Exception("Not Found");
            }
            return ext;
        }

        /// <summary>
        /// Get a specific Thing Extenstion Definition.
        /// </summary>
        /// <param name="code">The requested defeinition code.</param>
        /// <returns>Thing Extenstion definition.</returns>
        public ThingExtenstion Find(string code)
        {
            ThingExtenstion ext = new ThingExtenstion();
            List<ThingExtenstion> exts = db.ThingExtenstions.Include("DataType").Include("ThingCategory").Include("ThingExtenstionValues").Where(l => l.Code == code).ToList();
            if (exts.Count == 1)
            {
                ext = exts[0];
            }
            else
            {
                throw new Exception("Not Found");
            }
            return ext;
        }

        /// <summary>
        /// Get a specific Thing Extenstion Definition.
        /// </summary>
        /// <param name="guid">The requested defeinition Guid.</param>
        /// <returns>Thing Extenstion definition.</returns>
        public ThingExtenstion Find(Guid guid)
        {
            ThingExtenstion ext = new ThingExtenstion();
            List<ThingExtenstion> exts = db.ThingExtenstions.Include("DataType").Include("ThingCategory").Include("ThingExtenstionValues").Where(l => l.GUID == guid).ToList();
            if (exts.Count == 1)
            {
                ext = exts[0];
            }
            else
            {
                throw new Exception("Not Found");
            }
            return ext;
        }

        #endregion

        #region Add
        /// <summary>
        /// Create new Thing Extenstion Property.
        /// </summary>
        /// <param name="title">Property Title.</param>
        /// <param name="code">Property Code, should not includes empty spaces.</param>
        /// <param name="thingCategoryID">Thing Category ID that will attach the property to.</param>
        /// <param name="dataTypeID">Property Data Type ID</param>
        /// <param name="isList">Set if the property support list or single value.</param>
        /// <param name="createdBy">Created by User account.</param>
        /// <returns>Result status info.</returns>
        public ResultInfo.Result Add(string title,string code, long thingCategoryID,int dataTypeID,bool isList, string createdBy)
        {
            ThingExtenstion ext = new ThingExtenstion();
            //Validate data before insert int odatabase
            if (code.Contains(" "))
            {
                return ResultInfo.GenerateErrorResult("Code field should not includes empty spaces");
            }
            List<ThingExtenstion> exts = db.ThingExtenstions.Where(u => 
            u.Title == title
            || u.Code == code
            ).ToList();
            if (exts.Count != 0)
            {
                return ResultInfo.GenerateErrorResult("Record not found");
            }
            //Save new ThingExtenstion to database 
            try
            {
                ext.Title = title;
                ext.Code = code;
                ext.ThingCategoryID = thingCategoryID;
                ext.DataTypeID = dataTypeID;
                ext.IsList = isList;
                db.ThingExtenstions.Add(ext);
                db.SaveChanges();
                return ResultInfo.GenerateOKResult("Saved", ext.ID);
            }
            catch
            {
                return ResultInfo.GetResultByID(1);
            }
        }

        #endregion

        #region Edit
        /// <summary>
        /// Modify and existing Thing Extenstion Property.
        /// </summary>
        /// <param name="id">ID of the modified Property.</param>
        /// <param name="title">Property Title.</param>
        /// <param name="code">Property Code, should not includes empty spaces.</param>
        /// <param name="thingCategoryID">Thing Category ID that will attach the property to.</param>
        /// <param name="dataTypeID">Property Data Type ID</param>
        /// <param name="isList">Set if the property support list or single value.</param>
        /// <param name="createdBy">Created by User account.</param>
        /// <returns>Result status info.</returns>
        public ResultInfo.Result Edit(long id,string title, string code, long thingCategoryID, int dataTypeID, bool isList, string createdBy)
        {
            
            //Validate data before insert into database
            if (code.Contains(" "))
            {
                return ResultInfo.GenerateErrorResult("Code field should not includes empty spaces");
            }
            List<ThingExtenstion> exts = db.ThingExtenstions.Where(u =>
            u.Title == title
            || u.Code == code
            ).ToList();
            if (exts.Count != 0)
            {
                return ResultInfo.GenerateErrorResult("Record not found");
            }
            //Save new ThingExtenstion to database 
            try
            {
                ThingExtenstion ext = db.ThingExtenstions.Find(id);
                ext.Title = title;
                ext.Code = code;
                ext.ThingCategoryID = thingCategoryID;
                ext.DataTypeID = dataTypeID;
                ext.IsList = isList;
                db.ThingExtenstions.Add(ext);
                db.SaveChanges();
                return ResultInfo.GenerateOKResult("Saved", ext.ID);
            }
            catch
            {
                return ResultInfo.GetResultByID(1);
            }
        }

        #endregion

        #region Delete
        /// <summary>
        /// Delete a specific Thing Extenstion Property, also will delete all assigned related values.
        /// </summary>
        /// <param name="id">Thing Extenstion Property ID to delete it.</param>
        /// <returns>Result Status Info.</returns>
        public ResultInfo.Result Delete(long id)
        {
            try
            {
                ThingExtenstion ext = db.ThingExtenstions.Find(id);
                db.ThingExtenstions.Remove(ext);
                db.SaveChanges();
                return ResultInfo.GenerateOKResult("Deleted", ext.ID);
            }
            catch
            {
                return ResultInfo.GetResultByID(1);
            }
        }

        #endregion



    }
}
