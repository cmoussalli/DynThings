using DynThings.Data.Models;
using DynThings.Data.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DynThings.WebAPI.Models.TypesMapper
{

    public static class APIEndPointCommandAdapter
    {
        public static APIEndPointCommand fromEndpointCommand(EndPointCommand sourceEndpointCommand)
        {
            APIEndPointCommand result = new APIEndPointCommand();
            result.ID = sourceEndpointCommand.ID;
            result.Title = sourceEndpointCommand.Title;
            result.Description = sourceEndpointCommand.Description;
            result.CommandCode = sourceEndpointCommand.CommandCode;
            result.EndPointID = sourceEndpointCommand.EndPointID;

            return result;
        }
    }


}
