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
        private long EntityID = 8;
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
        public List<APILocationView> GetLocationViews(string searchFor, int page, int pageSize)
        {
            List <APILocationView> viewsPageList = new List<APILocationView>();
            IPagedList<LocationView> viewsList = db.LocationViews.Include("LocationViewType")
                .Where(v => searchFor == null || v.Title.Contains(searchFor)).ToList().ToPagedList(page, pageSize);
            foreach (LocationView item in viewsList)
            {
                APILocationView apiLocationView = Models.TypesMapper.APILocationViewAdapter.fromLocationView(item);
                viewsPageList.Add(apiLocationView);
            }
            return viewsPageList;
        }
        #endregion

    }
}
