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
using PagedList;

namespace DynThings.Data.Repositories
{
    public class EndpointsRepository
    {
        private DynThingsEntities db = new DynThingsEntities();

        #region Get PagedList
        public IPagedList GetPagedList(string search, int pageNumber, int recordsPerPage)
        {
            IPagedList ends = db.Endpoints
              .Where(e => search == null || e.Title.Contains(search))
              .OrderBy(e => e.Title).ToList()
              .ToPagedList(pageNumber, recordsPerPage);
            return ends;
        }
        #endregion

        #region Find
        /// <summary>
        /// Find Endpoint by EndPoint ID
        /// </summary>
        /// <param name="id">Endpoint ID</param>
        /// <returns>Endpoint object</returns>
        public Endpoint Find(long id)
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

        #endregion

        #region Add
        public ResultInfo.Result Add(string title, long typeID, long deviceID)
        {
            Endpoint end = new Endpoint();

            end.GUID = Guid.NewGuid();
            end.KeyPass = Guid.NewGuid();
            end.PinCode = "0000";
            end.Title = title;
            end.DeviceID = deviceID;
            end.TypeID = typeID;
            db.Endpoints.Add(end);
            db.SaveChanges();
            return ResultInfo.GenerateOKResult();
        }

        #endregion

        #region Edit
        public ResultInfo.Result Edit(long id, string title, long typeID)
        {
            Endpoint end = db.Endpoints.Find(id);
            end.Title = title;
            end.TypeID = typeID;
            db.SaveChanges();
            return ResultInfo.GenerateOKResult();
        }

        #endregion




    }
}
