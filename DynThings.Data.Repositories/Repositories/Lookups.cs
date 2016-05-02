using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DynThings.Data.Models;
using PagedList;

namespace DynThings.Data.Repositories
{
    public class Lookups
    {
        public DynThingsEntities db { get; set; }
        public Lookups(DynThingsEntities dynThingsEntities)
        {
            db = dynThingsEntities;
        }


        public void IOTypes()
        {
            Enum.GetValues(typeof(EndpointIOsRepository.EndPointIOType))
                .Cast<EndpointIOsRepository.EndPointIOType>()
                .Select(i => i.ToString()).ToList();
        }

        public List<Endpoint> EndPoints (bool EnableUnspecified)
        {
            List<Endpoint> endPoints = new List<Endpoint>();
            if (EnableUnspecified == true)
            {
                Endpoint endPoint0 = new Endpoint();
                endPoint0.ID = 0;
                endPoint0.Title = "-Select All-";
                endPoints.Add(endPoint0);

                endPoints.AddRange(db.Endpoints.OrderBy(e => e.Title));
            }


            return endPoints;
        }

    }
}
