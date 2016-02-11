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

namespace DynThings.Data.Repositories
{
    public class EndPointTypesRepository
    {
        private DynThingsEntities db = new DynThingsEntities();

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

        #region Create
        public UnitOfWork.RepositoryMethodResultType Add(string Title,string measurment,long TypeCategoryID,long IconID)
        {
            UnitOfWork.RepositoryMethodResultType result = UnitOfWork.RepositoryMethodResultType.Failed;
            EndPointType epType = new EndPointType();
            epType.Title = Title;
            epType.measurement = measurment;
            epType.TypeCategoryID = TypeCategoryID;
            epType.IconID = IconID;
            db.EndPointTypes.Add(epType);
            db.SaveChanges();
            result = UnitOfWork.RepositoryMethodResultType.Ok;
            return result;
        }

        #endregion
    }
}
