using System;
using System.Collections.Generic;
using System.Text;
using DynThings.WebAPI.Models;

namespace DynThings.WebAPI.Models.ResponseModels
{
    public class APIThingEndResponseModels
    {
        public class GetThingEndsList
        {
            public List<APIThingEnd> ThingEnds { get; set; }


            public PagingInfoResponseModel PagingInfo { get; set; }

            public GetThingEndsList()
            {
                ThingEnds = new List<APIThingEnd>();
            }
        }


    }
}
