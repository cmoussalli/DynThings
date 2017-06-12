using DynThings.Data.Models;
using DynThings.WebAPI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DynThings.WebAPI.TypesMapper
{

    public static class APILocationViewAdapter
    {
        public static APILocationView fromLocationView(LocationView sourceLocationView, bool loadChilds)
        {
            APILocationView result = new APILocationView();
            result.ID = sourceLocationView.ID;
            result.IsActive = sourceLocationView.IsActive;
            result.OwnerID = sourceLocationView.OwnerID;
            result.Title = sourceLocationView.Title;
            result.X = sourceLocationView.X;
            result.Y = sourceLocationView.Y;
            result.Z = sourceLocationView.Z;
            result.LocationsCount = sourceLocationView.LinkLocationsLocationViews.Count;

            #region Load MasterTypes
            result.LocationViewType = TypesMapper.APILocationViewTypeAdapter.fromLocationViewType(sourceLocationView.LocationViewType);

            #endregion

            #region Load Parents

            #endregion

            #region Load Childs
            if (loadChilds)
            {
                #region Locations
                List<Location> locs = sourceLocationView.Locations;
                foreach (Location loc in locs)
                {
                    APILocation apiLocation = new APILocation();
                    apiLocation = TypesMapper.APILocationAdapter.fromLocation(loc, false, false);
                    result.Locations.Add(apiLocation);
                }

                #endregion

            }
            #endregion

            return result;
        }
    }

    //public static class LocationViewAdapter
    //{
    //    public static LocationView fromAPILocationView(APILocationView sourceAPILocationView)
    //    {
    //        LocationView result = new LocationView();
    //        result.ID = sourceAPILocationView.ID;
    //        result.GUID = System.Guid.Parse(sourceAPILocationView.Guid.ToString());
    //        result.KeyPass = System.Guid.Parse(sourceAPILocationView.KeyPass.ToString());
    //        result.Title = sourceAPILocationView.Title;
    //        result.PinCode = sourceAPILocationView.PinCode;
    //        result.StatusID = (long)sourceAPILocationView.StatusID;

    //        List<Endpoint> ens = new List<Endpoint>();
    //        foreach (APIEndPoint end in sourceAPILocationView.APIEndPoints)
    //        {
    //            Endpoint End = new Endpoint();
    //            End.ID = end.ID;
    //            End.GUID = end.GUID;
    //            End.KeyPass = end.KeyPass;
    //            End.PinCode = end.PinCode;
    //            End.Title = end.Title;
    //            End.TypeID = end.TypeID;
    //            End.LocationViewID = end.LocationViewID;

    //            ens.Add(End);
    //        }

    //        result.Endpoints = ens;
    //        return result;
    //    }
    //}

}
