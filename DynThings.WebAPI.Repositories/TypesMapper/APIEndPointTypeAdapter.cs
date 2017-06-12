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

    public static class APIEndPointTypeAdapter
    {
        public static APIEndPointType fromEndPointType(EndPointType sourceEndPointType)
        {
            APIEndPointType result = new APIEndPointType();
            result.ID = sourceEndPointType.ID;
            result.Title = sourceEndPointType.Title;
            result.IconID = sourceEndPointType.IconID;
            result.measurement = sourceEndPointType.measurement;

            result.EndPointTypeCategory = TypesMapper.APIEndPointTypeCategoryAdapter.fromEndPointTypeCategory( sourceEndPointType.EndPointTypeCategory);
            return result;
        }
    }


}
