using DynThings.Data.Models;
using DynThings.WebAPI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DynThings.WebAPI.TypesMapper
{

    public static class APILocationAdapter
    {
        public static APILocation fromLocation(Location sourceLocation, bool loadViews, bool loadThings)
        {
            APILocation result = new APILocation();
            result.GUID = sourceLocation.GUID;
            result.IconID = sourceLocation.IconID;
            result.ID = sourceLocation.ID;
            result.isActive = sourceLocation.isActive;
            result.LatitudeX = sourceLocation.LatitudeX;
            result.LongitudeY = sourceLocation.LongitudeY;
            result.Status = sourceLocation.Status;
            result.Title = sourceLocation.Title;

            #region Parents
            #region LocationViews
            if (loadViews)
            {
                List<APILocationView> apiLocationViews = new List<APILocationView>();
                foreach (LocationView locationView in sourceLocation.locationViews)
                {
                    APILocationView apiLocationView = TypesMapper.APILocationViewAdapter.fromLocationView(locationView, false);
                    apiLocationViews.Add(apiLocationView);
                }
                result.LocationViews = apiLocationViews;
            }
            #endregion


            #endregion

            #region Childs
            if (loadThings)
            {
                #region Things
                List<APIThing> apiThings = new List<APIThing>();
                foreach (Thing thing in sourceLocation.Things)
                {
                    APIThing apiThing = TypesMapper.APIThingAdapter.fromThing(thing, false, false, false, false);
                    apiThings.Add(apiThing);
                }
                result.Things = apiThings;
                #endregion
            }
            result.ThingsCount = sourceLocation.Things.Count;
            


            #endregion

            return result;
        }
    }


}
