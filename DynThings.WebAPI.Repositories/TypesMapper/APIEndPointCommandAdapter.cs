using DynThings.Data.Models;
using DynThings.WebAPI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DynThings.WebAPI.TypesMapper
{

    public static class APIEndPointCommandAdapter
    {
        public static APIEndPointCommand fromEndpointCommand(EndPointCommand sourceEndpointCommand,bool loadParents,bool loadChilds)
        {
            APIEndPointCommand result = new APIEndPointCommand();
            result.ID = sourceEndpointCommand.ID;
            result.Title = sourceEndpointCommand.Title;
            result.Description = sourceEndpointCommand.Description;
            result.CommandCode = sourceEndpointCommand.CommandCode;

            #region Load Parents
            if (loadParents)
            {
                #region EndPoint
                result.EndPoint = TypesMapper.APIEndPointAdapter.fromEndpoint(sourceEndpointCommand.Endpoint,false,false);

                #endregion

            }
            #endregion

            return result;
        }
    }


}
