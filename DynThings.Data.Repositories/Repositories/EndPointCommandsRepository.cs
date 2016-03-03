/////////////////////////////////////////////////////////////////
// Created by : Caesar Moussalli                               //
// TimeStamp  : 16-2-2016                                      //
// Content    : Handle EndPointCommands CRUD                   //
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

        public IPagedList GetPagedListByEndPointID(string search, long EndPointID, int pageNumber, int recordsPerPage)
        {
            IPagedList cmds = db.EndPointCommands
              .Where(e => search == null || e.Title.Contains(search) && e.EndPointID == EndPointID)
              .OrderBy(e => e.Title).ToList()
              .ToPagedList(pageNumber, recordsPerPage);
            return cmds;
        }


        public IPagedList GetPagedListByEndPointGUID(string search, Guid EndPointGUID, int pageNumber, int recordsPerPage)
        {
            IPagedList cmds = db.EndPointCommands
              .Where(e => search == null || e.Title.Contains(search) && e.Endpoint.GUID == EndPointGUID)
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

        #endregion

        #region Add
        public ResultInfo.Result Add(string title, long EndPointID, string description, string commandCode, string ownerID)
        {
            EndPointCommand cmd = new EndPointCommand();
            cmd.Title = title;
            cmd.EndPointID = EndPointID;
            cmd.Description = description;
            cmd.CommandCode = commandCode;
            cmd.OwnerID = ownerID;
            db.EndPointCommands.Add(cmd);
            db.SaveChanges();
            return UnitOfWork.resultInfo.GenerateOKResult() ;
        }

        #endregion

        #region Edit
        public ResultInfo.Result Edit(long id, string title, string description, long EndPointID, string commandCode)
        {
            EndPointCommand cmd = db.EndPointCommands.Find(id);
            cmd.Title = title;
            cmd.Description = description;
            cmd.CommandCode = commandCode;
            cmd.EndPointID = EndPointID;
            db.SaveChanges();
            return UnitOfWork.resultInfo.GenerateOKResult();
        }

        #endregion

        #region Execute
        public ResultInfo.Result Execute(long commandID, Guid endPointKeyPass, string ownerID)
        {
            EndPointCommand cmd = Find(commandID);
            if (cmd.Endpoint.KeyPass == endPointKeyPass)
            {
                UnitOfWork.repoEndpointIOs.Add(cmd.Endpoint.ID, cmd.CommandCode, EndpointIOsRepository.EndPointIOType.Command);
            }
            return UnitOfWork.resultInfo.GenerateOKResult();
        }
        #endregion

    }
}
