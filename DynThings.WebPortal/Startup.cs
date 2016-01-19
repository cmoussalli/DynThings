using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(DynThings.WebPortal.Startup))]
namespace DynThings.WebPortal
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
