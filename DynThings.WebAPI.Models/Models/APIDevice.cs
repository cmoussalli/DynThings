using System;
using System.Collections.Generic;

namespace DynThings.WebAPI.Models
{
    public class APIDevice
    {
        #region :: Public Properties ::

        public long ID { get; set; }
        public Guid Guid { get; set; }
        public Guid KeyPass { get; set; }
        public string Title { get; set; }
        public int UTC_Diff { get; set; }
        public int IsConnectedDelay { get; set; }
        public bool IsConnected { get; set; }
        public Nullable<System.DateTime> LastConnectionTimeStamp { get; set; }

        #region Master Types
        public APIDeviceStatus DeviceStatus { get; set; }

        #endregion

        #region Parents

        #endregion

        #region Childs
        public List<APIEndPoint> EndPoints { get; set; }
        public List<APIDeviceCommand> DeviceCommands { get; set; }

        #endregion

        #endregion

        #region :: Constructor ::
        public APIDevice()
        {
            this.ID = 0;
            this.Guid = Guid.Empty;
            this.KeyPass = Guid.Empty;
            this.Title = "";
            this.UTC_Diff = 0;
            this.IsConnectedDelay = 0;
            this.IsConnected = false;
            this.DeviceStatus = new APIDeviceStatus();
            this.DeviceCommands = new List<APIDeviceCommand>();
            this.EndPoints = new List<APIEndPoint>();
        }
        #endregion
    }

   

}