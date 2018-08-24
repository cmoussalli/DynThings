using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DynThings.Services.Central
{
    public class UnitOfWork_CentralServices
    {

        #region Properties
        public string CentralURL = "http://localhost/DynThingsCentral.WebPortal/";

        #endregion


        #region Constuctor
        public UnitOfWork_CentralServices()
        {
            CentralURL = "http://www.dynthings.com/";
            //CentralURL = "http://localhost/DynThingsCentral.WebPortal/";
        }
        #endregion





        public AppStoreService appStoreService { get { return new AppStoreService(CentralURL); } }





    }
}
