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

    public static class APILocationViewTypeAdapter
    {
        public static APILocationViewType fromLocationViewType(LocationViewType sourceLocationViewType)
        {
            APILocationViewType result = new APILocationViewType();
            result.ID = sourceLocationViewType.ID;
            result.Title = sourceLocationViewType.Title;
            
            return result;
        }
    }


}
