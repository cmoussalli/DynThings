﻿using System;
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
    public class DynUsersRepository
    {
        #region Constructor
        public DynUsersRepository(DynThingsEntities dbSource)
        {
            db = dbSource;
            repoRoles = new RolesRepository(dbSource);
        }

        #endregion

        #region props
        DynThingsEntities db;
        RolesRepository repoRoles;
        #endregion


        #region GetCount
        public int GetCount()
        {
            return db.AspNetUsers.Count();
        }
        #endregion

        #region Get PagedList
        public IPagedList GetPagedList(string search, int pageNumber, int recordsPerPage)
        {
            IPagedList usrs = db.AspNetUsers
                .Where(
                l => search == null || l.UserName.Contains(search))
                              .OrderBy(l => l.UserName).ToList()
              .ToPagedList(pageNumber, recordsPerPage);
            return usrs;
        }
        #endregion

        #region Find
        /// <summary>
        /// Find DynUser by DynUser ID
        /// </summary>
        /// <param name="ID">DynUser ID</param>
        /// <returns>DynUser object</returns>
        public AspNetUser Find(string ID)
        {
            AspNetUser usr = db.AspNetUsers.Find(ID);
            return usr;
        }
        #endregion

        #region Edit
        public ResultInfo.Result Edit(string id,string userName, string fullName)
        {
            try
            {
                AspNetUser usr = db.AspNetUsers.Find(id);
                usr.FullName = fullName;
                db.SaveChanges();
                return Result.GenerateOKResult("Saved",usr.Id.ToString());
            }
            catch (Exception ex)
            {
                return Result.GenerateFailedResult(ex.Message);
            }

        }

        #endregion

        #region Delete
        public ResultInfo.Result Delete(string id)
        {
            try
            {
                AspNetUser usr = db.AspNetUsers.Find(id);
                db.AspNetUsers.Remove(usr);
                db.SaveChanges();
                return Result.GenerateOKResult("Deleted", usr.Id.ToString());
            }
            catch
            {
                return Result.GenerateFailedResult();
            }
        }

        #endregion


        #region Extra Methods
        #region Get User Name
        public string GetUserName(string ID)
        {
            AspNetUser usr = db.AspNetUsers.Find(ID);
            return usr.FullName;
        }
        #endregion

        #region IsAdminitratorsExists
        public bool IsAdminitratorsExists()
        {
            bool result = false;

            List<AspNetUser> usrs = db.AspNetUsers.Where(u => u.AspNetRoles.Any(r => r.Id == "1")).ToList();
            if (usrs.Count > 0)
            {
                result = true;
            }
            return result ;
        }
        #endregion


        #endregion



        #region Attach Role
        public ResultInfo.Result AttachRole(string userID,string roleID)
        {
            AspNetUser usr = db.AspNetUsers.Find(userID);
            List<AspNetRole> usrRole = usr.AspNetRoles.Where(r => r.Id == roleID).ToList();
            if (usrRole.Count>0)
            {//Role already Exist
                return Result.GenerateFailedResult();
            }
            else
            {//Role not exist, must attach role to user
                AspNetRole rol = repoRoles.Find(roleID);
                usr.AspNetRoles.Add(rol);
                db.SaveChanges();
            }
            return Result.GenerateOKResult("Saved");
        }
        #endregion

        #region DeAttach Role
        public ResultInfo.Result DeAttachRole(string userID, string roleID)
        {
            AspNetUser usr = db.AspNetUsers.Find(userID);
            List<AspNetRole> usrRole = usr.AspNetRoles.Where(r => r.Id == roleID).ToList();
            if (usrRole.Count > 0)
            {//Role already Exist, must delete
                usr.AspNetRoles.Remove(usrRole[0]);
                db.SaveChanges();
                
            }
            else
            {//Role not exist, ERROR
                return Result.GenerateFailedResult();
            }
            return Result.GenerateOKResult("Saved");
        }
        #endregion



    }
}
