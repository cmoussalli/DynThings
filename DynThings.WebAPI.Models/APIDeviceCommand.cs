using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DynThings.WebAPI.Models
{
    public class APIDeviceCommand
    {
        #region Props

        public long ID { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public Nullable<long> DeviceID { get; set; }
        public string CommandCode { get; set; }
        public string OwnerID { get; set; }

        #endregion

        #region Constructor
        public APIDeviceCommand()
        {
            this.ID = 0;
            this.Title = "";
            this.Description = "";
            this.DeviceID = 0;
            this.CommandCode= "";
            this.OwnerID = "";
        }
        #endregion
    }

}
