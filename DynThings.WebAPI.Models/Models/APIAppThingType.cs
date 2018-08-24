using System.Collections.Generic;


namespace DynThings.WebAPI.Models
{
    public class APIAppThingType
    {
        public long ID { get; set; }
        public System.Guid GUID { get; set; }
        public string Code { get; set; }
        public string Title { get; set; }
        public long AppId { get; set; }
        public string IconGuid { get; set; }



    }
}
