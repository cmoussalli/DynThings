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

    public static class APIEndPointTypeCategoryAdapter
    {
        public static APIEndPointTypeCategory fromEndPointTypeCategory(EndPointTypeCategory sourceEndPointTypeCategory)
        {

            APIEndPointTypeCategory result = new APIEndPointTypeCategory();
            result.ID = sourceEndPointTypeCategory.ID;
            result.Title = sourceEndPointTypeCategory.Title;
            
            return result;
        }
    }


}
