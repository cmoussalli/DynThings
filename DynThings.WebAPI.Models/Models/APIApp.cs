using System.Collections.Generic;


namespace DynThings.WebAPI.Models
{
    public class APIApp
    {

        public System.Guid GUID { get; set; }

        public string Title { get; set; }

        public string Description { get; set; }

        public System.DateTime CreateDate { get; set; }

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
