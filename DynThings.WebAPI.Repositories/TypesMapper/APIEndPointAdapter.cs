using DynThings.Data.Models;
using DynThings.WebAPI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DynThings.WebAPI.TypesMapper
{

    public static class APIEndPointAdapter
    {
        public static APIEndPoint fromEndpoint(Endpoint sourceEndpoint, bool loadParents, bool loadChilds)
        {
            APIEndPoint result = new APIEndPoint();
            result.ID = sourceEndpoint.ID;
            result.GUID = sourceEndpoint.GUID;
            result.KeyPass = sourceEndpoint.KeyPass;
            result.Title = sourceEndpoint.Title;

            result.IsNumericOnly = sourceEndpoint.IsNumericOnly;
            result.MinValue = sourceEndpoint.MinValue;
            result.MaxValue = sourceEndpoint.MaxValue;
            result.LowRange = sourceEndpoint.LowRange;
            result.HighRange = sourceEndpoint.HighRange;

            result.LastIOID = sourceEndpoint.LastIOID;
            result.LastIOValue = sourceEndpoint.LastIOValue;
            result.LastIOTimeStamp = sourceEndpoint.LastIOTimeStamp;
            result.LastIOTimeStampUTC = sourceEndpoint.LastIOTimeStampUTC;

            #region Load Master Types
            result.EndPointType = APIEndPointTypeAdapter.fromEndPointType(sourceEndpoint.EndPointType);
            #endregion

            #region Load Parents
            if (loadParents)
            {
                #region Device
                result.Device = TypesMapper.APIDeviceAdapter.fromDevice(sourceEndpoint.Device, false, false);

                #endregion

                #region Thing
                result.Thing = TypesMapper.APIThingAdapter.fromThing(sourceEndpoint.Thing, false, false);

                #endregion

            }
            #endregion

            return result;
        }
    }


}
