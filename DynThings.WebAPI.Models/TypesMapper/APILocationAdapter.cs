using DynThings.Data.Models;
using DynThings.Data.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DynThings.WebAPI.Models.TypesMapper
{

    public static class APILocationAdapter
    {
        public static APILocation fromLocation(Location sourceLocation)
        {
            APILocation result = new APILocation();
            result.GUID = sourceLocation.GUID;
            result.IconID = sourceLocation.IconID;
            result.ID = sourceLocation.ID;
            result.isActive = sourceLocation.isActive;
            result.LatitudeX = sourceLocation.LatitudeX;
            result.LongitudeY = sourceLocation.LatitudeX;
            result.Status = sourceLocation.Status;
            result.Title = sourceLocation.Title;

            return result;
        }
    }


}
