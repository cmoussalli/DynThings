using DynThings.Data.Models;
using DynThings.Data.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AutoMapper;

namespace DynThings.WebAPI.Models.TypesMapper
{

    public static class APIThingEndAdapter
    {
        public static APIThingEnd fromThingEnd(ThingEnd sourceThingEnd)
        {
            APIThingEnd result = new APIThingEnd();
            result.ID = sourceThingEnd.ID;
            result.Thing = TypesMapper.APIThingAdapter.fromThing(sourceThingEnd.Thing);
            result.EndPointType = TypesMapper.APIEndPointTypeAdapter.fromEndPointType(sourceThingEnd.EndPointType);
            result.LastIOID = sourceThingEnd.LastIOID;
            result.LastIOTimeStamp = sourceThingEnd.LastIOTimeStamp;
            result.LastIOTimeStampUTC = sourceThingEnd.LastIOTimeStampUTC;
            result.LastIOValue = sourceThingEnd.LastIOValue;
            
            return result;
        }
    }


}
