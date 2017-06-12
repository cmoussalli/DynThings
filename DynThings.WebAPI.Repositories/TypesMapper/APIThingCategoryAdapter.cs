using DynThings.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DynThings.Data.Models.ViewModels;
using AutoMapper;
using DynThings.WebAPI.Models;

namespace DynThings.WebAPI.TypesMapper
{

    public static class APIThingsTypeAdapter
    {
        public static APIThingsType fromThingsType(ThingCategory sourceThingCategory)
        {
            APIThingsType result = new APIThingsType();
            result.ID = sourceThingCategory.ID;
            result.Title = sourceThingCategory.Title;
            return result;
        }
    }


}
