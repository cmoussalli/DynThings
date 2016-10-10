using DynThings.Core;
using DynThings.Data.Models;
using DynThings.Data.Repositories;
using DynThings.WebAPI;
using DynThings.WebAPI.Models;
using DynThings.WebAPI.Models.TypesMapper;
using DynThings.WebPortal;
using Microsoft.AspNet.SignalR;
using Microsoft.AspNet.SignalR.Hubs;
using Microsoft.AspNet.SignalR.Configuration;
using Microsoft.AspNet.SignalR.Hosting;
using Microsoft.AspNet.SignalR.Infrastructure;
using Microsoft.AspNet.SignalR.Owin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace DynThings.WebPortal
{

    [HubName("signalrhub")]
    public class signalrhub : Hub
    {
        private static IHubContext hubcontext = GlobalHost.ConnectionManager.GetHubContext<signalrhub>();


        public void hello()
        {
            Clients.All.hello();
        }



        public void send(string name, string message, string connectionid)
        {
            Clients.Client(connectionid).addnewmessagetopage(name, message);
        }
        public static void static_send(string name, string message, string connectionid)
        {
            
            hubcontext.Clients.Client(connectionid).addnewmessagetopage(name, message);
        }

        public void sendtoall(string name, string message)
        {
            Clients.All.addnewmessagetopage(name, message);
        }
        public static void static_sendtoall(string name, string message)
        {

            hubcontext.Clients.All.addnewmessagetopage(name, message);
        }

    }

}