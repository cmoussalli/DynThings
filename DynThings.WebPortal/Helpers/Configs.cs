using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DynThings.Data.Configurations;

namespace DynThings.WebPortal.Helpers
{
    public static class Configs
    {
        public static int validateRecordsPerPage(int pageInput)
        {
            int result = pageInput;
            if (pageInput == 0)
            {
                result = Config.DefaultRecordsPerPage;
            }
            return result;
        }
    }
}
