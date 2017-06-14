namespace DynThings.WebAPIClient.Models
{
    public class APIDeviceStatus
    {
        #region Props
        public long ID { get; set; }
        public string Title { get; set; }
        #endregion

        #region Constructor
        public APIDeviceStatus()
        {
            this.ID = 0;
            this.Title = "";
        }
        #endregion
    }
}
