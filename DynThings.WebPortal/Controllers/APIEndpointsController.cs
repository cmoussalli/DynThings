using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DynThings.Data.Models;


namespace DynThings.WebPortal.Controllers
{
    public class APIEndpointsController : ApiController
    {
        private DynThingsEntities db = new DynThingsEntities();

            [HttpGet]
        public string SubmitEndPointIO(string guid, string keyPass, string newValue,string io)
        {
            string result = "Error";
            Endpoint ep = new Endpoint();
            List<Endpoint> eps = new List<Endpoint>();
            EndPointIO eio = new EndPointIO();

            eps = db.Endpoints.Where(e => e.GUID.ToString() == guid
            && e.KeyPass.ToString() == keyPass).ToList();
            if (eps.Count == 1)
            {
                eio.EndPointID = eps[0].ID;
                //Todo: Validate io value before save
                
                eio.TimeStamp = DateTime.Now;
                eio.Valu = newValue;
                db.EndPointIOs.Add(eio);
                db.SaveChanges();
                result = "Ok";
            }
            else
            {
                result = "Invalid GUID or KeyPAss";
            }
            return result;
        }








    }

}
