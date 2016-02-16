/////////////////////////////////////////////////////////////////
// Created by : Caesar Moussalli                               //
// TimeStamp  : 3-2-2016                                       //
// Content    : Handle the database configuration              //
// Notes      :                                                //
//                                                             //
/////////////////////////////////////////////////////////////////

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DynThings.Data;
using DynThings.Data.Models;

namespace DynThings.Data.Configurations
{
    public static class Config
    {
        #region DB Context
        private static DynThingsEntities db = new DynThingsEntities();
        #endregion

        public static void Refresh()
        {
            db = new DynThingsEntities();

        }

        public static float DBVersion { get
            {
                return float.Parse( db.DynSettings.First().DBVersion);
            }
        }
        public static bool DevelopmentMode { get
            {
                return bool.Parse(db.DynSettings.First().DevelopmentMode);
            }
        }
        public static int DefaultRecordsPerPage { get
            {
                return int.Parse(db.DynSettings.First().DefaultRecordsPerPage);
            }
        }
        public static bool PublicAccess { get
            {
                return bool.Parse(db.DynSettings.First().PublicAccess);
            }
        }
        public static bool PublicSignUP { get
            {
                return bool.Parse(db.DynSettings.First().PublicSignUP);
            }
        }
        public static bool SystemLogger { get
            {
                return bool.Parse(db.DynSettings.First().EnableSystemLogger);
            }
        }
        public static Guid PlatformKey { get
            {
                return Guid.Parse(db.DynSettings.First().PlatformKey);
            }
        }

        public static void SetDevelopmentMode(bool activation)
        {
            DynSetting dset = db.DynSettings.First();
            dset.DevelopmentMode = activation.ToString();
            db.SaveChanges();
        }

        public static void SetDefaultRecordsPerPage(int recordsCount)
        {
            DynSetting dset = db.DynSettings.First();
            dset.DefaultRecordsPerPage = recordsCount.ToString();
            db.SaveChanges();
        }

        public static void SetPublicAccess(bool activation)
        {
            DynSetting dset = db.DynSettings.First();
            dset.PublicAccess = activation.ToString();
            db.SaveChanges();
        }

        public static void SetPublicSignUP(bool activation)
        {
            DynSetting dset = db.DynSettings.First();
            dset.PublicSignUP = activation.ToString();
            db.SaveChanges();
        }

        public static void SetSystemLogger(bool activation)
        {
            DynSetting dset = db.DynSettings.First();
            dset.EnableSystemLogger = activation.ToString();
            db.SaveChanges();
        }
        public static void SetPlatformKey(Guid newKey)
        {
            DynSetting dset = db.DynSettings.First();
            dset.PlatformKey = newKey.ToString();
            db.SaveChanges();
        }

        
    }


}
