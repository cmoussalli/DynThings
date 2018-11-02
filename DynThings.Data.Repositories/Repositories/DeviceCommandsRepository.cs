/////////////////////////////////////////////////////////////////
// Created by : Caesar Moussalli                               //
// TimeStamp  : 16-2-2016                                      //
// Content    : Handle DeviceCommands CRUD                     //
// Notes      :                                                //
/////////////////////////////////////////////////////////////////
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DynThings.Data.Models;
using PagedList;
using DynThings.Data;
using DynThings.Core;
using ResultInfo;

namespace DynThings.Data.Repositories
{
    public class DeviceCommandsRepository
    {
        #region Constructor
        public DeviceCommandsRepository(DynThingsEntities dbSource)
        {
            db = dbSource;
            repoDeviceIOs = new DeviceIOsRepository(dbSource);
        }

        #endregion

        #region props
        public DynThingsEntities db;
        DeviceIOsRepository repoDeviceIOs;
        #endregion



        #region Get List
        public List<DeviceCommand> GetListByDeviceGUID(Guid deviceGUID)
        {
            List<DeviceCommand> cmds = db.DeviceCommands.Where(c => c.Device.GUID == deviceGUID).ToList();
            return cmds;
        }
        #endregion

        #region Get PagedList
        public IPagedList<DeviceCommand> GetPagedList(string search, int pageNumber, int recordsPerPage)
        {
            IPagedList<DeviceCommand> cmds = db.DeviceCommands
              .Where(e => search == null || e.Title.Contains(search))
              .OrderBy(e => e.Title).ToList()
              .ToPagedList(pageNumber, recordsPerPage);
            return cmds;
        }

        //public IPagedList<DeviceCommand> GetPagedListByDeviceID(string search, long? deviceID, int pageNumber, int recordsPerPage)
        //{
        //    IPagedList<DeviceCommand> cmds = db.DeviceCommands
        //      .Where(e =>
        //      (e.Title.Contains(search) || (search == null || search == ""))
        //      && ((deviceID == null || deviceID == 0) || (e.DeviceID == deviceID))
        //      )
        //      .OrderBy(e => e.Title).ToList()
        //      .ToPagedList(pageNumber, recordsPerPage);
        //    return cmds;
        //}

        public IPagedList<DeviceCommand> GetPagedList(string search, long? deviceID,long? locationID, int pageNumber, int recordsPerPage)
        {
            IPagedList<DeviceCommand> cmds = db.DeviceCommands
              .Where(e =>
               (e.Title.Contains(search) || (search == null || search == ""))
              && ((deviceID == null || deviceID == 0) || (e.DeviceID == deviceID))
              && ((e.Device.LinkDevicesLocations.Any(l => l.LocationID == locationID)) || (locationID == null || locationID == 0))//Filter by locationID
              ).OrderBy(e => e.Title)
              .ToPagedList(pageNumber,recordsPerPage);
            return cmds;
        }
        #endregion

        #region Find
        /// <summary>
        /// Find Command by ID
        /// </summary>
        /// <param name="id">Command ID</param>
        /// <returns>Command object</returns>
        public DeviceCommand Find(long id)
        {
            DeviceCommand cmd = new DeviceCommand();
            List<DeviceCommand> cmds = db.DeviceCommands.Where(l => l.ID == id).ToList();
            if (cmds.Count == 1)
            {
                cmd = cmds[0];
            }
            else
            {
                throw new Exception("Not Found");
            }
            return cmd;
        }

        #endregion

        #region Add
        public ResultInfo.Result Add(string title, long deviceID, string description, string commandCode, string ownerID)
        {
            try
            {
                DeviceCommand cmd = new DeviceCommand();
                cmd.Title = title;
                cmd.DeviceID = deviceID;
                cmd.Description = description;
                cmd.CommandCode = commandCode;
                cmd.OwnerID = ownerID;
                db.DeviceCommands.Add(cmd);
                db.SaveChanges();
                return Result.GenerateOKResult("Saved", cmd.ID.ToString());
            }
            catch
            {
                return Result.GenerateFailedResult();
            }
        }

        #endregion

        #region Edit
        public ResultInfo.Result Edit(long id, string title, string description, long deviceID, string commandCode)
        {
            try
            {
                DeviceCommand cmd = db.DeviceCommands.Find(id);
                cmd.Title = title;
                cmd.Description = description;
                cmd.CommandCode = commandCode;
                cmd.DeviceID = deviceID;
                db.SaveChanges();
                return Result.GenerateOKResult("Saved", cmd.ID.ToString());
            }
            catch
            {
                return Result.GenerateFailedResult();
            }
        }

        #endregion

        #region Delete
        public ResultInfo.Result Detele(long id)
        {
            try
            {
                DeviceCommand cmd = db.DeviceCommands.Find(id);
                db.DeviceCommands.Remove(cmd);
                db.SaveChanges();
                return Result.GenerateOKResult("Deleted", cmd.ID.ToString());
            }
            catch
            {
                return Result.GenerateFailedResult();
            }
        }

        #endregion

        #region Execute
        public ResultInfo.Result Execute(long commandID, Guid deviceKeyPass, string ownerID)
        {
            try
            {
                DeviceCommand cmd = Find(commandID);
                if (cmd.Device.KeyPass == deviceKeyPass)
                {
                    return  repoDeviceIOs.Add(cmd.Device.ID, cmd.CommandCode, DeviceIOsRepository.deviceIOType.Command);
                }
                else
                {
                    return Result.GenerateFailedResult();
                }
            }
            catch
            {
                return Result.GenerateFailedResult();
            }
        }
        #endregion

    }
}
