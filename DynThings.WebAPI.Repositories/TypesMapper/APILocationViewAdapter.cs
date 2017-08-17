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


}
