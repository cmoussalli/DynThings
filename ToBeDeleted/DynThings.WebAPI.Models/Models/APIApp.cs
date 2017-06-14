using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DynThings.WebAPI.Models
{
    public class APIApp
    {

        public System.Guid GUID { get; set; }

        public string Title { get; set; }

        public string Description { get; set; }

        public string CreatedByID { get; set; }

        public System.DateTime CreateDate { get; set; }

        public int StatusID { get; set; }

        public bool IsStoreApp { get; set; }

        public string DevelopedByName { get; set; }

        public double Version { get; set; }


        public List<APISystemEntity> AllowedEntities { get; set; }
    }


    public class APISystemEntity
    {
        public long ID { get; set; }
        public string Title { get; set; }
    }
}
