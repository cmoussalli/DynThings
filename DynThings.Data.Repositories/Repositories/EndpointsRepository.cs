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
using DynThings.Core;

namespace DynThings.Data.Repositories
{
    public class EndpointsRepository
    {
        #region Constructor
        public DynThingsEntities db{ get; set; }
        public EndpointsRepository(DynThingsEntities dynThingsEntities)
        {
            this.db = dynThingsEntities;
        }
        #endregion

        #region GetCount
        public int GetCount()
        {
            return db.Endpoints.Count();
        }
        #endregion

        #region GetList
        public List<Endpoint> GetList(bool EnableUnspecified)
        {
            List<Endpoint> ends = new List<Endpoint>();
            if (EnableUnspecified == true)
            {
                Endpoint end0 = new Endpoint();
                end0.ID = 0;
                end0.Title = "-Select All-";
                ends.Add(end0);
                ends.AddRange(db.Endpoints.OrderBy(e => e.Title).ToList());
            }
            return ends;
        }
        public List<Endpoint> GetList()
        {
            List<Endpoint> ends = db.Endpoints.Include("EndPointCommands").ToList();
            return ends;
        }
        #endregion

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

        #region FindByKeyPass
        public Endpoint FindByKeyPass(Guid endPointKeyPass)
        {
            Endpoint end = db.Endpoints.Where(l => l.KeyPass == endPointKeyPass).FirstOrDefault();
            return end;
        }
        #endregion

        #region Add
        public ResultInfo.Result Add(string title, long typeID, long deviceID,long thingID)
        {
            Endpoint end = new Endpoint();
            try
            {
                end.GUID = Guid.NewGuid();
                end.KeyPass = Guid.NewGuid();
                end.PinCode = "0000";
                end.Title = title;
                end.DeviceID = deviceID;
                end.TypeID = typeID;
                end.ThingID = thingID;
                db.Endpoints.Add(end);
                db.SaveChanges();
                return ResultInfo.GenerateOKResult("Saved", end.ID);
            }
            catch
            {
                return ResultInfo.GetResultByID(1);
            }
        }

        #endregion

        #region Edit
        public ResultInfo.Result Edit(long id, string title, long typeID,long thingID)
        {
            try
            {
                Endpoint end = db.Endpoints.Find(id);
                end.Title = title;
                end.TypeID = typeID;
                end.ThingID = thingID;
                db.SaveChanges();
                return ResultInfo.GenerateOKResult("Saved", end.ID);
            }
            catch
            {
                return ResultInfo.GetResultByID(1);
            }

        }

        #endregion

        #region Delete
        public ResultInfo.Result Delete(long id)
        {
            try
            {
                Endpoint end = db.Endpoints.Find(id);
                db.Endpoints.Remove(end);
                db.SaveChanges();
                return ResultInfo.GenerateOKResult("Deleted", end.ID);
            }
            catch
            {
                return ResultInfo.GetResultByID(1);
            }
        }

        #endregion

        #region Edit Dev Keys
        public ResultInfo.Result EditDevKeys(long id, Guid guid, Guid keyPass)
        {
            try
            {
                Endpoint end = db.Endpoints.Find(id);
                end.GUID = guid;
                end.KeyPass = keyPass;
                db.SaveChanges();
                return ResultInfo.GenerateOKResult("Saved", end.ID);
            }
            catch (Exception ex)
            {
                return ResultInfo.GenerateErrorResult(ex.Message);
            }

        }

        #endregion


    }
}
