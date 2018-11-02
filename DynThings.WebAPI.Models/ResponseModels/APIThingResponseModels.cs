using System;
using System.Collections.Generic;
using System.Text;
using DynThings.WebAPI.Models;

namespace DynThings.WebAPI.Models.ResponseModels
{
    public class APIThingResponseModels
    {
        public class GetThingsList
        {
            public List<APIThing> Things { get; set; }


            public PagingInfoResponseModel PagingInfo { get; set; }

            public GetThingsList()
            {
                Things = new List<APIThing>();
            }
        }


    }
}
