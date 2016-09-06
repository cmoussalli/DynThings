using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DynThings.Core
{
    public static class StaticMenus
    {

        public static List<string> GetGridRowsCount()
        {
            List<string> result = new List<string>();
            result.Add("3");
            result.Add("5");
            result.Add("10");
            result.Add("20");
            result.Add("25");
            result.Add("50");
            result.Add("100");

            return result;
        }

        public static List<int> GetRegionalTimeOptions()
        {
            List<int> result = new List<int>();
            for (int x = -12; x < 13; x++)
            {
                result.Add(x);
            }
            return result;
        }

        public static class UserRoles
        {

            public static string GetAdminRoleName()
            {
                return "Admin";
            }

            public static string GetMonitorAndControlRoleName()
            {
                return "Monitor & Control";
            }

            public static string GetMonitorOnlyRoleName()
            {
                return "Monitor Only";
            }
        }



    }
}
