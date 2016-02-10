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
        #region GetList
        private DynThingsEntities db = new DynThingsEntities();

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
        public Device Find(int id)
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

        #region Add
        public UnitOfWork.RepositoryMethodResultType Add(string title,string pinCode)
        {
            Device dev = new Device();
            try {
                dev.GUID = Guid.NewGuid();
                dev.KeyPass = Guid.NewGuid();
                dev.StatusID = 1;
                dev.Title = title;
                dev.PinCode = pinCode;
                db.Devices.Add(dev);
                db.SaveChanges();
            }
            catch {
                return UnitOfWork.RepositoryMethodResultType.Failed;
            }
            return UnitOfWork.RepositoryMethodResultType.Ok ;
        }

        #endregion

        public UnitOfWork.RepositoryMethodResultType RegenerateKeyPass(Guid deviceGUID)
        {
            Device dev = db.Devices.Find(deviceGUID);
            try
            {
                dev.GUID = Guid.NewGuid();
                db.SaveChanges();
            }
            catch
            {
                return UnitOfWork.RepositoryMethodResultType.Failed;
            }
            return UnitOfWork.RepositoryMethodResultType.Ok;
        }

    }
}
