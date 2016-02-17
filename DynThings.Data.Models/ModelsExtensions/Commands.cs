using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace DynThings.Data.Models.ModelsExtensions
{
    public class Commands
    {
        public long ID { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }

        public long EndPointID { get; set; }
        public string Command { get; set; }
    }
}
