using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DynThings.Core;
using DynThings.Data.Models;
using PagedList;
using ResultInfo;

namespace DynThings.Data.Repositories
{
    public class ThingExtensionValuesRepository
    {
        #region Constructor
        public ThingExtensionValuesRepository(DynThingsEntities dbSource)
        {
            db = dbSource;
        }

        #endregion

        #region props
        public DynThingsEntities db;
        #endregion


        #region GetList
        public List<ThingExtensionValue> GetList(long thingExtensionID, long thingID)
        {
            List<ThingExtensionValue> vs = db.ThingExtensionValues.Where(v =>
           v.ThingExtensionID == thingExtensionID &&
           v.ThingID == thingID
            ).ToList();
            return vs;
        }

        #endregion

        #region Get PagedList
        public IPagedList GetPagedList(long thingExtensionID, long thingID, int pageNumber, int recordsPerPage)
        {
            IPagedList vs = db.ThingExtensionValues
              .Where(v =>
                v.ThingExtensionID == thingExtensionID &&
                v.ThingID == thingID
                )
              .OrderBy(v => v.Valu)
              .ToPagedList(pageNumber, recordsPerPage);
            return vs;
        }

        #endregion


        #region Find
        public ThingExtensionValue Find(long id)
        {
            ThingExtensionValue prp = new ThingExtensionValue();
            List<ThingExtensionValue> prps = db.ThingExtensionValues.Where(p => p.ID == id).ToList();
            if (prps.Count == 1)
            {
                prp = prps[0];
            }
            else
            {
                throw new Exception("Not Found");
            }
            return prp;
        }

        /// <summary>
        /// Get a specific Thing Extension Definition.
        /// </summary>
        /// <param name="code">The requested defeinition code.</param>
        /// <returns>Thing Extension definition.</returns>
        public ThingExtension Find(string code)
        {
            ThingExtension ext = new ThingExtension();
            List<ThingExtension> exts = db.ThingExtensions.Include("DataType").Include("ThingCategory").Include("ThingExtensionValues").Where(l => l.Code == code).ToList();
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
        /// Get a specific Thing Extension Definition.
        /// </summary>
        /// <param name="guid">The requested defeinition Guid.</param>
        /// <returns>Thing Extension definition.</returns>
        public ThingExtension Find(Guid guid)
        {
            ThingExtension ext = new ThingExtension();
            List<ThingExtension> exts = db.ThingExtensions.Include("DataType").Include("ThingCategory").Include("ThingExtensionValues").Where(l => l.GUID == guid).ToList();
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
        public Result Add(long thingID, long thingExtensionID, string newValue, string createdBy)
        {
            Result result = Result.GenerateFailedResult();
            try
            {
                db.ThingPropertyValueAdd(thingID, thingExtensionID, newValue);
                result = Result.GenerateOKResult("Saved");
            }
            catch (Exception ex)
            {
                 result = Result.GenerateFailedResult(ex.Message);
            }
            return result;
        }

        #endregion

        #region Edit
        public Result Edit(long valueID, string newValue, string createdBy)
        {
            Result result = Result.GenerateFailedResult();
            try
            {
                db.ThingPropertyValueEdit(valueID,newValue);
                result = Result.GenerateOKResult("Saved");
            }
            catch (Exception ex)
            {
                result = Result.GenerateFailedResult(ex.Message);
            }
            return result;
        }

        #endregion

        #region Delete
        public Result Delete(long valueID,string createdBy)
        {
            Result result = Result.GenerateFailedResult();
            try
            {
                db.ThingPropertyValueDelete(valueID);
                result = Result.GenerateOKResult("Deleted");
            }
            catch (Exception ex)
            {
                result = Result.GenerateFailedResult(ex.Message);
            }
            return result;
        }

        #endregion



    }
}
