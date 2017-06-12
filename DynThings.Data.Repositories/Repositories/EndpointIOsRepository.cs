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
using DynThings.Core;

namespace DynThings.Data.Repositories
{
    public class EndpointIOsRepository
    {
        #region Constructor
        public EndpointIOsRepository(DynThingsEntities dbSource)
        {
            db = dbSource;
        }

        #endregion

        #region props
        public DynThingsEntities db;
        #endregion


        #region Enums
        public enum EndPointIOType
        {
            Input = 1,
            Command = 2,
            Log = 3
        }

        #endregion

        #region Find
        public EndPointIO Find(long id)
        {
            EndPointIO io = new EndPointIO();
            List<EndPointIO> ios = db.EndPointIOs
                .Include("Device")
                .Where(l => l.ID == id).ToList();
            if (ios.Count == 1)
            {
                io = ios[0];
            }
            else
            {
                throw new Exception("Not Found");
            }
            return io;
        }
        #endregion

        #region Get PagedList
        public IPagedList GetPagedList(long endPointID, int pageNumber, int recordsPerPage)
        {
            PagedList.IPagedList ios = db.EndPointIOs.Include("IOType")
              .Where(i => i.Endpoint.ID == endPointID)

              .OrderByDescending(i => i.TimeStamp).Take(100).ToList()
              .ToPagedList(pageNumber, recordsPerPage);
            return ios;

        }

        public IPagedList GetPagedList(string search, Guid endPointGUID, DateTime fromDate, DateTime toDate, int pageNumber, int recordsPerPage)
        {
            PagedList.IPagedList ios = db.EndPointIOs
              .Where(i => i.Endpoint.GUID == endPointGUID
              && i.Valu.Contains(search)
              && i.ExecTimeStamp > fromDate
              && i.ExecTimeStamp < toDate
              )
              .OrderByDescending(i => i.TimeStamp).Take(1000).ToList()
              .ToPagedList(pageNumber, recordsPerPage);
            return ios;
        }

        public IPagedList GetPagedList(string search, long endPointID, long ioTypeID, int pageNumber, int recordsPerPage)
        {
            var query = from q in db.EndPointIOs
                        where q.Valu.Contains(search)
                        select q;

            if (endPointID != 0)
            {
                query = query.Where(i => i.EndPointID == endPointID);
            }

            if (ioTypeID != 0)
            {
                query = query.Where(i => i.IOTypeID == ioTypeID);
            }

            PagedList.IPagedList ios = query.OrderByDescending(i => i.ExecTimeStamp)
                .Take(1000).ToList().ToPagedList(pageNumber, recordsPerPage);
            return ios;
        }

        public IPagedList GetLogsPagedList(string search, long LocationID, long ThingID, int pageNumber, int recordsPerPage)
        {
            db = new DynThingsEntities();
            List<EndPointIO> logs = db.EndPointIOs
              .Where(e => search == null || e.Valu.Contains(search)
              && e.Endpoint.Thing.LinkThingsLocations.Any(l => l.LocationID == LocationID)
              && e.IOTypeID == 3)
              .OrderByDescending(e => e.ExecTimeStamp).ToList();

            if (ThingID != 0)
            {
                logs = logs.Where(c => c.Endpoint.ThingID == ThingID).ToList();
            }

            IPagedList plLogs = logs.ToPagedList(pageNumber, recordsPerPage);
            return plLogs;
        }

        #endregion

        

        #region Submit Input
        public ResultInfo.Result SubmitInput(Guid endPointKeyPass,string value , DateTime? execTime)
        {
            ResultInfo.Result result = ResultInfo.GenerateErrorResult();
            try
            {
                //if (!execTime.HasValue)
                //{
                //    List<Endpoint> ends = db.Endpoints.Include("Device").Where(e => e.GUID == endPointKeyPass).ToList();
                //    if (ends.Count > 0)
                //    {
                //        execTime = DateTime.UtcNow.AddHours(ends[0].Device.UTC_Diff);
                //    }
                //    else
                //    {//endPointKeyPass not Exist
                //        result = ResultInfo.GenerateErrorResult("EndPoint KeyPass not Exist");
                //    }
                //}
                db.SubmitEndPointInput(endPointKeyPass,value,execTime);
                result = ResultInfo.GenerateOKResult();
            }
            catch(Exception ex)
            {
                result.Message = ex.InnerException.ToString();
            }
            return result;
        }
        #endregion

        #region Submit Log
        public ResultInfo.Result SubmitLog(Guid endPointKeyPass, string value, DateTime? execTime)
        {
            ResultInfo.Result result = ResultInfo.GenerateErrorResult();
            try
            {
                db.SubmitEndPointLog(endPointKeyPass, value, execTime);
                result = ResultInfo.GenerateOKResult();
            }
            catch { }
            return result;
        }
        #endregion

        #region Set Command as Executed
        public ResultInfo.Result SetCommandAsExecuted(long endPointCommandID, DateTime? execTime)
        {
            ResultInfo.Result result = ResultInfo.GenerateErrorResult();
            try
            {
                db.SubmitEndpointCommandExecuted(endPointCommandID,execTime);
                result = ResultInfo.GenerateOKResult();
            }
            catch { }
            return result;
        }
        #endregion

        #region Get Pending Commands
        public List<EndPointIO> GetPendingCommandsList(Guid endPointKeyPass)
        {
            List<EndPointIO> ios = db.EndPointIOs
                .Where(i => i.Endpoint.KeyPass == endPointKeyPass
                      && i.ExecTimeStamp == null)
                .OrderByDescending(i => i.ScheduleTimeStamp).Take(100).ToList()
                .ToList();
            return ios;
        }
        #endregion


    }
}
