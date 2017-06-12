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
using System.Collections;
using System.Net.Http;
using System.Net;
using DynThings.Data.Models.ViewModels;

namespace DynThings.WebAPI.Repositories
{
    public class APIEndPointCommandsRepository
    {
        #region Constructor
        public APIEndPointCommandsRepository(DynThingsEntities dbSource)
        {
            db = dbSource;
        }

        #endregion

        #region props
        private DynThingsEntities db;
        public long EntityID = 2;
        private APIUserAppTokensRepository repoUserAppTokensRepository
        {
            get
            {
                APIUserAppTokensRepository result = new APIUserAppTokensRepository(db);
                return result;
            }
        }
        #endregion


        #region Methods 
        /// <summary>
        /// Get List of EndPoint Commands.
        /// </summary>
        /// <param name="pageNumber">Page Number.</param>
        /// <param name="pageSize">Items count per page.</param>
        /// <param name="loadParents">Enable or Disable loading the Parents objects.</param>
        /// <param name="loadChilds">Enable or Disable loading the Childs objects.</param>
        /// <param name="searchFor">Search text as per the 'Title' field.</param>
        /// <param name="locationID">Filter by Location ID. You can keep it null or empty to ignore this filter.</param>
        /// <param name="ThingID">Filter by Thing ID. You can keep it null or empty to ignore this filter.</param>
        /// <param name="EndPointID">Filter by EndPoint ID. You can keep it null or empty to ignore this filter.</param>
        /// <returns></returns>
        public List<APIEndPointCommand> GetEndpointCommands(int pageNumber, int pageSize, bool loadParents, bool loadChilds,string searchFor, long locationID, long ThingID, long EndPointID)
        {
            List<APIEndPointCommand> result = new List<APIEndPointCommand>();
            List<EndPointCommand> cmds = db.EndPointCommands
              .Where(e =>
              (e.Title.Contains(searchFor) || (searchFor == null || searchFor == ""))//Filter by Search "Title"
              && ((e.Endpoint.Thing.LinkThingsLocations.Any(l => l.LocationID == locationID)) || (locationID == null || locationID == 0))//Filter by locationID
              && ((e.Endpoint.ThingID == ThingID) || (ThingID == null || ThingID == 0)) //Filter by ThingID
              ).OrderBy(e => e.Title)
              .Skip(pageSize * (pageNumber - 1))
              .Take(pageSize)
              .ToList();

            foreach (EndPointCommand cmd in cmds)
            {
                APIEndPointCommand apiCmd = new APIEndPointCommand();
                apiCmd = TypesMapper.APIEndPointCommandAdapter.fromEndpointCommand(cmd, loadParents, loadChilds);
                result.Add(apiCmd);
            }
            return result;
        }


        #endregion

    }
}
