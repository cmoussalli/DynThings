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
