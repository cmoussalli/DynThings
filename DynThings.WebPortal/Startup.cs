using Owin;
using Microsoft.Owin;
[assembly: OwinStartup(typeof(DynThings.WebPortal.Startup))]
[assembly: OwinStartupAttribute(typeof(DynThings.WebPortal.Startup))]

namespace DynThings.WebPortal
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            app.MapSignalR();
            ConfigureAuth(app);
        }
    }
}
