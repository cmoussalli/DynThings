using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DynThings.Client.Services.Repositories;
namespace DynThings.Client.Services
{
    public class UnitOfWork
    {
        #region Prop
        public UnitOfWorkConfiguration Configurations { get; set; }


        #endregion




        #region Repositories
        public LocationViewsRepository locationViewsRepository
        { get { return new LocationViewsRepository(Configurations); } }
        
        #endregion


    }

    public class UnitOfWorkConfiguration
    {
        public string HostURL { get; set; }
        public string Token { get; set; }
    }

}
