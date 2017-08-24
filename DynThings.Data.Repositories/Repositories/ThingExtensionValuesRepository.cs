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
        public List<ThingExtenstionValue> GetList(long thingExtensionID, long thingID)
        {
            List<ThingExtenstionValue> vs = db.ThingExtenstionValues.Where(v =>
           v.ThingExtenstionID == thingExtensionID &&
           v.ThingID == thingID
            ).ToList();
            return vs;
        }

        #endregion

        #region Get PagedList
        public IPagedList GetPagedList(long thingExtensionID, long thingID, int pageNumber, int recordsPerPage)
        {
            IPagedList vs = db.ThingExtenstionValues
              .Where(v =>
                v.ThingExtenstionID == thingExtensionID &&
                v.ThingID == thingID
                )
              .OrderBy(v => v.Valu)
              .ToPagedList(pageNumber, recordsPerPage);
            return vs;
        }

        #endregion


        #region Find
        public ThingExtenstionValue Find(long id)
        {
            ThingExtenstionValue prp = new ThingExtenstionValue();
            List<ThingExtenstionValue> prps = db.ThingExtenstionValues.Where(p => p.ID == id).ToList();
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
        public ResultInfo.Result Add(long thingID, long thingExtensionID, string newValue, string createdBy)
        {
            ResultInfo.Result result = ResultInfo.GenerateErrorResult();
            try
            {
                db.ThingPropertyValueAdd(thingID, thingExtensionID, newValue);
                result = ResultInfo.GenerateOKResult("Saved");
            }
            catch (Exception ex)
            {
                 result = ResultInfo.GenerateErrorResult(ex.Message);
            }
            return result;
        }

        #endregion

        #region Edit
        public ResultInfo.Result Edit(long valueID, string newValue, string createdBy)
        {
            ResultInfo.Result result = ResultInfo.GenerateErrorResult();
            try
            {
                db.ThingPropertyValueEdit(valueID,newValue);
                result = ResultInfo.GenerateOKResult("Saved");
            }
            catch (Exception ex)
            {
                result = ResultInfo.GenerateErrorResult(ex.Message);
            }
            return result;
        }

        #endregion

        #region Delete
        public ResultInfo.Result Delete(long valueID,string createdBy)
        {
            ResultInfo.Result result = ResultInfo.GenerateErrorResult();
            try
            {
                db.ThingPropertyValueDelete(valueID);
                result = ResultInfo.GenerateOKResult("Deleted");
            }
            catch (Exception ex)
            {
                result = ResultInfo.GenerateErrorResult(ex.Message);
            }
            return result;
        }

        #endregion



    }
}
