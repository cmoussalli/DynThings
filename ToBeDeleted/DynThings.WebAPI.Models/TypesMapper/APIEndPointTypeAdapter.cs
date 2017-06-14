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

    public static class APIEndPointTypeAdapter
    {
        public static APIEndPointType fromEndPointType(EndPointType sourceEndPointType)
        {
            APIEndPointType result = new APIEndPointType();
            result.ID = sourceEndPointType.ID;
            result.Title = sourceEndPointType.Title;
            
            return result;
        }
    }


}
