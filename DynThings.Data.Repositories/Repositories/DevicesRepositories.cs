/////////////////////////////////////////////////////////////////
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

namespace DynThings.Data.Repositories
{
    public class DevicesRepositories
    {
        private DynThingsEntities db = new DynThingsEntities();

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
        public ResultInfo.Result Add(string title)
        {
            Device dev = new Device();
            try
            {
                dev.GUID = Guid.NewGuid();
                dev.KeyPass = Guid.NewGuid();
                dev.StatusID = 1;
                dev.Title = title;
                dev.PinCode = "0000";
                db.Devices.Add(dev);
                db.SaveChanges();
            }
            catch
            {

                return UnitOfWork.resultInfo.GetResultByID(1);
            }
            return UnitOfWork.resultInfo.GenerateOKResult();
        }
        #endregion

        #region Edit
        /// <summary>
        /// Edit the Device Title
        /// </summary>
        /// <param name="id">Device ID for the editable Device</param>
        /// <param name="title">New Title</param>
        /// <returns>Result : Ok or Failed</returns>
        public ResultInfo.Result Edit(long id, string title)
        {
            Device dev = db.Devices.Find(id);
            dev.Title = title;
            db.SaveChanges();
            return UnitOfWork.resultInfo.GenerateOKResult();
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
            Device dev = db.Devices.Find(deviceID);

            dev.GUID = Guid.NewGuid();
            db.SaveChanges();

            return UnitOfWork.resultInfo.GenerateOKResult();
        }

        #endregion
    }
}
