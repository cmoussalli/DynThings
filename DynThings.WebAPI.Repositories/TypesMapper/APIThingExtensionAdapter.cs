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

    public static class APIThingExtensionAdapter
    {
        static DynThingsEntities db = new DynThingsEntities();

        public static APIThingExtension fromThingExtension(ThingExtenstion sourceThingExtension, bool loadParents,bool loadChilds)
        {
            APIThingExtension result = new APIThingExtension();
            result.ID = sourceThingExtension.ID;
            result.Title = sourceThingExtension.Title;

            #region Load Master Types
            result.DataType = TypesMapper.APIDataTypeAdapter.fromDataType(sourceThingExtension.DataType);
            result.ThingType = TypesMapper.APIThingsTypeAdapter.fromThingsType(sourceThingExtension.ThingCategory);
            #endregion

            #region Parents

            #endregion

            #region Load Childs
            if (loadChilds)
            {
                #region ThingExtensionValues
                List<APIThingExtensionValue> apiThingExtensionValues = new List<APIThingExtensionValue>();
                foreach (ThingExtenstionValue thingExtenstionValue in sourceThingExtension.ThingExtenstionValues)
                {
                    APIThingExtensionValue apiThingExtensionValue = TypesMapper.APIThingExtensionValueAdapter.fromThingExtensionValue(thingExtenstionValue, false, false);
                    apiThingExtensionValues.Add(apiThingExtensionValue);
                }
                result.APIThingExtensionValues = apiThingExtensionValues;
                #endregion
            }
            #endregion

            return result;
        }
    }
}
