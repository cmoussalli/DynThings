/////////////////////////////////////////////////////////////////
// Created by : Caesar Moussalli                               //
// TimeStamp  : 31-1-2016                                      //
// Content    : Handle Thing CRUD                             //
// Notes      :                                                //
/////////////////////////////////////////////////////////////////

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DynThings.Data.Models;
using DynThings.Data.Models.ViewModels;
using PagedList;
using DynThings.Core;
using ResultInfo;

namespace DynThings.Data.Repositories
{
    public class ThingsRepository
    {
        #region Constructor
        public ThingsRepository(DynThingsEntities dbSource)
        {
            db = dbSource;
        }

        #endregion

        #region props
        public DynThingsEntities db;
        #endregion

        #region GetCount
        public int GetCount()
        {
            return db.Things.Count(t => t.ObjectStatusID != 2);
        }
        #endregion

        #region GetList
        public List<Thing> GetList(bool EnableUnspecified)
        {
            List<Thing> Things = db.Things.Where(t => t.ObjectStatusID != 2).ToList();
            if (EnableUnspecified == false)
            {
                Things = Things.Where(t => t.ID > 0 && t.ObjectStatusID != 2).ToList();
            }
            else
            {

            }
            return Things;
        }
        #endregion

        #region Get PagedList
        public IPagedList<Thing> GetPagedList(string search, int pageNumber, int recordsPerPage)
        {
            IPagedList<Thing> things = db.Things
              .Where(e => (search == null || e.Title.Contains(search) && e.ID > 0)
               && e.ObjectStatusID != 2
              )
              .OrderBy(e => e.Title).ToList()
              .ToPagedList(pageNumber, recordsPerPage);
            return things;
        }

        public IPagedList<Thing> GetPagedList(string search, long? locationID, int pageNumber, int recordsPerPage)
        {
            IPagedList<Thing> things = db.Things
              .Where(t =>
                  ((search == null || search == "") || t.Title.Contains(search))
                  && ((locationID == null || locationID == 0) || (t.LinkThingsLocations.Any(l => l.LocationID == locationID)))
                  && t.ID > 0
                  && t.ObjectStatusID != 2
              )
              .OrderBy(t => t.Title).ToList()
              .ToPagedList(pageNumber, recordsPerPage);
            return things;
        }

        public IPagedList<Thing> GetThingsWithWarningsPagedList(string search, long? locationID, int pageNumber, int recordsPerPage)
        {
            IPagedList<Thing> things = db.Things
              .Where(t =>
                  ((search == null || search == "") || t.Title.Contains(search))
                  && ((locationID == null || locationID == 0) || (t.LinkThingsLocations.Any(l => l.LocationID == locationID)))
                  && t.ID > 0
                  && t.ObjectStatusID != 2
                  && (
                   t.LinkThingsLocations.Any(
                                              lt =>
                                                  (lt.LocationID == locationID || (locationID == null || locationID == 0))
                                                  && lt.Thing.Endpoints.Any(
                                                                   e => e.IsNumericOnly == true
                                                                  && (e.LastIONumericValue >= e.HighRange || e.LastIONumericValue <= e.LowRange)
                                                                              )
                                                  )
                 )
              )
              .OrderBy(e => e.Title).ToList()
              .ToPagedList(pageNumber, recordsPerPage);
            return things;
        }

        #endregion

        #region Find
        /// <summary>
        /// Find Thing by Thing ID
        /// </summary>
        /// <param name="id">Thing ID</param>
        /// <returns>Thing object</returns>
        public Thing Find(long id)
        {
            Thing dev = new Thing();
            List<Thing> devs = db.Things.Where(l => l.ID == id && l.ObjectStatusID != 2).ToList();
            if (devs.Count == 1)
            {
                dev = devs[0];
            }
            else
            {
                throw new Exception("Not Found");
            }
            return dev;
        }
        #endregion

        #region Add
        public ResultInfo.Result Add(string title, long categoryID, int utc_Diff, string userID)
        {
            Thing thing = new Thing();
            try
            {
                thing.CategoryID = categoryID;
                thing.Title = title;
                thing.UTC_Diff = utc_Diff;
                thing.CreateByUser = userID;
                thing.CreateTimeStamp = DateTime.UtcNow.AddHours(Config.App_TimeZone);
                thing.ObjectStatusID = 1;
                db.Things.Add(thing);
                db.SaveChanges();
            }
            catch (Exception ex)
            {
                return Result.GenerateFailedResult(ex.InnerException.ToString());
            }
            return Result.GenerateOKResult("Saved", thing.ID.ToString());
        }
        #endregion

        #region Edit
        public ResultInfo.Result Edit(long id, string title, long categoryID, int utc_Diff)
        {
            try
            {
                Thing thing = db.Things.Find(id);
                thing.Title = title;
                thing.CategoryID = categoryID;
                thing.UTC_Diff = utc_Diff;
                db.SaveChanges();
                return Result.GenerateOKResult("Saved", thing.ID.ToString());
            }
            catch
            {
                return Result.GenerateFailedResult();
            }
        }

        #endregion

        #region Delete  
        public ResultInfo.Result Delete(long id)
        {
            try
            {
                Thing thing = db.Things.Find(id);
                thing.ObjectStatusID = 2;
                //DeAttach EndPoints
                List<Endpoint> ends = db.Endpoints.Where(e => e.ThingID == id).ToList();
                ends.ForEach(e => e.ThingID = 0);

                db.SaveChanges();
                return Result.GenerateOKResult("Deleted", thing.ID.ToString());
            }
            catch (Exception ex)
            {
                return Result.GenerateFailedResult(ex.Message + " -- " + ex.InnerException);
            }
        }

        #endregion




        #region Properties
        #region Get Properties
        public List<ThingExtensionProperty> GetProperties(long thingID, string searchFor)
        {
            List<ThingExtensionProperty> props = new List<ThingExtensionProperty>();
            List<GetThingExtensions_Result> dbRes = db.GetThingExtensions(thingID, searchFor).ToList();
            foreach (GetThingExtensions_Result res in dbRes)
            {
                ThingExtensionProperty prop0 = new ThingExtensionProperty();
                prop0.ConvertFromQuery_GetThingExtensionsList(res);
                props.Add(prop0);
            }
            return props;
        }

        public IPagedList GetPropertiesPagedList(long thingID, string searchFor, int pageNumber, int recordsPerPage)
        {
            IPagedList props = GetProperties(thingID, searchFor).ToPagedList(pageNumber, recordsPerPage);
            return props;
        }
        #endregion

        //#region Find Extension
        //public List<ThingExtensionProperty> FindProperty(long valueID)
        //{
        //    List<ThingExtensionProperty> props = new List<ThingExtensionProperty>();
        //    List<GetThingExtensions_Result> dbRes = db.GetThingExtensions(thingID).ToList();
        //    foreach (GetThingExtensions_Result res in dbRes)
        //    {
        //        ThingExtensionProperty prop0 = new ThingExtensionProperty();
        //        prop0.ConvertFromQuery_GetThingExtensionsList(res);
        //        props.Add(prop0);
        //    }
        //    return props;
        //}

        //public IPagedList GetExtensionsPagedList(long thingID, int pageNumber, int recordsPerPage)
        //{
        //    IPagedList props = GetExtensions(thingID).ToPagedList(pageNumber, recordsPerPage);
        //    return props;
        //}
        //#endregion

        //#region Add Property
        //public ResultInfo.Result AddProperty(long thingID, long thingExtensionID,string value)
        //{
        //    try
        //    {
        //        db.ThingPropertyValueAdd(thingID, thingExtensionID, value);
        //        return Result.GenerateOKResult("Saved");
        //    }
        //    catch
        //    {
        //        return Result.GenerateFailedResult();
        //    }
        //}
        //#endregion

        //#region Edit Property
        //public ResultInfo.Result EditProperty(long valueID, string newValue)
        //{
        //    try
        //    {
        //        db.ThingPropertyValueEdit(valueID, newValue);
        //        return Result.GenerateOKResult("Saved");
        //    }
        //    catch
        //    {
        //        return Result.GenerateFailedResult();
        //    }
        //}
        //#endregion

        //#region Delete Property
        //public ResultInfo.Result DeleteProperty(long valueID)
        //{
        //    try

        //    {
        //        db.ThingPropertyValueDelete(valueID);
        //        return Result.GenerateOKResult("Saved");
        //    }
        //    catch
        //    {
        //        return Result.GenerateFailedResult();
        //    }
        //}
        //#endregion

        #endregion

    }
}
