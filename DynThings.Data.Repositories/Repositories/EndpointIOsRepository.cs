/////////////////////////////////////////////////////////////////
// Created by : Caesar Moussalli                               //
// TimeStamp  : 31-1-2016                                      //
// Content    : Handle EndpointIOs CRUD                        //
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
    public class EndpointIOsRepository
    {
        private DynThingsEntities db = new DynThingsEntities();

        /// <summary>
        /// Get list of Endpoint IOs based on Endpoint GUID
        /// </summary>
        /// <param name="endpointGuid">Endpoint GUID</param>
        /// <param name="recordsCount">Requested records count</param>
        /// <returns>List of Endpoint IOs</returns>
        public List<EndPointIO> GetEndpointIOs(Guid endpointGuid,int recordsCount)
        {
            List<EndPointIO> IOs = db.EndPointIOs.Where(i => i.Endpoint.GUID == endpointGuid).Take(recordsCount).OrderByDescending(i => i.TimeStamp).ToList();
            return IOs;
        }


    }
}
