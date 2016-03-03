using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DynThings.Data.Models;
using DynThings.Core;

namespace DynThings.WebPortal.Helpers
{
    public static class Configs
    {
        public static int validateRecordsPerMaster(int pageInput)
        {
            int result = pageInput;
            if (result < 1)
            {
                result = Config.DefaultRecordsPerMaster;
            }
            return result;
        }

        public static int validateRecordsPerChild(int pageInput)
        {
            int result = pageInput;
            if (result < 1)
            {
                result = Config.DefaultRecordsPerChild;
            }
            return result;
        }
    }
}
