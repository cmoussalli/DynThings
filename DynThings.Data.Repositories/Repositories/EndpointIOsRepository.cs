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
            return ResultInfo.GenerateOKResult();
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
            return ResultInfo.GenerateOKResult();
        }
        #endregion

        #region Submit IO
        private ResultInfo.Result SubmitIO(Guid endPointKeyPass, EndPointIOType IOTypeID , string Valu, DateTime executionTimeStamp)
        {
            List<Endpoint> ends = db.Endpoints.Where(e => e.GUID == endPointKeyPass).ToList();
            if (ends.Count == 1)
            {
                Add(ends[0].ID, Valu, IOTypeID, executionTimeStamp);
                return ResultInfo.GenerateFailedResult("Ok");
            }
            else
            {
               return ResultInfo.GenerateFailedResult("Keypass is not valid");
            }
        }

        #endregion
    }
}
