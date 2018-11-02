using System;
using System.Collections.Generic;
using System.Text;

namespace DynThings.WebAPI.Models.RequestModels
{
    public class APIThingRequestModels
    {

        public class GetThingsList
        {
            public Guid Token { get; set; }

            #region :: Public Properties ::
            public string SearchFor { get; set; }
            public long? LocationID { get; set; }
           
            #endregion


            #region Load Parents
            public bool LoadLocation { get; set; }
            #endregion

            #region Load Children
            public bool LoadEndPoints { get; set; }
            public bool LoadThingEnds { get; set; }
            public bool LoadThingExtensionValues { get; set; }
            #endregion

            #region Paging
            public int PageNumber { get; set; }
            public int PageSize { get; set; }
            #endregion

            #region Constructor
            public GetThingsList()
            {
                PageNumber = 1;
                PageSize = 10;
            }
            #endregion
        }

    }
}
