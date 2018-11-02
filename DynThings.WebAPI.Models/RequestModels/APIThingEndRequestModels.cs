using System;
using System.Collections.Generic;
using System.Text;

namespace DynThings.WebAPI.Models.RequestModels
{
    public class APIThingEndRequestModels
    {

        public class GetThingEndsList
        {
            public Guid Token { get; set; }

            #region :: Public Properties ::
            public string SearchFor { get; set; }

            public long? EndpointID { get; set; }
            public long? ThingID { get; set; }
            public long? LocationID { get; set; }
            public long? ViewID { get; set; }

            public long? ThingCategoryID { get; set; }
            public long? EndpointTypeID { get; set; }
            #endregion


            #region Load Parents
            public bool LoadThing { get; set; }
            public bool LoadEndpoint { get; set; }
            #endregion

            #region Load Children

            #endregion

            #region Paging
            public int PageNumber { get; set; }
            public int PageSize { get; set; }
            #endregion

            #region Constructor
            public GetThingEndsList()
            {
                PageNumber = 1;
                PageSize = 10;
            }
            #endregion
        }

    }
}
