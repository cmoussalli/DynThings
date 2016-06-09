/////////////////////////////////////////////////////////////////
// Created by : Caesar Moussalli                               //
// TimeStamp  : 3-2-2016                                       //
// Content    : Extend the properties of Device Model          //
// Notes      : Don't add Behavior in this class               //
/////////////////////////////////////////////////////////////////

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DynThings.Data.Models
{
    public partial class AspNetUser
    {
        private DynThingsEntities db = new DynThingsEntities();


        public bool isAdmin
        {
            get
            {
                bool result = false;
                List<AspNetRole> rols = AspNetRoles.Where(r => r.Id == "1").ToList();
                if (rols.Count > 0)
                {
                    result = true;
                }
                return result;
            }
        }

        public bool isMonitorAndControl
        {
            get
            {
                bool result = false;
                List<AspNetRole> rols = AspNetRoles.Where(r => r.Id == "2").ToList();
                if (rols.Count > 0)
                {
                    result = true;
                }
                return result;
            }
        }

        public bool isMonitorOnly
        {
            get
            {
                bool result = false;
                List<AspNetRole> rols = AspNetRoles.Where(r => r.Id == "3").ToList();
                if (rols.Count > 0)
                {
                    result = true;
                }
                return result;
            }
        }

    }
}
