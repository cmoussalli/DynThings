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

        //#region DB Context
        //private static DynThingsEntities db = new DynThingsEntities();
        //#endregion

        public static void Refresh()
        {
            DynThingsEntities db = new DynThingsEntities();
            db = new DynThingsEntities();

        }
        public static void Setup(string title, bool publicAccess, bool publicSignUp, int appLocalTime, bool developmentMode)
        {
            DynThingsEntities db = new DynThingsEntities();
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
                DynThingsEntities db = new DynThingsEntities();
                return db.DynSettings.First().DBVersion;
            }
        }
        public static bool DevelopmentMode
        {
            get
            {
                DynThingsEntities db = new DynThingsEntities();
                return db.DynSettings.First().DevelopmentMode;
            }
        }
        public static int DefaultRecordsPerMaster
        {
            get
            {
                DynThingsEntities db = new DynThingsEntities();
                return db.DynSettings.First().DefaultRecordsPerMaster;
            }
        }

        public static int DefaultRecordsPerChild
        {
            get
            {
                DynThingsEntities db = new DynThingsEntities();
                return db.DynSettings.First().DefaultRecordsPerChild;
            }
        }
        public static bool PublicAccess
        {
            get
            {
                DynThingsEntities db = new DynThingsEntities();
                return db.DynSettings.First().PublicAccess;
            }
        }
        public static bool PublicSignUP
        {
            get
            {
                try
                {

                DynThingsEntities db = new DynThingsEntities();
                return db.DynSettings.First().PublicSignUP;
                }
                catch(Exception ex)
                {
                    return false;
                }
            }
        }
        public static bool SystemLogger
        {
            get
            {
                DynThingsEntities db = new DynThingsEntities();
                return db.DynSettings.First().EnableSystemLogger;
            }
        }
        public static Guid PlatformKey
        {
            get
            {
                DynThingsEntities db = new DynThingsEntities();
                return db.DynSettings.First().PlatformKey;
            }
        }
        public static int App_TimeZone
        {
            get
            {
                DynThingsEntities db = new DynThingsEntities();
                return db.DynSettings.First().App_TimeZone;
            }
        }
        public static string PlatformTitle
        {
            get
            {
                DynThingsEntities db = new DynThingsEntities();
                return db.DynSettings.First().PlatformTitle;
            }
        }
        public static DateTime LastCentralSync
        {
            get
            {
                DynThingsEntities db = new DynThingsEntities();
                return db.DynSettings.First().LastCentralSync;
            }
        }
        public static DateTime DeploymentTimeStamp
        {
            get
            {
                DynThingsEntities db = new DynThingsEntities();
                return db.DynSettings.First().DeploymentTimeStamp;
            }
        }
        public static Mails.MailsConfig MailsConfig
        {
            get
            {
                Mails.MailsConfig config = new Mails.MailsConfig();
                DynThingsEntities db = new DynThingsEntities();
                DynSetting setting = db.DynSettings.First();
                config.Host = setting.SMTPAddress;
                config.Port = (int)setting.SMTPPort;
                config.Sender = setting.NotifcationMail;
                return config;
            }
        }



        public static void SetDevelopmentMode(bool activation)
        {
            DynThingsEntities db = new DynThingsEntities();
            DynSetting dset = db.DynSettings.First();
            dset.DevelopmentMode = activation;
            db.SaveChanges();
        }
        public static void SetDefaultRecordsPerPage(int recordsCount)
        {
            DynThingsEntities db = new DynThingsEntities();
            DynSetting dset = db.DynSettings.First();
            dset.DefaultRecordsPerMaster = recordsCount;
            db.SaveChanges();
        }
        public static void SetDefaultRecordsPerChild(int recordsCount)
        {
            DynThingsEntities db = new DynThingsEntities();
            DynSetting dset = db.DynSettings.First();
            dset.DefaultRecordsPerChild = recordsCount;
            db.SaveChanges();
        }
        public static void SetPublicAccess(bool activation)
        {
            DynThingsEntities db = new DynThingsEntities();
            DynSetting dset = db.DynSettings.First();
            dset.PublicAccess = activation;
            db.SaveChanges();
        }
        public static void SetPublicSignUP(bool activation)
        {
            DynThingsEntities db = new DynThingsEntities();
            DynSetting dset = db.DynSettings.First();
            dset.PublicSignUP = activation;
            db.SaveChanges();
        }
        public static void SetSystemLogger(bool activation)
        {
            DynThingsEntities db = new DynThingsEntities();
            DynSetting dset = db.DynSettings.First();
            dset.EnableSystemLogger = activation;
            db.SaveChanges();
        }
        public static void SetPlatformKey(Guid newKey)
        {
            DynThingsEntities db = new DynThingsEntities();
            DynSetting dset = db.DynSettings.First();
            dset.PlatformKey = newKey;
            db.SaveChanges();
        }
        public static void SetApp_TimeZone(int timeZone)
        {
            DynThingsEntities db = new DynThingsEntities();
            DynSetting dset = db.DynSettings.First();
            dset.App_TimeZone = timeZone;
            db.SaveChanges();
        }
        public static void SetPlatformTitle(string title)
        {
            DynThingsEntities db = new DynThingsEntities();
            DynSetting dset = db.DynSettings.First();
            dset.PlatformTitle = title;
            db.SaveChanges();
        }

        public static void SetLastCentralSync()
        {
            DynThingsEntities db = new DynThingsEntities();
            DynSetting dset = db.DynSettings.First();
            dset.LastCentralSync = DateTime.UtcNow;
            db.SaveChanges();
        }

        public static void SetMailsConfig(Mails.MailsConfig mailConfig)
        {
            DynThingsEntities db = new DynThingsEntities();
            DynSetting dset = db.DynSettings.First();
            dset.SMTPAddress = mailConfig.Host;
            dset.SMTPPort = mailConfig.Port;
            dset.NotifcationMail = mailConfig.Sender;
            db.SaveChanges();
        }


    }


}
