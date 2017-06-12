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
