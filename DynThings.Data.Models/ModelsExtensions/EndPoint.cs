using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DynThings.Data.Models
{
    public partial class Endpoint
    {
        private DynThingsEntities db = new DynThingsEntities();

        public string LastIOValue
        {
            get
            {
                List<EndPointIO> io =  this.EndPointIOs.OrderByDescending(eio => eio.TimeStamp).Take(1).ToList();
                string result = io[0].Valu;
                return result;
            }
        }
    }
}
