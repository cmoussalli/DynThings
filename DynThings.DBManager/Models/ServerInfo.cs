using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DynThings.DBManager.Models
{
    public class ServerInfo
    {
        public string ServerName { get; set; }
        public string Edition { get; set; }
        public string EngineEdition { get; set; }
        public string ProductLevel { get; set; }
        public string MachineName { get; set; }
        public string IsHadrEnabled { get; set; }
        public string HadrManagerStatus { get; set; }
        public bool IsClustered { get; set; }
        
    }



}
