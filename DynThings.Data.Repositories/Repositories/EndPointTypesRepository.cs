/////////////////////////////////////////////////////////////////
// Created by : Caesar Moussalli                               //
// TimeStamp  : 10-2-2016                                      //
// Content    : Handle EndpointTypes CRUD                           //
// Notes      :                                                //
/////////////////////////////////////////////////////////////////

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DynThings.Data.Models;
using DynThings.Core;
using PagedList;

namespace DynThings.Data.Repositories
{
    public class EndPointTypesRepository
    {
        #region Constructor
        public DynThingsEntities db { get; set; }
        public EndPointTypesRepository(DynThingsEntities dynThingsEntities)
        {
            db = dynThingsEntities;
        }
        #endregion

        #region Get PagedList
        public IPagedList GetPagedList(string search, int pageNumber, int recordsPerPage)
        {
            IPagedList typs = db.EndPointTypes
              .Where(e => e.ID > 0 && search == null || e.ID > 0 && e.Title.Contains(search))
              .OrderBy(e => e.Title).ToList()
              .ToPagedList(pageNumber, recordsPerPage);
            return typs;
        }
        #endregion

        #region GetList
        /// <summary>
        /// Get All Endpoint Types list
        /// </summary>
        /// <returns>List of Endpoint Types</returns>
        public List<EndPointType> GetList()
        {
            List<EndPointType> types = db.EndPointTypes.ToList();
            return types;
        }

        #endregion

        #region Find
        /// <summary>
        /// Find Endpoint Type by EndPoint Type ID
        /// </summary>
        /// <param name="id">EndPoint Type ID</param>
        /// <returns>Endpoint object</returns>
        public EndPointType Find(long id)
        {
            EndPointType epType = new EndPointType();
            List<EndPointType> epTypes = db.EndPointTypes.Where(l => l.ID == id).ToList();
            if (epTypes.Count == 1)
            {
                epType = epTypes[0];
            }
            else
            {
                throw new Exception("Not Found");
            }
            return epType;
        }

        #endregion

        #region Add
        public ResultInfo.Result Add(string Title, string measurment, long TypeCategoryID, long IconID)
        {
            try
            {
                EndPointType epType = new EndPointType();
                epType.Title = Title;
                epType.measurement = measurment;
                epType.TypeCategoryID = TypeCategoryID;
                epType.IconID = IconID;
                db.EndPointTypes.Add(epType);
                db.SaveChanges();
                return ResultInfo.GenerateOKResult("Saved", epType.ID);
            }
            catch
            {
                return ResultInfo.GetResultByID(1);
            }
        }

        #endregion

        #region Edit
        public ResultInfo.Result Edit(long ID, string Title, string measurment, long TypeCategoryID, long IconID)
        {
            try
            {
                List<EndPointType> endTypes = db.EndPointTypes.Where(et => et.ID == ID).ToList();
                if (endTypes.Count == 1)
                {
                    endTypes[0].Title = Title;
                    endTypes[0].measurement = measurment;
                    endTypes[0].TypeCategoryID = TypeCategoryID;
                    endTypes[0].IconID = IconID;
                    db.EndPointTypes.Add(endTypes[0]);
                    db.SaveChanges();
                    return ResultInfo.GenerateOKResult("Saved", endTypes[0].ID);
                }
                else
                {
                    return ResultInfo.GetResultByID(1);
                }
            }
            catch
            {
                return ResultInfo.GetResultByID(1);
            }
        }

        #endregion

        #region Delete
        public ResultInfo.Result Delete(long ID)
        {
            try
            {
                List<EndPointType> endTypes = db.EndPointTypes.Where(et => et.ID == ID).ToList();
                if (endTypes.Count == 1)
                {
                    db.EndPointTypes.Remove(endTypes[0]);
                    db.SaveChanges();
                    return ResultInfo.GenerateOKResult("Deleted", endTypes[0].ID);
                }
                else
                {
                    return ResultInfo.GetResultByID(1);
                }
            }
            catch
            {
                return ResultInfo.GetResultByID(1);
            }
        }

        #endregion
    }
}
