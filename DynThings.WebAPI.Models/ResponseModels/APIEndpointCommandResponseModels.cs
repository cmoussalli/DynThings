using System;
using System.Collections.Generic;
using System.Text;
using DynThings.WebAPI.Models;

namespace DynThings.WebAPI.Models.ResponseModels
{
    public class APIEndpointCommandResponseModels
    {
        public class GetEndpointCommandsList
        {
            public List<APIEndPointCommand> EndpointCommands { get; set; }


            public PagingInfoResponseModel PagingInfo { get; set; }

            public GetEndpointCommandsList()
            {
                EndpointCommands = new List<APIEndPointCommand>();
            }
        }


    }
}
