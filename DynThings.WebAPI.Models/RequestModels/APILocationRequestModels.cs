using System;
using System.Collections.Generic;
using System.Text;

namespace DynThings.WebAPI.Models.RequestModels
{
    public class APILocationRequestModels
    {

        public class GetLocationsList
        {
            public Guid Token { get; set; }

            #region :: Public Properties ::
            public string SearchFor { get; set; }
            public long? ViewID { get; set; }
           
            #endregion


            #region Load Parents
            public bool LoadViews { get; set; }
            #endregion

            #region Load Children
            public bool LoadThings { get; set; }
         
            #endregion

            #region Paging
            public int PageNumber { get; set; }
            public int PageSize { get; set; }
            #endregion

            #region Constructor
            public GetLocationsList()
            {
                PageNumber = 1;
                PageSize = 10;
            }
            #endregion
        }

    }
}
