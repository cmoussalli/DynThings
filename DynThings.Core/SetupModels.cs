using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DynThings.Core
{
    public class SetupModels
    {
        public class DatabaseSetup
        {
            public String Server { get; set; }
            public string DatabaseName { get; set; }
            public string User { get; set; }
            public string Password { get; set; }
 
        }

        public class PlatformConfig
        {
            public string Title { get; set; }
            public bool DevelopmentMode { get; set; }
            public bool PublicAccess { get; set; }
            public bool PublicSignUp { get; set; }
            public int TimeZone { get; set; }

        }

    }
}
