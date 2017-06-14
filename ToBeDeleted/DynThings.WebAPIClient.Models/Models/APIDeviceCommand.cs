namespace DynThings.WebAPIClient.Models
{
    public class APIDeviceCommand
    {
        #region Props

        public long ID { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string CommandCode { get; set; }


        #region Parents
        public APIDevice Device { get; set; }
        #endregion

        #endregion

        #region Constructor
        public APIDeviceCommand()
        {
            this.ID = 0;
            this.Title = "";
            this.Description = "";
            this.CommandCode= "";

            this.Device = new APIDevice();
        }
        #endregion
    }

}
