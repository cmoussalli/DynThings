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
using PagedList;

namespace DynThings.Data.Repositories
{
    public class EndpointIOsRepository
    {
        private DynThingsEntities db = new DynThingsEntities();

        #region Get PagedList
        public IPagedList GetPagedList(Guid endPointGUID, int pageNumber, int recordsPerPage)
        {
            PagedList.IPagedList ios = db.EndPointIOs
              .Where(i => i.Endpoint.GUID == endPointGUID)
              .OrderByDescending(i => i.TimeStamp).Take(100).ToList()
              .ToPagedList(pageNumber, recordsPerPage);
            return ios;
        }
        #endregion


    }
}
