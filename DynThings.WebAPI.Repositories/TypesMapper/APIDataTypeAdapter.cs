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

    public static class APIDataTypeAdapter
    {
        public static APIDataType fromDataType(DataType sourceDataType)
        {
            APIDataType result = new APIDataType();
            result.ID = sourceDataType.ID;
            result.Title = sourceDataType.Title;
            return result;
        }
    }


}
