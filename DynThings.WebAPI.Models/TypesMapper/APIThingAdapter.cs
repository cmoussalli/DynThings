using DynThings.Data.Models;
using DynThings.Data.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DynThings.Data.Models.ViewModels;
using AutoMapper;

namespace DynThings.WebAPI.Models.TypesMapper
{

    public static class APIThingAdapter
    {
        public static APIThing fromThing(Thing sourceThing)
        {

            APIThing result = new APIThing();
            result.ID = sourceThing.ID;
            result.Title = sourceThing.Title;
            result.ThingsCategory = TypesMapper.APIThingCategoryAdapter.fromThingCategory(sourceThing.ThingCategory);
            result.UTC_Diff = sourceThing.UTC_Diff;

            List<APIEndPoint> apiEnds = new List<APIEndPoint>();
            foreach(Endpoint end in sourceThing.Endpoints)
            {
                APIEndPoint apiEnd = new APIEndPoint();
                apiEnd = TypesMapper.APIEndPointAdapter.fromEndpoint(end);
                apiEnds.Add(apiEnd);
            }
            result.EndPoints = apiEnds;
            
            return result;
        }
    }


}
