using System;
using System.Collections.Generic;
using System.Text;

namespace DynThings.WebAPI.Models
{
    public class APIAppMediaFile
    {
        public long ID { get; set; }
        public Guid GUID { get; set; }
        public long AppID { get; set; }
        public string Title { get; set; }

    }
}
