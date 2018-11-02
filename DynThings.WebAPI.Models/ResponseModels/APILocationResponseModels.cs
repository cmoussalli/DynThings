using System;
using System.Collections.Generic;
using System.Text;
using DynThings.WebAPI.Models;

namespace DynThings.WebAPI.Models.ResponseModels
{
    public class APILocationResponseModels
    {
        public class GetLocationsList
        {
            public List<APILocation> Locations { get; set; }


            public PagingInfoResponseModel PagingInfo { get; set; }

            public GetLocationsList()
            {
                Locations = new List<APILocation>();
            }
        }


    }
}
