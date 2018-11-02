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
using PagedList;
using DynThings.Core;
using ResultInfo;

using DynThings.Data.Models;
using DynThings.Data.Repositories;

namespace DynThings.Data.Repositories
{
    public class EndPointCommandsRepository
    {
        #region Constructor
        public EndPointCommandsRepository(DynThingsEntities dbSource)
        {
            db = dbSource;
            repoEndpointIOs = new EndpointIOsRepository(dbSource);
        }

        #endregion

        #region props
        DynThingsEntities db;
        EndpointIOsRepository repoEndpointIOs;
        #endregion


        #region Get PagedList
        public IPagedList GetPagedList(string search, int pageNumber, int recordsPerPage)
        {
            db = new DynThingsEntities();
            IPagedList cmds = db.EndPointCommands
              .Where(e => search == null || e.Title.Contains(search))
              .OrderBy(e => e.Title).ToList()
              .ToPagedList(pageNumber, recordsPerPage);
            return cmds;
        }

        public IPagedList GetPagedListByEndPointID(string search, long EndPointID, int pageNumber, int recordsPerPage)
        {
            db = new DynThingsEntities();
            IPagedList cmds = db.EndPointCommands
              .Where(e => search == null || e.Title.Contains(search) && e.EndPointID == EndPointID)
              .OrderBy(e => e.Title).ToList()
              .ToPagedList(pageNumber, recordsPerPage);
            return cmds;
        }

        public IPagedList GetPagedListByEndPointGUID(string search, Guid EndPointGUID, int pageNumber, int recordsPerPage)
        {
            db = new DynThingsEntities();
            IPagedList cmds = db.EndPointCommands
              .Where(e => search == null || e.Title.Contains(search) && e.Endpoint.GUID == EndPointGUID)
              .OrderBy(e => e.Title).ToList()
              .ToPagedList(pageNumber, recordsPerPage);
            return cmds;
        }

        public IPagedList GetPagedListByThingID(string search, long ThingID, int pageNumber, int recordsPerPage)
        {
            db = new DynThingsEntities();
            IPagedList cmds = db.EndPointCommands
              .Where(e => search == null || e.Title.Contains(search) && e.Endpoint.ThingID == ThingID)
              .OrderBy(e => e.Title).ToList()
              .ToPagedList(pageNumber, recordsPerPage);
            return cmds;
        }

        public IPagedList GetPagedListByLocationID(string search, long LocationID, long ThingID, int pageNumber, int recordsPerPage)
        {
            List<LinkThingsLocation> lnks = db.LinkThingsLocations.Where(l => l.LocationID == LocationID).ToList();
            db = new DynThingsEntities();
            List<EndPointCommand> cmds = db.EndPointCommands
              .Where(e => search == null || e.Title.Contains(search) && e.Endpoint.Thing.LinkThingsLocations.Any(l => l.LocationID == LocationID))
              .OrderBy(e => e.Title).ToList();

            if (ThingID != 0)
            {
                cmds = cmds.Where(c => c.Endpoint.ThingID == ThingID).ToList();
            }

            IPagedList plCmds = cmds.ToPagedList(pageNumber, recordsPerPage);
            return plCmds;
        }

        public IPagedList<EndPointCommand> GetPagedList(string search, long EndPointID, long ThingID, long LocationID, int pageNumber, int recordsPerPage)
        {
            db = new DynThingsEntities();
            IPagedList<EndPointCommand> cmds = db.EndPointCommands
              .Where(e =>
              (e.EndPointID == EndPointID || (search == null || search == ""))//Filter by EndpointID
              && (e.Title.Contains(search) || (search == null || search == ""))//Filter by Search "Title"
              && ((e.Endpoint.Thing.LinkThingsLocations.Any(l => l.LocationID == LocationID)) || (LocationID == null || LocationID == 0))//Filter by locationID
              && ((e.Endpoint.ThingID == ThingID) || (ThingID == null || ThingID == 0)) //Filter by ThingID
              ).OrderBy(e => e.Title)
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
            try
            {
                EndPointCommand cmd = new EndPointCommand();
                cmd.Title = title;
                cmd.EndPointID = EndPointID;
                cmd.Description = description;
                cmd.CommandCode = commandCode;
                cmd.OwnerID = ownerID;
                db.EndPointCommands.Add(cmd);
                db.SaveChanges();
                return Result.GenerateOKResult("Saved", cmd.ID.ToString());
            }
            catch
            {
                return Result.GenerateFailedResult();
            }
        }

        #endregion

        #region Delete
        public ResultInfo.Result Detele(long id)
        {
            try
            {
                EndPointCommand cmd = db.EndPointCommands.Find(id);
                db.EndPointCommands.Remove(cmd);
                db.SaveChanges();
                return Result.GenerateOKResult("Deleted", cmd.ID.ToString());
            }
            catch
            {
                return Result.GenerateFailedResult();
            }
        }

        #endregion

        #region Edit
        public ResultInfo.Result Edit(long id, string title, string description, long EndPointID, string commandCode)
        {
            try
            {
                EndPointCommand cmd = db.EndPointCommands.Find(id);
                cmd.Title = title;
                cmd.Description = description;
                cmd.CommandCode = commandCode;
                cmd.EndPointID = EndPointID;
                db.SaveChanges();
                return Result.GenerateOKResult("Saved", cmd.ID.ToString());
            }
            catch
            {
                return Result.GenerateFailedResult();
            }
        }

        #endregion

        #region Execute
        public ResultInfo.Result Execute(long commandID,string command, string userID)
        {
            try
            {
                EndPointCommand cmd = Find(commandID);
                db.SubmitEndpointCommand(cmd.ID, command, null);
            }
            catch
            {
                return Result.GenerateFailedResult();
            }

            return Result.GenerateOKResult();
        }
        #endregion

    }
}
