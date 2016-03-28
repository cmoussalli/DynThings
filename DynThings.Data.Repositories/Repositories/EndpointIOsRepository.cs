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

        public IPagedList GetPagedList(string search, long endPointID,long ioTypeID, int pageNumber, int recordsPerPage)
        {
            PagedList.IPagedList ios = db.EndPointIOs
              .Where( i => i.Valu.Contains(search)
                //i => i.Endpoint.ID == endPointID
              && (i.EndPointID != null && i.EndPointID == endPointID)
              && (i.IOTypeID != null && i.IOTypeID == ioTypeID)
              //&& i.ExecTimeStamp > fromDate
              //&& i.ExecTimeStamp < toDate
              )
              .OrderByDescending(i => i.TimeStamp).Take(1000).ToList()
              .ToPagedList(pageNumber, recordsPerPage);
            return ios;
        }

        #endregion

        #region Add
        public ResultInfo.Result Add(long endPointID, string value, EndPointIOType ioType, DateTime executionTime)
        {
            EndPointIO cmdIO = new EndPointIO();
            cmdIO.EndPointID = endPointID;
            cmdIO.Valu = value;
            cmdIO.IOTypeID = long.Parse(ioType.GetHashCode().ToString());
            cmdIO.TimeStamp = DateTime.Now;
            cmdIO.ExecTimeStamp = executionTime;
            db.EndPointIOs.Add(cmdIO);
            db.SaveChanges();
            return UnitOfWork.resultInfo.GenerateOKResult();
        }

        public ResultInfo.Result Add(long endPointID, string value, EndPointIOType ioType)
        {
            EndPointIO endIO = new EndPointIO();
            endIO.EndPointID = endPointID;
            endIO.Valu = value;
            endIO.IOTypeID = long.Parse(ioType.GetHashCode().ToString());
            endIO.TimeStamp = DateTime.Now;
            db.EndPointIOs.Add(endIO);
            db.SaveChanges();
            return UnitOfWork.resultInfo.GenerateOKResult();
        }
        #endregion

        #region Submit IO
        private ResultInfo.Result SubmitIO(Guid endPointKeyPass, EndPointIOType IOTypeID, string Valu, DateTime executionTimeStamp)
        {
            List<Endpoint> ends = db.Endpoints.Where(e => e.GUID == endPointKeyPass).ToList();
            if (ends.Count == 1)
            {
                Add(ends[0].ID, Valu, IOTypeID, executionTimeStamp);
                return UnitOfWork.resultInfo.GenerateOKResult();
            }
            else
            {
                return UnitOfWork.resultInfo.GetResultByID(1);
            }
        }

        #endregion
    }
}
