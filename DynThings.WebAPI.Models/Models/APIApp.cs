using System.Collections.Generic;


namespace DynThings.WebAPI.Models
{
    /// <summary>
    /// The App object includes all child components such as API permissions, MediaFiles, Thing Types, Endpoint Types ... 
    /// </summary>
    public class APIApp
    {
        /// <summary>
        /// Unique identifier for the app, unique across all DynThing's Apps in DynThings Central.
        /// </summary>
        public System.Guid GUID { get; set; }

        /// <summary>
        /// The title of the app.
        /// </summary>
        public string Title { get; set; }

        /// <summary>
        /// The description of the app as per the app developers.
        /// </summary>
        public string Description { get; set; }

        /// <summary>
        /// App's first creation date.
        /// </summary>
        public System.DateTime CreateDate { get; set; }

        /// <summary>
        /// App version, update will be determined by this version number.
        /// </summary>
        public double Version { get; set; }

        public int StatusID { get; set; }

        public bool IsStoreApp { get; set; }

        public CentralDynAccount DevelopedBy { get; set; }

        public System.DateTime StoreAppLastUpdate { get; set; }


        public List<APIAppThingType> AppThingTypes { get; set; }
        public List<APIAppThingExtension> AppThingExtensions { get; set; }
        public List<APISystemEntity> AllowedEntities { get; set; }

        public APIApp()
        {
            AppThingTypes = new List<APIAppThingType>();
            AppThingExtensions = new List<APIAppThingExtension>();
            AllowedEntities = new List<APISystemEntity>();
            DevelopedBy = new CentralDynAccount();
        }

    }



}
