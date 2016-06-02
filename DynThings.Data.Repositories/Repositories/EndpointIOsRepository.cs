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
        public DynThingsEntities db { get; set; }
        public EndpointIOsRepository(DynThingsEntities dynThingsEntities)
        {
            db = dynThingsEntities;
        }
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
            List<EndPointIO> ios = db.EndPointIOs.Where(l => l.ID == id).ToList();
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
            PagedList.IPagedList ios = db.EndPointIOs
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

            //PagedList.IPagedList ios = db.EndPointIOs
            //  .Where( i => i.Valu.Contains(search)
            //    //i => i.Endpoint.ID == endPointID
            //  && (i.EndPointID != null && i.EndPointID == endPointID)
            //  && (i.IOTypeID != null && i.IOTypeID == ioTypeID)
            //  //&& i.ExecTimeStamp > fromDate
            //  //&& i.ExecTimeStamp < toDate
            //  )
            //  .OrderByDescending(i => i.TimeStamp).Take(1000).ToList()
            //  .ToPagedList(pageNumber, recordsPerPage);
            return ios;
        }

        #endregion

        #region Add
        public ResultInfo.Result Add(long endPointID, string value, EndPointIOType ioType, DateTime executionTime)
        {
            try
            {
                EndPointIO endIO = new EndPointIO();
                endIO.EndPointID = endPointID;
                endIO.Valu = value;
                endIO.IOTypeID = long.Parse(ioType.GetHashCode().ToString());
                endIO.TimeStamp = executionTime;
                endIO.ExecTimeStamp = executionTime;
                endIO.ScheduleTimeStamp = executionTime;
                db.EndPointIOs.Add(endIO);
                db.SaveChanges();
                return ResultInfo.GenerateOKResult("Saved", endIO.ID);
            }
            catch
            {
                return ResultInfo.GetResultByID(1);
            }
        }

        public ResultInfo.Result Add(long endPointID, string value, EndPointIOType ioType, DateTime executionTime, DateTime scheduleTimeStamp)
        {
            try
            {
                EndPointIO endIO = new EndPointIO();
                endIO.EndPointID = endPointID;
                endIO.Valu = value;
                endIO.IOTypeID = long.Parse(ioType.GetHashCode().ToString());
                endIO.TimeStamp = executionTime;
                endIO.ExecTimeStamp = executionTime;
                endIO.ScheduleTimeStamp = scheduleTimeStamp;
                db.EndPointIOs.Add(endIO);
                db.SaveChanges();
                return ResultInfo.GenerateOKResult("Saved", endIO.ID);
            }
            catch
            {
                return ResultInfo.GetResultByID(1);
            }
        }

        public ResultInfo.Result Add(long endPointID, string value, EndPointIOType ioType)
        {
            try
            {
                EndPointIO endIO = new EndPointIO();
                endIO.EndPointID = endPointID;
                endIO.Valu = value;
                endIO.IOTypeID = long.Parse(ioType.GetHashCode().ToString());
                endIO.TimeStamp = DateTime.UtcNow.AddHours(double.Parse (endIO.Endpoint.UTC_Diff.ToString()));
                db.EndPointIOs.Add(endIO);
                db.SaveChanges();
                return ResultInfo.GenerateOKResult("Saved", endIO.ID);
            }
            catch
            {
                return ResultInfo.GetResultByID(1);
            }
        }
        #endregion

        #region Submit IO
        private ResultInfo.Result SubmitIO(Guid endPointKeyPass, EndPointIOType IOTypeID, string Valu, DateTime executionTimeStamp)
        {
            try
            {
                List<Endpoint> ends = db.Endpoints.Where(e => e.GUID == endPointKeyPass).ToList();
                if (ends.Count == 1)
                {
                    return Add(ends[0].ID, Valu, IOTypeID, executionTimeStamp);
                }
                else
                {
                    return ResultInfo.GetResultByID(1);
                }
            }
            catch
            {
                return ResultInfo.GetResultByID(1);
            }
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
