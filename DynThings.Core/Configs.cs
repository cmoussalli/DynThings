/////////////////////////////////////////////////////////////////
// Created by : Caesar Moussalli                               //
// TimeStamp  : 3-2-2016                                       //
// Content    : Handle the database configuration              //
// Notes      :                                                //
//                                                             //
/////////////////////////////////////////////////////////////////

using System;
using System.Linq;
using System.Collections.Generic;
using DynThings.Data.Models;
using System.Web.UI.WebControls;
using System.Web;
using System.Web.Configuration;
using System.Configuration;
using System.Data.SqlClient;

namespace DynThings.Core
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
        public static void Setup(string title, bool publicAccess, bool publicSignUp, int appLocalTime, bool developmentMode)
        {
            DynSetting dset = db.DynSettings.First();
            dset.PlatformTitle = title;
            dset.PublicAccess = publicAccess;
            dset.PublicSignUP = PublicSignUP;
            dset.App_TimeZone = appLocalTime;
            dset.DevelopmentMode = developmentMode;
            db.SaveChanges();
        }


        public static float DBVersion
        {
            get
            {
                return db.DynSettings.First().DBVersion;
            }
        }
        public static bool DevelopmentMode
        {
            get
            {
                return db.DynSettings.First().DevelopmentMode;
            }
        }
        public static int DefaultRecordsPerMaster
        {
            get
            {
                return db.DynSettings.First().DefaultRecordsPerMaster;
            }
        }

        public static int DefaultRecordsPerChild
        {
            get
            {
                return db.DynSettings.First().DefaultRecordsPerChild;
            }
        }
        public static bool PublicAccess
        {
            get
            {
                return db.DynSettings.First().PublicAccess;
            }
        }
        public static bool PublicSignUP
        {
            get
            {
                return db.DynSettings.First().PublicSignUP;
            }
        }
        public static bool SystemLogger
        {
            get
            {
                return db.DynSettings.First().EnableSystemLogger;
            }
        }
        public static Guid PlatformKey
        {
            get
            {
                return db.DynSettings.First().PlatformKey;
            }
        }
        public static int App_TimeZone
        {
            get
            {
                return db.DynSettings.First().App_TimeZone;
            }
        }
        public static string PlatformTitle
        {
            get
            {
                return db.DynSettings.First().PlatformTitle;
            }
        }
        

        public static void SetDevelopmentMode(bool activation)
        {
            DynSetting dset = db.DynSettings.First();
            dset.DevelopmentMode = activation;
            db.SaveChanges();
        }
        public static void SetDefaultRecordsPerPage(int recordsCount)
        {
            DynSetting dset = db.DynSettings.First();
            dset.DefaultRecordsPerMaster = recordsCount;
            db.SaveChanges();
        }
        public static void SetDefaultRecordsPerChild(int recordsCount)
        {
            DynSetting dset = db.DynSettings.First();
            dset.DefaultRecordsPerChild = recordsCount;
            db.SaveChanges();
        }
        public static void SetPublicAccess(bool activation)
        {
            DynSetting dset = db.DynSettings.First();
            dset.PublicAccess = activation;
            db.SaveChanges();
        }
        public static void SetPublicSignUP(bool activation)
        {
            DynSetting dset = db.DynSettings.First();
            dset.PublicSignUP = activation;
            db.SaveChanges();
        }
        public static void SetSystemLogger(bool activation)
        {
            DynSetting dset = db.DynSettings.First();
            dset.EnableSystemLogger = activation;
            db.SaveChanges();
        }
        public static void SetPlatformKey(Guid newKey)
        {
            DynSetting dset = db.DynSettings.First();
            dset.PlatformKey = newKey;
            db.SaveChanges();
        }
        public static void SetApp_TimeZone(int timeZone)
        {
            DynSetting dset = db.DynSettings.First();
            dset.App_TimeZone = timeZone;
            db.SaveChanges();
        }
        public static void SetPlatformTitle(string title)
        {
            DynSetting dset = db.DynSettings.First();
            dset.PlatformTitle = title;
            db.SaveChanges();
        }

        


    }


}
