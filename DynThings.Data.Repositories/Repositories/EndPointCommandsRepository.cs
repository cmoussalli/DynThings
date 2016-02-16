/////////////////////////////////////////////////////////////////
// Created by : Caesar Moussalli                               //
// TimeStamp  : 16-2-2016                                      //
// Content    : Handle EndPoint Commands CRUD                  //
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
    public class EndPointCommandsRepository
    {
        private DynThingsEntities db = new DynThingsEntities();

        #region Get PagedList
        public IPagedList GetPagedList(string search, int pageNumber, int recordsPerPage)
        {
            IPagedList cmds = db.EndPointCommands
              .Where(e => search == null || e.Title.Contains(search))
              .OrderBy(e => e.Title).ToList()
              .ToPagedList(pageNumber, recordsPerPage);
            return cmds;
        }
        #endregion

        #region Find
        /// <summary>
        /// Find EndPointCommand Command by ID
        /// </summary>
        /// <param name="id">EndPointCommand Command ID</param>
        /// <returns>EndPointCommand Command object</returns>
        public EndPointCommand Find(long id)
        {
            EndPointCommand cmd = new EndPointCommand();
            List<EndPointCommand> cmds = db.EndPointCommands.Where(l => l.ID == id).ToList();
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
        /// Find EndPointCommand by EndPointCommand GUID
        /// </summary>
        /// <param name="guid">EndPointCommand GUID</param>
        /// <returns>EndPointCommand object</returns>
        public EndPointCommand Find(int id)
        {
            EndPointCommand cmd = new EndPointCommand();
            List<EndPointCommand> cmds = db.EndPointCommands.Where(l => l.ID == id).ToList();
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
        public UnitOfWork.RepositoryMethodResultType Add(string title, long endpointID, string description,string command)
        {
            UnitOfWork.RepositoryMethodResultType result = UnitOfWork.RepositoryMethodResultType.Failed;
            EndPointCommand cmd = new EndPointCommand();
            cmd.Title = title;
            cmd.EndPointID = endpointID;
            cmd.Descr = description;
            cmd.Command = command;
            db.EndPointCommands.Add(cmd);
            db.SaveChanges();
            result = UnitOfWork.RepositoryMethodResultType.Ok;

            return result;
        }

        #endregion

        #region Edit
        public UnitOfWork.RepositoryMethodResultType Edit(long id, string title, string description, string command)
        {
            UnitOfWork.RepositoryMethodResultType result = UnitOfWork.RepositoryMethodResultType.Failed;
            EndPointCommand cmd = db.EndPointCommands.Find(id);
            cmd.Title = title;
            cmd.Descr = description;
            cmd.Command = command;
            db.SaveChanges();
            result = UnitOfWork.RepositoryMethodResultType.Ok;
            return result;
        }

        #endregion


    }
}
