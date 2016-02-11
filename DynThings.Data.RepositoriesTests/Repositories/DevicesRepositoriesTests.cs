using Microsoft.VisualStudio.TestTools.UnitTesting;
using DynThings.Data.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DynThings.Data.Repositories.Tests
{
    [TestClass()]
    public class DevicesRepositoriesTests
    {
        [TestMethod()]
        public void RenewKeyPassTest()
        {
            UnitOfWork.RepositoryMethodResultType result =  UnitOfWork.repoDevices.RenewKeyPass(1);
           
        }
    }
}