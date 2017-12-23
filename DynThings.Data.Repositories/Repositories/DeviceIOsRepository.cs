/////////////////////////////////////////////////////////////////
// Created by : Caesar Moussalli                               //
// TimeStamp  : 28-2-2016                                      //
// Content    : Handle DeviceIOs CRUD                          //
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
    public class DeviceIOsRepository
    {
        #region Constructor
        public DeviceIOsRepository(DynThingsEntities dbSource)
        {
            db = dbSource;
        }

        #endregion

        #region props
        public DynThingsEntities db;
        #endregion


        #region Enums
        public enum deviceIOType
        {
            Input = 1,
            Command = 2,
            Log = 3
        }
        #endregion

        #region Get PagedList
        public IPagedList GetPagedList(Guid deviceGUID, int pageNumber, int recordsPerPage)
        {
            PagedList.IPagedList ios = db.DeviceIOs
              .Where(i => i.Device.GUID == deviceGUID)
              .OrderByDescending(i => i.TimeStamp).Take(100).ToList()
              .ToPagedList(pageNumber, recordsPerPage);
            return ios;
        }
        #endregion

        #region Add
        public ResultInfo.Result Add(long deviceID, string value, deviceIOType ioType, DateTime executionTime)
        {
            try
            {
                DeviceIO endIO = new DeviceIO();
                endIO.DeviceID = deviceID;
                endIO.Valu = value;
                endIO.IOTypeID = long.Parse(ioType.GetHashCode().ToString());
                endIO.TimeStamp = DateTime.Now;
                endIO.ExecTimeStamp = executionTime;
                db.DeviceIOs.Add(endIO);
                db.SaveChanges();
                return ResultInfo.GenerateOKResult("Saved", endIO.ID);
            }
            catch
            {
                return ResultInfo.GetResultByID(1);
            }
        }

        public ResultInfo.Result Add(long deviceID, string value, deviceIOType ioType)
        {
            DeviceIO endIO = new DeviceIO();
            endIO.DeviceID = deviceID;
            endIO.Valu = value;
            endIO.IOTypeID = long.Parse(ioType.GetHashCode().ToString());
            endIO.TimeStamp = DateTime.Now;
            db.DeviceIOs.Add(endIO);
            db.SaveChanges();
            return ResultInfo.GenerateOKResult();
        }
        #endregion


        #region Submit IO
        internal ResultInfo.Result SubmitIO(Guid deviceKeyPass, deviceIOType ioType, string Valu)
        {
            try
            {
                List<Device> devs = db.Devices.Where(e => e.KeyPass == deviceKeyPass).ToList();
                if (devs.Count == 1)
                {
                    return Add(devs[0].ID, Valu, ioType);
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
        public List<DeviceIO> GetPendingCommandsList(Guid deviceKeyPass)
        {
            List<DeviceIO> ios = db.DeviceIOs
                .Where(i => i.Device.KeyPass == deviceKeyPass
                      && i.ExecTimeStamp == null)
                .OrderByDescending(i => i.ScheduleTimeStamp).Take(100).ToList()
                .ToList();
            return ios;
        }
        #endregion

        public int Calc(int x, int y)
        {
            int result = 0;
            result = x + y;

            return result;

        }
    }
}
