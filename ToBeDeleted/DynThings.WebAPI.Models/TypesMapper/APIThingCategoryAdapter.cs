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

    public static class APIThingCategoryAdapter
    {
        public static APIThingsCategory fromThingCategory(ThingCategory sourceThingCategory)
        {
            APIThingsCategory result = new APIThingsCategory();
            result.ID = sourceThingCategory.ID;
            result.Title = sourceThingCategory.Title;
            return result;
        }
    }


}
