using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DynThings.Data.Models.ProcedureModels
{
    public class DBServerInfo
    {
        public string Name { get; set; }
        public string Edition { get; set; }
        public string Version { get; set; }
        public long? Memory { get; set; }


    }
}
