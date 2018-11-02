using DynThings.Data.Models;
using DynThings.WebAPI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DynThings.WebAPI.TypesMapper
{

    public static class APIEndPointIOWarningAdapter
    {
        public static APIEndPointIOWarning Convert(Endpoint sourceEndPoint,Thing sourceThing , List<Location> affectedLocations,List<LocationView> affectedViews)
        {
            APIEndPointIOWarning result = new APIEndPointIOWarning();
            result.SourceEndPoint = APIEndPointAdapter.fromEndpoint(sourceEndPoint,false,false);
            result.SourceThing = APIThingAdapter.fromThing(sourceThing,false,false,false,false);

            List<APILocation> apiLocations = new List<APILocation>();
            foreach (Location l in affectedLocations)
            {
                apiLocations.Add(APILocationAdapter.fromLocation(l,false,false));    
            }
            result.AffectedLocations = apiLocations;

            List<APILocationView> apiLocationViews = new List<APILocationView>();
            foreach (LocationView v in affectedViews)
            {
                apiLocationViews.Add(APILocationViewAdapter.fromLocationView(v, false));
            }
            result.AffectedLocationViews = apiLocationViews;


            return result;
        }
    }


}
