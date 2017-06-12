/////////////////////////////////////////////////////////////////
// Created by : Caesar Moussalli                               //
// TimeStamp  : 8-5-2017                                      //
// Content    : Handle Thing CRUD                             //
// Notes      :                                                //
/////////////////////////////////////////////////////////////////
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
    public class ThingEndsRepository
    {
        #region Constructor
        public ThingEndsRepository(DynThingsEntities dbSource)
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
            return db.ThingEnds.Count();
        }
        #endregion        


        public IPagedList GetThingEndsList(string searchFor = "", long? locationID = null, long? thingID = null, long? thingCategoryID = null, long? endpointTypeID = null, long? endPointID = null, int pageNumber = 1, int recordsPerPage = 0)
        {
            IQueryable<ThingEnd> query = db.ThingEnds.Include("Thing").Where(q=>
                 ((q.Thing.Title.Contains(searchFor)) || (searchFor == null))
                 && ((q.ThingID == thingID && thingID != null)||(thingID == null))
                 && ((q.Thing.CategoryID == thingCategoryID) || thingCategoryID == null )
                 && ((q.Thing.LinkThingsLocations.Any(l => l.LocationID == locationID)) || locationID == null)
                 && ((q.EndPointTypeID == endpointTypeID) || endpointTypeID == null)
            );
          
            return query.ToList().ToPagedList(pageNumber, recordsPerPage);
        }

        public ThingEnd GetThingEnd(long thingID, long thingEndpointTypeID)
        {
            ThingEnd result = new ThingEnd();
            List<ThingEnd> thingEnds = db.ThingEnds.Where(e => e.ThingID == thingID && e.EndPointTypeID == thingEndpointTypeID).ToList();
            if (thingEnds.Count == 1)
            {
                result = thingEnds[0];
            }
            else
            {
                throw new Exception("Error finding the requested ThingEnd");
            }


            return result;

        }

        public IPagedList GetThingEndIOs(long thingID, long thingEndpointTypeID, DateTime fromDate, DateTime toDate, int pageNumber = 1, int recordsPerPage = 0)
        {
            IPagedList result = db.EndPointIOs.Where
                (i => i.ThingID == thingID
                && i.Endpoint.TypeID == thingEndpointTypeID
                && i.ExecTimeStamp > fromDate
                && i.ExecTimeStamp < toDate
                && i.IOTypeID < 3)
                .OrderByDescending(i => i.ExecTimeStamp)
                .Take(1000)
                .ToPagedList(pageNumber, recordsPerPage);

            return result;
        }

        public IPagedList GetThingEndLogs(long thingID, long thingEndpointTypeID, DateTime fromDate, DateTime toDate, int pageNumber = 1, int recordsPerPage = 0)
        {
            IPagedList result = db.EndPointIOs.Where
                (i => i.ThingID == thingID
                && i.Endpoint.TypeID == thingEndpointTypeID
                && i.ExecTimeStamp > fromDate
                && i.ExecTimeStamp < toDate
                && i.IOTypeID == 3)
                .OrderByDescending(i => i.ExecTimeStamp)
                .Take(1000)
                .ToPagedList(pageNumber, recordsPerPage);

            return result;
        }
    }
}
