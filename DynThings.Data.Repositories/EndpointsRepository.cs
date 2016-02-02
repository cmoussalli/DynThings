/////////////////////////////////////////////////////////////////
// Created by : Caesar Moussalli                               //
// TimeStamp  : 31-1-2016                                      //
// Content    : Handle Endpoint CRUD                           //
// Notes      :                                                //
/////////////////////////////////////////////////////////////////
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

        #region Constructor
        public EndpointsRepository(DynThingsEntities dbContext)
        {
            db = dbContext;
        }
        #endregion


        /// <summary>
        /// Find Endpoint by EndPoint ID
        /// </summary>
        /// <param name="id">Endpoint ID</param>
        /// <returns>Endpoint object</returns>
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

        /// <summary>
        /// Find Endpoint by EndPoint GUID
        /// </summary>
        /// <param name="guid">Endpoint GUID</param>
        /// <returns>Endpoint object</returns>
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
