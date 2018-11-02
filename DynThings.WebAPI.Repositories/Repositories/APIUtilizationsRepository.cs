using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DynThings.Core;
using DynThings.Data.Models;
using DynThings.WebAPI.Models;
using DynThings.WebAPI.Repositories;
using PagedList;
using System.Security.Cryptography;
using ResultInfo;

namespace DynThings.WebAPI.Repositories
{
    public class APIUtilizationsRepository
    {
        #region Constructor
        public APIUtilizationsRepository(DynThingsEntities dbSource)
        {
            db = dbSource;
        }

        #endregion

        #region props
        private DynThingsEntities db;
        #endregion



        #region Methods
        #region Add
        public void AddSuccess(long appID,Guid token,long methodID,string notes)
        {
            Result result = Result.GenerateFailedResult();
            APIUtilisation ut = new APIUtilisation();
            ut.AppID = appID;
            ut.MethodID = methodID;
            ut.StatusID = 0;
            ut.TimeStampUTC = DateTime.UtcNow;
            ut.Token = token;
            ut.Notes = notes;
            db.APIUtilisations.Add(ut);
            db.SaveChanges();
        }

        public void AddFailed(Guid token, long methodID,string notes)
        {
            Result result = Result.GenerateFailedResult();
            APIUtilisation ut = new APIUtilisation();
            ut.MethodID = methodID;
            ut.StatusID = 1;
            ut.TimeStampUTC = DateTime.UtcNow;
            ut.Token = token;
            ut.Notes = notes;
            db.APIUtilisations.Add(ut);
            db.SaveChanges();
        }

        public void AddUnAuthorized(Guid token, long methodID,string notes)
        {
            Result result = Result.GenerateFailedResult();
            APIUtilisation ut = new APIUtilisation();
            ut.MethodID = methodID;
            ut.StatusID = 1;
            ut.TimeStampUTC = DateTime.UtcNow;
            ut.Token = token;
            ut.Notes = notes;
            db.APIUtilisations.Add(ut);
            db.SaveChanges();
        }

        #endregion



        #endregion

    }
}
