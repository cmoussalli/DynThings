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

    public static class APIThingExtensionValueAdapter
    {
        static DynThingsEntities db = new DynThingsEntities();

        public static APIThingExtensionValue fromThingExtensionValue(ThingExtenstionValue sourceThingExtenstionValue, bool loadParents,bool loadChilds)
        {
            APIThingExtensionValue result = new APIThingExtensionValue();
            result.ID = sourceThingExtenstionValue.ID;
            result.Valu = sourceThingExtenstionValue.Valu;

            #region Load Master Types
           
            #endregion

            #region Parents
            if (loadParents)
            {
                #region ThingExtension
                result.ThingExtension = TypesMapper.APIThingExtensionAdapter.fromThingExtension(sourceThingExtenstionValue.ThingExtenstion,false,false);
                #endregion

                #region Thing
                result.Thing = TypesMapper.APIThingAdapter.fromThing(sourceThingExtenstionValue.Thing, false, false);
                #endregion
            }

            #endregion

            #region Load Childs
            if (loadChilds)
            {
             
            }
            #endregion

            return result;
        }
    }
}
