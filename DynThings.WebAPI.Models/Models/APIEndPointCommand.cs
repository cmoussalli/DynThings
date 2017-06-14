using System;
using System.Collections.Generic;

namespace DynThings.WebAPI.Models
{
    public class APIEndPointCommand
    {
        #region :: Public Properties ::

        public long ID { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string CommandCode { get; set; }

        #region Parents
        public APIEndPoint EndPoint { get; set; }
        #endregion

        #endregion

        #region :: Constructor ::
        public APIEndPointCommand()
        {
            this.ID = 0;
            this.Title = string.Empty;
            this.Description = string.Empty;
            this.CommandCode = string.Empty;
            this.EndPoint = new APIEndPoint();
        } 
        #endregion

    }
}