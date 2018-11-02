﻿/////////////////////////////////////////////////////////////////
// Created by : Caesar Moussalli                               //
// TimeStamp  : 31-1-2016                                      //
// Content    : Handle Device CRUD                             //
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
using ResultInfo;

namespace DynThings.Data.Repositories
{
    public class DevicesRepository
    {
        #region Constructor
        public DevicesRepository(DynThingsEntities dbSource)
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
            return db.Devices.Count();
        }
        #endregion

        #region GetList
        /// <summary>
        /// Get list of Devices
        /// </summary>
        /// <returns>List of Devices </returns>
        public List<Device> GetList()
        {
            List<Device> devices = db.Devices.ToList();
            return devices;
        }
        #endregion

        #region Get PagedList
        public IPagedList GetPagedList(string search, int pageNumber, int recordsPerPage)
        {
            IPagedList devs = db.Devices
              .Where(e => search == null || e.Title.Contains(search))
              .OrderBy(e => e.Title).ToList()
              .ToPagedList(pageNumber, recordsPerPage);
            return devs;
        }

        public IPagedList GetPagedList(string search, long locationID, int pageNumber, int recordsPerPage)
        {
            IPagedList devs = db.Devices
              .Where(e => search == null || e.Title.Contains(search)
              && e.LinkDevicesLocations.Any(l => l.LocationID == locationID)
              )
              .OrderBy(e => e.Title).ToList()
              .ToPagedList(pageNumber, recordsPerPage);
            return devs;
        }

        #endregion

        #region Find
        /// <summary>
        /// Find Device by Device ID
        /// </summary>
        /// <param name="id">Device ID</param>
        /// <returns>Device object</returns>
        public Device Find(long id)
        {
            Device dev = new Device();
            List<Device> devs = db.Devices.Where(l => l.ID == id).ToList();
            if (devs.Count == 1)
            {
                dev = devs[0];
            }
            else
            {
                throw new Exception("Not Found");
            }
            return dev;
        }

        /// <summary>
        /// Find Device by Device GUID
        /// </summary>
        /// <param name="guid">Device GUID</param>
        /// <returns>Device object</returns>
        public Device Find(Guid guid)
        {
            Device dev = new Device();
            List<Device> devs = db.Devices.Where(l => l.GUID == guid).ToList();
            if (devs.Count == 1)
            {
                dev = devs[0];
            }
            else
            {
                throw new Exception("Not Found");
            }
            return dev;
        }
        #endregion

        #region FindByKeyPass
        /// <summary>
        /// Find Device by Device ID
        /// </summary>
        /// <param name="id">Device ID</param>
        /// <returns>Device object</returns>
        public Device FindByKeyPass(Guid deviceKeyPass)
        {
            Device devs = db.Devices.Where(l => l.KeyPass == deviceKeyPass).FirstOrDefault();
            return devs;
        }
        #endregion

        #region Add
        /// <summary>
        /// Add new Device
        /// </summary>
        /// <param name="title">Device's Title</param>
        /// <returns>Result : Ok or Failed</returns>
        public ResultInfo.Result Add(string title,int utc_Diff,int IsConnectedDelay)
        {
            Device dev = new Device();
            try
            {
                dev.GUID = Guid.NewGuid();
                dev.KeyPass = Guid.NewGuid();
                dev.StatusID = 1;
                dev.Title = title;
                dev.PinCode = "0000";
                dev.UTC_Diff = utc_Diff;
                dev.IsConnected = false;
                dev.IsConnectedDelay = IsConnectedDelay;
                db.Devices.Add(dev);
                db.SaveChanges();
            }
            catch(Exception ex)
            {
                return Result.GenerateFailedResult(ex.InnerException.ToString());
            }
            return Result.GenerateOKResult("Saved", dev.ID.ToString());
        }
        #endregion

        #region Edit
        /// <summary>
        /// Edit the Device Title
        /// </summary>
        /// <param name="id">Device ID for the editable Device</param>
        /// <param name="title">New Title</param>
        /// <returns>Result : Ok or Failed</returns>
        public ResultInfo.Result Edit(long id, string title,int utc_Diff,int IsConnectedDelay)
        {
            try
            {
                Device dev = db.Devices.Find(id);
                dev.Title = title;
                dev.UTC_Diff = utc_Diff;
                dev.IsConnectedDelay = IsConnectedDelay;
                db.SaveChanges();
                return Result.GenerateOKResult("Saved", dev.ID.ToString());
            }
            catch
            {
                return Result.GenerateFailedResult();
            }
        }

        #endregion

        #region Delete
        public ResultInfo.Result Delete(long id)
        {
            try
            {
                Device dev = db.Devices.Find(id);
                
                db.Devices.Remove(dev);
                db.SaveChanges();
                return Result.GenerateOKResult("Deleted", dev.ID.ToString());
            }
            catch(Exception ex)
            {
                return Result.GenerateFailedResult(ex.Message + " -- " + ex.InnerException);
            }
        }

        #endregion

        #region RenewKeyPass
        /// <summary>
        /// Generate a new KeyPass for a specific device
        /// </summary>
        /// <param name="deviceID">Device ID for the editable Device</param>
        /// <returns>Result : Ok or Failed</returns>
        public ResultInfo.Result RenewKeyPass(long deviceID)
        {
            try
            {
                Device dev = db.Devices.Find(deviceID);
                dev.GUID = Guid.NewGuid();
                db.SaveChanges();
                return Result.GenerateOKResult("Saved", dev.ID.ToString());
            }
            catch
            {
                return Result.GenerateFailedResult();
            }
        }

        #endregion
    }
}
