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

    public static class APIThingEndAdapter
    {
        public static APIThingEnd fromThingEnd(ThingEnd sourceThingEnd,bool loadParents,bool loadChilds)
        {
            APIThingEnd result = new APIThingEnd();
            result.ID = sourceThingEnd.ID;
            result.LastIOID = sourceThingEnd.LastIOID;
            result.LastIOTimeStamp = sourceThingEnd.LastIOTimeStamp;
            result.LastIOTimeStampUTC = sourceThingEnd.LastIOTimeStampUTC;
            result.LastIOValue = sourceThingEnd.LastIOValue;

            #region Load MasterTypes
            result.EndPointType = APIEndPointTypeAdapter.fromEndPointType(sourceThingEnd.EndPointType);

            #endregion

            #region Load Parents
            result.Thing = TypesMapper.APIThingAdapter.fromThing(sourceThingEnd.Thing,false,false);

            #endregion


            #region Load Childs
            
            #endregion


            return result;
        }
    }


}
