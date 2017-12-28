using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DynThings.Data.Models.ViewModels
{
    public class VMThing
    {
        public long ID { get; set; }
        public string Title { get; set; }
        public long CategoryID { get; set; }
        public string CategoryTitle { get; set; }


    }

    public class VMLocation
    {
        public long ID { get; set; }
        public string Title { get; set; }

    }

    public class VMDevice
    {
        public long ID { get; set; }
        public string Title { get; set; }
        public bool IsConnected { get; set; }

    }

    public class VMEndPoint
    {
        public long ID { get; set; }
        public string Title { get; set; }
        public long TypeID { get; set; }
        public string TypeTitle { get; set; }
        public string Measurement { get; set; }
        public long IconID { get; set; }
    }

    public class VMThingExtension
    {
        public long ID { get; set; }
        public Guid GUID { get; set; }
        public string Code { get; set; }
        public long ThingCategoryID { get; set; }
        public string Title { get; set; }
        public int DataTypeID { get; set; }
        public bool IsList { get; set; }
    }

    public class VMThingCategory
    {
        public long ID { get; set; }
        public string Title { get; set; }
    }

    public class VMDataType
    {
        public long ID { get; set; }
        public string Title { get; set; }
    }

}
