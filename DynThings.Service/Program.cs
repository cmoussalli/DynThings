using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceProcess;
using System.Text;
using System.Threading.Tasks;

namespace DynThings.Service
{
    static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        static void Main()
        {
            System.IO.File.WriteAllText(@"C:\DynThingsService.txt",DateTime.Now.ToLongTimeString());
#if DEBUG
            ServiceCore serviceCore = new ServiceCore();
            serviceCore.OnDebug();
            System.Threading.Thread.Sleep(System.Threading.Timeout.Infinite);
            System.IO.File.WriteAllText(@"C:\DynThingsService.txt","DebugMode");
#else
            ServiceBase[] ServicesToRun;
            ServicesToRun = new ServiceBase[]
            {
                new ServiceCore()
            };
            ServiceBase.Run(ServicesToRun);
            System.IO.File.WriteAllText(@"C:\DynThingsService.txt", "Release");
#endif
        }
    }
}
