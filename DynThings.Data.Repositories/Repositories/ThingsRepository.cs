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
        public IPagedList GetPagedList(string search, int pageNumber, int recordsPerPage)
        {
            IPagedList devs = db.Things
              .Where(e => (search == null || e.Title.Contains(search) && e.ID > 0)
               && e.ObjectStatusID != 2
              )
              .OrderBy(e => e.Title).ToList()
              .ToPagedList(pageNumber, recordsPerPage);
            return devs;
        }

        public IPagedList GetPagedList(string search, long locationID, int pageNumber, int recordsPerPage)
        {
            IPagedList devs = db.Things
              .Where(e => search == null || e.Title.Contains(search)
              && e.LinkThingsLocations.Any(l => l.LocationID == locationID)
              && e.ID > 0
              && e.ObjectStatusID != 2
              )
              .OrderBy(e => e.Title).ToList()
              .ToPagedList(pageNumber, recordsPerPage);
            return devs;
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
                return ResultInfo.GenerateErrorResult(ex.InnerException.ToString());
            }
            return ResultInfo.GenerateOKResult("Saved", thing.ID);
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
                return ResultInfo.GenerateOKResult("Saved", thing.ID);
            }
            catch
            {
                return ResultInfo.GetResultByID(1);
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
                return ResultInfo.GenerateOKResult("Deleted", thing.ID);
            }
            catch (Exception ex)
            {
                return ResultInfo.GenerateErrorResult(ex.Message + " -- " + ex.InnerException);
            }
        }

        #endregion




        #region Properties
        #region Get Properties
        public List<ThingExtenstionProperty> GetProperties(long thingID, string searchFor)
        {
            List<ThingExtenstionProperty> props = new List<ThingExtenstionProperty>();
            List<GetThingExtenstions_Result> dbRes = db.GetThingExtenstions(thingID, searchFor).ToList();
            foreach (GetThingExtenstions_Result res in dbRes)
            {
                ThingExtenstionProperty prop0 = new ThingExtenstionProperty();
                prop0.ConvertFromQuery_GetThingExtenstionsList(res);
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

        //#region Find Extenstion
        //public List<ThingExtenstionProperty> FindProperty(long valueID)
        //{
        //    List<ThingExtenstionProperty> props = new List<ThingExtenstionProperty>();
        //    List<GetThingExtenstions_Result> dbRes = db.GetThingExtenstions(thingID).ToList();
        //    foreach (GetThingExtenstions_Result res in dbRes)
        //    {
        //        ThingExtenstionProperty prop0 = new ThingExtenstionProperty();
        //        prop0.ConvertFromQuery_GetThingExtenstionsList(res);
        //        props.Add(prop0);
        //    }
        //    return props;
        //}

        //public IPagedList GetExtenstionsPagedList(long thingID, int pageNumber, int recordsPerPage)
        //{
        //    IPagedList props = GetExtenstions(thingID).ToPagedList(pageNumber, recordsPerPage);
        //    return props;
        //}
        //#endregion

        //#region Add Property
        //public ResultInfo.Result AddProperty(long thingID, long thingExtenstionID,string value)
        //{
        //    try
        //    {
        //        db.ThingPropertyValueAdd(thingID, thingExtenstionID, value);
        //        return ResultInfo.GenerateOKResult("Saved");
        //    }
        //    catch
        //    {
        //        return ResultInfo.GetResultByID(1);
        //    }
        //}
        //#endregion

        //#region Edit Property
        //public ResultInfo.Result EditProperty(long valueID, string newValue)
        //{
        //    try
        //    {
        //        db.ThingPropertyValueEdit(valueID, newValue);
        //        return ResultInfo.GenerateOKResult("Saved");
        //    }
        //    catch
        //    {
        //        return ResultInfo.GetResultByID(1);
        //    }
        //}
        //#endregion

        //#region Delete Property
        //public ResultInfo.Result DeleteProperty(long valueID)
        //{
        //    try

        //    {
        //        db.ThingPropertyValueDelete(valueID);
        //        return ResultInfo.GenerateOKResult("Saved");
        //    }
        //    catch
        //    {
        //        return ResultInfo.GetResultByID(1);
        //    }
        //}
        //#endregion

        #endregion

    }
}
