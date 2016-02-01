using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DynThings.Data.Models;

namespace DynThings.Data.Repositories
{
   public class EndpointsRepository
    {
        private DynThingsEntities db;
        public EndpointsRepository(DynThingsEntities dbContext)
        {
            db = dbContext;
        }

        public Endpoint Find(int id)
        {
            Endpoint end = new Endpoint();
            List<Endpoint> ends = db.Endpoints.Where(l => l.ID == id).ToList();
            if (ends.Count == 1)
            {
                end = ends[0];
            }
            else
            {
                throw new Exception("Not Found");
            }
            return end;
        }

        public Endpoint Find(Guid guid)
        {
            Endpoint end = new Endpoint();
            List<Endpoint> ends = db.Endpoints.Where(l => l.GUID == guid).ToList();
            if (ends.Count == 1)
            {
                end = ends[0];
            }
            else
            {
                throw new Exception("Not Found");
            }
            return end;
        }
    }
}
