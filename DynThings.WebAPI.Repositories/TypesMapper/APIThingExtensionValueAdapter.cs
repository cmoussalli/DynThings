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

        public static APIThingExtensionValue fromThingExtensionValue(ThingExtensionValue sourceThingExtensionValue, bool loadParents,bool loadChilds)
        {
            APIThingExtensionValue result = new APIThingExtensionValue();
            result.ID = sourceThingExtensionValue.ID;
            result.Value = sourceThingExtensionValue.Valu;

            #region Load Master Types
           
            #endregion

            #region Parents
            if (loadParents)
            {
                #region ThingExtension
                result.ThingExtension = TypesMapper.APIThingExtensionAdapter.fromThingExtension(sourceThingExtensionValue.ThingExtension,true,false);
                #endregion

                #region Thing
                result.Thing = TypesMapper.APIThingAdapter.fromThing(sourceThingExtensionValue.Thing, false, false);
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
