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
        public DynThingsEntities db { get; set; }
        public ThingsRepository(DynThingsEntities dynThingsEntities)
        {
            db = dynThingsEntities;
        }
        #endregion


        #region GetList
        public List<Thing> GetList()
        {
            List<Thing> Things = db.Things.ToList();
            return Things;
        }
        #endregion

        #region Get PagedList
        public IPagedList GetPagedList(string search, int pageNumber, int recordsPerPage)
        {
            IPagedList devs = db.Things
              .Where(e => search == null || e.Title.Contains(search))
              .OrderBy(e => e.Title).ToList()
              .ToPagedList(pageNumber, recordsPerPage);
            return devs;
        }

        public IPagedList GetPagedList(string search, long locationID, int pageNumber, int recordsPerPage)
        {
            IPagedList devs = db.Things
              .Where(e => search == null || e.Title.Contains(search)
              && e.LinkThingsLocations.Any(l => l.LocationID == locationID)
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
            List<Thing> devs = db.Things.Where(l => l.ID == id).ToList();
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
        public ResultInfo.Result Add(string title, long categoryID, int utc_Diff,string userID)
        {
            Thing thing = new Thing();
            try
            {
                thing.CategoryID = categoryID;
                thing.Title = title;
                thing.UTC_Diff = utc_Diff;
                thing.CreateByUser = userID;
                thing.CreateTimeStamp = DateTime.UtcNow.AddHours(Config.App_TimeZone);
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

                db.Things.Remove(thing);
                db.SaveChanges();
                return ResultInfo.GenerateOKResult("Deleted", thing.ID);
            }
            catch (Exception ex)
            {
                return ResultInfo.GenerateErrorResult(ex.Message + " -- " + ex.InnerException);
            }
        }

        #endregion

        public IPagedList GetThingEndsList(string searchFor ="" ,long ?locationID = null, long ?thingID = null,long ?thingCategoryID = null, long ?endpointTypeID = null,long ?endPointID = null, int pageNumber = 1, int recordsPerPage = 0)
        {
            
            List<GetThingEnds_Result> queryResult = db.GetThingEnds(locationID,thingID,thingCategoryID,endPointID,endpointTypeID).ToList();
            List<ThingEnd> thingEnds = new List<ThingEnd>();

            foreach (GetThingEnds_Result res in queryResult)
            {
                ThingEnd thingEnd = new ThingEnd();
                VMLocation loc = new VMLocation();
                loc.ID = res.LocationID;
                loc.Title = res.LocationTitle;
                thingEnd.Location = loc;

                VMThing tng = new VMThing();
                tng.ID = res.ThingID;
                tng.Title = res.ThingTitle;
                tng.CategoryID = res.ThingCategoryID;
                tng.CategoryTitle = res.ThingCategoryTitle;
                thingEnd.Thing = tng;

                VMEndPoint end = new VMEndPoint();
                end.ID = res.EndPointID;
                end.Title = res.EndPointTitle;
                end.Measurement = res.EndPointMeasurement;
                end.TypeID = res.EndPointTypeID;
                end.TypeTitle = res.EndPointTypeTitle;
                thingEnd.EndPoint = end;


                thingEnd.LastSubmitValue = res.LastIOValue;
                thingEnd.LastSubmitTimeStamp = res.LastIOTimeStamp;

                thingEnds.Add(thingEnd);
            }

            return thingEnds.ToPagedList(pageNumber, recordsPerPage);
        }

    }
}
