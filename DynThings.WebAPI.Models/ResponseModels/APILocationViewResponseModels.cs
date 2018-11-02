using System;
using System.Collections.Generic;
using System.Text;
using DynThings.WebAPI.Models;

namespace DynThings.WebAPI.Models.ResponseModels
{
    public class APILocationViewResponseModels
    {
        public class GetLocationViewsList
        {
            public List<APILocationView> Views { get; set; }


            public PagingInfoResponseModel PagingInfo { get; set; }

            public GetLocationViewsList()
            {
                Views = new List<APILocationView>();
            }
        }


    }
}
