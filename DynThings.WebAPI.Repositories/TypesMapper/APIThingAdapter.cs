using DynThings.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AutoMapper;
using DynThings.WebAPI.Models;

namespace DynThings.WebAPI.TypesMapper
{

    public static class APIThingAdapter
    {
        static DynThingsEntities db = new DynThingsEntities();

        public static APIThing fromThing(Thing sourceThing,bool loadParents,bool loadChilds)
        {
            APIThing result = new APIThing();
            result.ID = sourceThing.ID;
            result.Title = sourceThing.Title;
            result.UTC_Diff = sourceThing.UTC_Diff;

            #region Load Master Types
            result.ThingsType = TypesMapper.APIThingsTypeAdapter.fromThingsType(sourceThing.ThingCategory);

            #endregion

            #region Parents
            if (loadParents)
            {
            #region Locations
                List<APILocation> apiLocations = new List<APILocation>();
                List<Location> locations = db.Locations.Where(l => l.LinkThingsLocations.Any(ll => ll.LocationID == l.ID)).ToList();
                foreach (Location location in locations)
                {
                    APILocation apiLocation = TypesMapper.APILocationAdapter.fromLocation(location, false,false);
                    apiLocations.Add(apiLocation);
                }
                result.Locations = apiLocations;
            #endregion
            }

            #endregion

            #region Load Childs
            if (loadChilds)
            {
                #region EndPoints
                List<APIEndPoint> apiEndPoints = new List<APIEndPoint>();
                foreach (Endpoint endpoint in sourceThing.Endpoints)
                {
                    APIEndPoint apiEndpoint = TypesMapper.APIEndPointAdapter.fromEndpoint(endpoint, false, false);
                    apiEndPoints.Add(apiEndpoint);
                }
                result.EndPoints = apiEndPoints;
                #endregion

                #region ThingEnds
                List<APIThingEnd> apiThingEnds = new List<APIThingEnd>();
                foreach (ThingEnd thingEnd in sourceThing.ThingEnds)
                {
                    APIThingEnd apiThingEnd = TypesMapper.APIThingEndAdapter.fromThingEnd(thingEnd, false, false);
                    apiThingEnds.Add(apiThingEnd);
                }
                result.ThingEnds = apiThingEnds;
                #endregion

                #region APIThingExtensionValues
                List<APIThingExtensionValue> apiThingExtensionValues = new List<APIThingExtensionValue>();
                foreach (ThingExtensionValue thingExtensionValue in sourceThing.ThingExtensionValues)
                {
                    APIThingExtensionValue apiThingExtensionValue = TypesMapper.APIThingExtensionValueAdapter.fromThingExtensionValue(thingExtensionValue, true, false);
                    apiThingExtensionValues.Add(apiThingExtensionValue);
                }
                result.APIThingExtensionValues = apiThingExtensionValues;
                #endregion

            }

            result.ThingEndsCount = sourceThing.ThingEnds.Count;
            #endregion


            List<APIEndPoint> apiEnds = new List<APIEndPoint>();
            //foreach(Endpoint end in sourceThing.Endpoints)
            //{
            //    APIEndPoint apiEnd = new APIEndPoint();
            //    apiEnd = TypesMapper.APIEndPointAdapter.fromEndpoint(end);
            //    apiEnds.Add(apiEnd);
            //}
            //result.EndPoints = apiEnds;

            return result;
        }
    }


}
