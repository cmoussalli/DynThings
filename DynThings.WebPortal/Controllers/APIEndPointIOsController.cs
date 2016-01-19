using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DynThings.WebPortal.Models;
using DynThings.WebPortal.Models.ViewModels;


namespace DynThings.WebPortal.Controllers
{
    public class APIEndPointIOsController : ApiController
    {
        private DynThingsEntities db = new DynThingsEntities();

        public class EndPointIO
        {
            public long ID { get; set; }
            public string Valu { get; set; }
            public DateTime TimeStamp { get; set; }
        }

        
        public IEnumerable<EndPointIO> GetEndPointIOs(Guid endPointGUID)
        {
            List<Models.EndPointIO> ios = db.EndPointIOs.Where(i => i.Endpoint.GUID == endPointGUID).OrderByDescending(i => i.TimeStamp).Take(2).ToList();
            List<EndPointIO> eios = new List<EndPointIO>();
            foreach (Models.EndPointIO io in ios)
            {
                EndPointIO eio = new EndPointIO();
                eio.ID = io.ID;
                eio.Valu = io.Valu;
                eio.TimeStamp = io.TimeStamp;

                eios.Add(eio);
            }
            return eios;
        }

        


    }
}
