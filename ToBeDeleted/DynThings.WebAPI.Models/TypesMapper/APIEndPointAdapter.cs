using DynThings.Data.Models;
using DynThings.Data.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DynThings.WebAPI.Models.TypesMapper
{

    public static class APIEndPointAdapter
    {
        public static APIEndPoint fromEndpoint(Endpoint sourceEndpoint)
        {
            APIEndPoint result = new APIEndPoint();
            result.ID = sourceEndpoint.ID;
            result.GUID = sourceEndpoint.GUID;
            result.KeyPass = sourceEndpoint.KeyPass;
            result.PinCode = sourceEndpoint.PinCode;
            result.Title = sourceEndpoint.Title;
            result.TypeID = sourceEndpoint.TypeID;
            result.TypeTitle = sourceEndpoint.EndPointType.Title ;
            result.Measurement = sourceEndpoint.EndPointType.measurement;
            result.EndPointTypeCategoryID = sourceEndpoint.EndPointType.EndPointTypeCategory.ID;
            result.EndPointTypeCategoryTitle = sourceEndpoint.EndPointType.EndPointTypeCategory.Title;

            return result;
        }
    }


}
