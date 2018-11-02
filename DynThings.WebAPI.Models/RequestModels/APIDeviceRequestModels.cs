using System;
using System.Collections.Generic;
using System.Text;

namespace DynThings.WebAPI.Models.RequestModels
{
    public class APIDeviceRequestModels
    {

        public class GetDevicesList
        {
            public Guid Token { get; set; }

            #region :: Public Properties ::
            public string SearchFor { get; set; }
            public long LocationID { get; set; }

            #endregion


            #region Load Parents

            #endregion

            #region Load Children
            public bool LoadEndpoints { get; set; }
            public bool LoadDeviceCommands { get; set; }
            #endregion

            #region Paging
            public int PageNumber { get; set; }
            public int PageSize { get; set; }
            #endregion

            #region Constructor
            public GetDevicesList()
            {
                PageNumber = 1;
                PageSize = 10;
            }
            #endregion
        }

    }
}
