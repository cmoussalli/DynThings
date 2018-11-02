using System;
using System.Collections.Generic;
using System.Text;

namespace DynThings.WebAPI.Models.RequestModels
{
    public class APIDeviceCommandRequestModels
    {

        public class GetDeviceCommandsList
        {
            public Guid Token { get; set; }

            #region :: Public Properties ::
            public string SearchFor { get; set; }
            public long DeviceID { get; set; }
            public long LocationID { get; set; }
            #endregion


            #region Load Parents
            public bool LoadDevice { get; set; }
            #endregion

            #region Load Children

            #endregion

            #region Paging
            public int PageNumber { get; set; }
            public int PageSize { get; set; }
            #endregion

            #region Constructor
            public GetDeviceCommandsList()
            {
                PageNumber = 1;
                PageSize = 10;
            }
            #endregion
        }

    }
}
