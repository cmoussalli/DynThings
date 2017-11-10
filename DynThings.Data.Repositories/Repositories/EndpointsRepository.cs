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
        public EndpointsRepository(DynThingsEntities dbSource)
        {
            db = dbSource;
        }

        #endregion

        #region props
        public DynThingsEntities db;
        #endregion

        #region GetCount
        public int GetCount()
        {
            return db.Endpoints.Count(e => e.ObjectStatusID != 2);
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
                ends.AddRange(db.Endpoints.Where(e => e.ObjectStatusID != 2).OrderBy(e => e.Title).ToList());
            }
            return ends;
        }
        public List<Endpoint> GetList()
        {
            List<Endpoint> ends = db.Endpoints.Include("EndPointCommands").Where(e => e.ObjectStatusID != 2).ToList();
            return ends;
        }
        #endregion

        #region Get PagedList
        public IPagedList GetPagedList(string search, int pageNumber, int recordsPerPage)
        {
            IPagedList ends = db.Endpoints
              .Where(e => (search == null || e.Title.Contains(search))
                            && e.ObjectStatusID != 2)
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
            List<Endpoint> ends = db.Endpoints.Where(l => l.GUID == guid && l.ObjectStatusID != 2).ToList();
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
            Endpoint end = db.Endpoints.Where(l => l.KeyPass == endPointKeyPass && l.ObjectStatusID != 2).FirstOrDefault();
            return end;
        }
        #endregion

        #region Add
        public ResultInfo.Result Add(string title, long typeID, long deviceID, long thingID, bool isNumericOnly, float? minValue, float? maxValue, float? lowRange, float? highRange)
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
                end.IsNumericOnly = isNumericOnly;
                end.MinValue = minValue;
                end.MaxValue = maxValue;
                end.LowRange = lowRange;
                end.HighRange = highRange;
                end.ObjectStatusID = 1;

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
        public ResultInfo.Result Edit(long id, string title, long typeID, long thingID, bool isNumericOnly, float? minValue, float? maxValue, float? lowRange, float? highRange)
        {
            try
            {
                Endpoint end = db.Endpoints.Find(id);
                end.Title = title;
                end.TypeID = typeID;
                end.ThingID = thingID;
                end.IsNumericOnly = isNumericOnly;
                end.MinValue = minValue;
                end.MaxValue = maxValue;
                end.LowRange = lowRange;
                end.HighRange = highRange;
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
                end.ObjectStatusID = 2;
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
