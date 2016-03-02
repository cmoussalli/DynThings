using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DynThings.WebAPI.Models
{
    public class CommandEnitity
    {
        #region :: Public Properties ::

        public string Title { get; set; }

        public string Description { get; set; }

        public string CommandCode { get; set; }

        #endregion

        #region :: Constructor ::
        public CommandEnitity()
        {
            this.Title = string.Empty;
            this.Description = string.Empty;
            this.CommandCode = string.Empty;
        } 
        #endregion

    }
}