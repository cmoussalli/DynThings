using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

using DynThings.Data.Models;
using DynThings.Data.Repositories;
using DynThingsCentral.Core;
using DynThingsCentral.WebAPI.Models;
using DynThingsCentral.WebAPI.RequestModels;
using DynThingsCentral.WebAPI.ResponseModels;
using DynThingsCentral.WebAPI.Client;
using DynThings.Core;
using System.IO;
using System.Net;
using ResultInfo;

namespace DynThings.Services.Central
{
    public class DBChangesService
    {
        //UnitOfWork_Repositories uow_Data = new UnitOfWork_Repositories();
        CentralClient client = new CentralClient();
        DynThingsEntities db = new DynThingsEntities();
        UnitOfWork_Repositories uow_Repositories = new UnitOfWork_Repositories();

        #region Constructor
        public DBChangesService(string centralURL)
        {
            client.BaseUrl = centralURL;
        }
        #endregion


        public async Task<APIDBChangesResponseModels.GetDBChangesList> GetDBChangesListAsync(string searchFor, long startFrom, int page, int itemsPerPage)
        {
            List<APIDBChange> apiDBChanges = new List<APIDBChange>();

            APIDBChangesRequestModels.GetDBChangesList requestModel = new APIDBChangesRequestModels.GetDBChangesList();
            requestModel.SearchFor = searchFor;
            requestModel.StartFrom = startFrom;
            requestModel.PageNumber = page;
            requestModel.RecordsPerPage = itemsPerPage;
            APIDBChangesResponseModels.GetDBChangesList responseModel = await client.DBChanges.GetDBChangesListAsync(requestModel);
            return responseModel;
        }

        public async Task<APIDBChangesResponseModels.GetDBChangeByID> GetDBChangesByIDAsync(long id)
        {
            APIDBChange apiDBChanges = new APIDBChange();
            APIDBChangesRequestModels.GetDBChangeByID requestModel = new APIDBChangesRequestModels.GetDBChangeByID();
            requestModel.Id = id;
            APIDBChangesResponseModels.GetDBChangeByID responseModel = await client.DBChanges.GetDBChangeByIDAsync(requestModel);
            return responseModel;
        }


        public async Task<ResultInfo.Result> InstallDBChanges()
        {
            ResultInfo.Result result = Result.GenerateFailedResult();

            long lastCentralChangeID = 0;
            int localDBChangesCount = db.DBChanges.Count();
            if (db.DBChanges.Count() > 0)
            {
                lastCentralChangeID = db.DBChanges.ToList()[localDBChangesCount -1].CentralChangeID;
            }

            APIDBChangesRequestModels.GetDBChangesList requestModel = new APIDBChangesRequestModels.GetDBChangesList();
            requestModel.SearchFor = "";
            requestModel.StartFrom = lastCentralChangeID +1;
            requestModel.PageNumber = 1;
            requestModel.RecordsPerPage = 10;
            APIDBChangesResponseModels.GetDBChangesList responseModel = await client.DBChanges.GetDBChangesListAsync(requestModel);

            if (responseModel.DBChanges.Count > 0)
            {
                foreach (APIDBChange item in responseModel.DBChanges)
                {
                    db.Database.ExecuteSqlCommand(item.Script);
                    DBChanx dbChange = new DBChanx();
                    dbChange.CentralChangeID = item.ID;
                    dbChange.ChangeCode = item.Code;
                    dbChange.TimeStamp = DateTime.Now;
                    db.DBChanges.Add(dbChange);
                    db.SaveChanges();
                }
            }
            result = Result.GenerateOKResult();

            return result;
        }




        private void ExecuteSQLScript(string script)
        {
            //var sqlqueries = script.Split(new[] { "GO" + Environment.NewLine }, StringSplitOptions.RemoveEmptyEntries);
            //string sqlConnectionString = @"Server=" + sc.SQLServer + ";Database=" + sc.SQLDatabase + ";User Id=" + sc.SQLUser + ";Password=" + sc.SQLPassword + ";";
            //var con = new SqlConnection(sqlConnectionString);
            //var cmd = new SqlCommand(script, con);

            db.Database.ExecuteSqlCommand(script);

        //    con.Open();
        //    foreach (var query in sqlqueries)
        //    {
        //        cmd.CommandText = query;
        //        cmd.ExecuteNonQuery()
        //    }
        //    con.Close();   
        }

    }
}
