using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DynThings.Data.Models;

namespace DynThings.Data.Repositories
{
    public class LocationViewsRepository
    {
        private DynThingsEntities db = new DynThingsEntities();

        public void Create()
        {

        }

        public List<LocationView> GetAll()
        {
            List<LocationView> locViews = db.LocationViews.ToList();
            return locViews;
        }

        public  LocationView Find(long ID)
        {
            LocationView locView = new LocationView();
            List<LocationView> locViews = db.LocationViews.Where(v => v.ID == ID).ToList();
            if (locViews.Count == 1)
            {
                locView = locViews[0];
            }else
            {
                throw new  Exception("Not Found");
            }
            return locView;
        }
    }
}
