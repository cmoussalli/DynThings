using System;
using System.Collections.Generic;
using System.Text;
using DynThings.WebAPI.Models;

namespace DynThings.WebAPI.Models.ResponseModels
{
    public class APIEndpointResponseModels
    {
        public class GetEndpointsList
        {
            public List<APIEndPoint> Endpoints { get; set; }


            public PagingInfoResponseModel PagingInfo { get; set; }

            public GetEndpointsList()
            {
                Endpoints = new List<APIEndPoint>();
            }
        }


    }
}
