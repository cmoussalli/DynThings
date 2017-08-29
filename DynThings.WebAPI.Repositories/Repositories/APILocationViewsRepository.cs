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


namespace DynThings.WebAPI.Repositories
{
    public class APILocationViewsRepository
    {
        #region Constructor
        public APILocationViewsRepository(DynThingsEntities dbSource)
        {
            db = dbSource;
        }

        #endregion

        #region props
        private DynThingsEntities db;
        public long EntityID = 8;
        private APIUserAppTokensRepository repoUserAppTokensRepository
        {
            get
            {
                APIUserAppTokensRepository result = new APIUserAppTokensRepository(db);
                return result;
            }
        }
        private APIUtilizationsRepository repoAPIUtilizations
        {
            get
            {
                APIUtilizationsRepository result = new APIUtilizationsRepository(db);
                return result;
            }
        }
        #endregion


        #region Methods 
        /// <summary>
        /// Get List of LocationViews.
        /// </summary>
        /// <param name="pageNumber">Page Number.</param>
        /// <param name="pageSize">Items count per page.</param>
        /// <param name="loadParents">Enable or Disable loading the Parents objects.</param>
        /// <param name="loadChilds">Enable or Disable loading the Childs objects.</param>
        /// <param name="searchFor">Search text as per the 'Title' field.</param>
        /// <returns></returns>
        public List<APILocationView> GetLocationViews( int pageNumber, int pageSize,bool loadParents, bool loadChilds, string searchFor)
        {
            List <APILocationView> viewsPageList = new List<APILocationView>();
            List<LocationView> viewsList = db.LocationViews.Include("LocationViewType")
                .Where(v => 
                ((searchFor == null || searchFor == "") || v.Title.Contains(searchFor))
                )
                .OrderBy(o => o.Title)
                .Skip((pageNumber - 1)* pageSize)
                .Take(pageSize)
                .ToList();
            foreach (LocationView item in viewsList)
            {
                APILocationView apiLocationView = TypesMapper.APILocationViewAdapter.fromLocationView(item, loadChilds);
                viewsPageList.Add(apiLocationView);
            }
            
            return viewsPageList;
        }
        #endregion




    }
}
