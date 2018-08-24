using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DynThings.Data.Models.ViewModels
{
  

    public class StoreAppAction
    {
        public string AppGuid { get; set; }
        public bool IsInstalled { get; set; }
        public bool IsLatestVersion { get; set; }
        public float LatestVersion { get; set; }
        public double InstalledVersion { get; set; }

    }
}
