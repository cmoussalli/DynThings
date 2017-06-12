using DynThings.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DynThings.WebAPI.Models;

namespace DynThings.WebAPI.TypesMapper
{

    public static class APIAppAdapter
    {
        public static APIApp fromApp(App sourceApp)
        {
            APIApp result = new APIApp();
            result.CreateDate = sourceApp.CreateDate;
            result.CreatedByID = sourceApp.CreatedByID;
            result.Description = sourceApp.Description;
            result.DevelopedByName = sourceApp.DevelopedByName;
            result.GUID = sourceApp.GUID;
            result.IsStoreApp = sourceApp.IsStoreApp;
            result.StatusID = sourceApp.StatusID;
            result.Title = sourceApp.Title;
            result.Version = sourceApp.Version;
            List<AppAPIEntity> ents = sourceApp.AppAPIEntitys.ToList();
            List<APISystemEntity> apiSystemEntities = new List<APISystemEntity>();
            foreach (AppAPIEntity ent in ents)
            {
                APISystemEntity se = new APISystemEntity();
                se.ID = ent.SystemEntityID;
                se.Title = ent.SystemEntity.Title;
                apiSystemEntities.Add(se);
            }
            result.AllowedEntities = apiSystemEntities;

            return result;
        }
    }



}
