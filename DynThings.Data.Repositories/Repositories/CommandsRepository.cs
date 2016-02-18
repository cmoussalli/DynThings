/////////////////////////////////////////////////////////////////
// Created by : Caesar Moussalli                               //
// TimeStamp  : 16-2-2016                                      //
// Content    : Handle Commands CRUD                           //
// Notes      :                                                //
/////////////////////////////////////////////////////////////////
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DynThings.Data.Models;
using PagedList;

namespace DynThings.Data.Repositories
{
    public class CommandsRepository
    {
        private DynThingsEntities db = new DynThingsEntities();

        #region Get PagedList
        public IPagedList GetPagedList(string search, int pageNumber, int recordsPerPage)
        {
            IPagedList cmds = db.Commands
              .Where(e => search == null || e.Title.Contains(search))
              .OrderBy(e => e.Title).ToList()
              .ToPagedList(pageNumber, recordsPerPage);
            return cmds;
        }
        #endregion

        #region Find
        /// <summary>
        /// Find Command by ID
        /// </summary>
        /// <param name="id">Command ID</param>
        /// <returns>Command object</returns>
        public Command Find(long id)
        {
            Command cmd = new Command();
            List<Command> cmds = db.Commands.Where(l => l.ID == id).ToList();
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

        /// <summary>
        /// Find Command by Command GUID
        /// </summary>
        /// <param name="guid">Command GUID</param>
        /// <returns>Command object</returns>
        public Command Find(int id)
        {
            Command cmd = new Command();
            List<Command> cmds = db.Commands.Where(l => l.ID == id).ToList();
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
            Command cmd = new Command();
            cmd.Title = title;
            cmd.DeviceID = deviceID;
            cmd.Description = description;
            cmd.CommandCode = commandCode;
            cmd.OwnerID = ownerID;
            db.Commands.Add(cmd);
            db.SaveChanges();
            ResultInfo.Result result = ResultInfo.GenerateOKResult();

            return result;
        }

        #endregion

        #region Edit
        public ResultInfo.Result Edit(long id, string title, string description, string commandCode)
        {
            Command cmd = db.Commands.Find(id);
            cmd.Title = title;
            cmd.Description = description;
            cmd.CommandCode = commandCode;
            db.SaveChanges();
            ResultInfo.Result result = ResultInfo.GenerateOKResult();
            return result;
        }

        #endregion


    }
}
