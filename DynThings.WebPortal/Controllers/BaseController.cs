using DynThings.Core;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using DynThings.Data.Models;
using DynThings.Data.Repositories;
using Microsoft.AspNet.Identity;

namespace DynThings.WebPortal.Controllers
{
    public class BaseController : Controller
    {
        UnitOfWork_Repositories uof_repos = new UnitOfWork_Repositories();

        #region Properties
        public AspNetUser currentUser { get; set; }
        public string PageTitle { get; set; }
        public string PageDescription { get; set; }
        #endregion

        #region Overrides
        #region Initialize
        protected override void Initialize(RequestContext requestContext)
        {
            base.Initialize(requestContext);

            //Get the current User Info
            currentUser = uof_repos.repoDynUsers.Find(User.Identity.GetUserId());
        }

        #endregion

        #region OnActionExecuting
        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            if (Core.Config.PlatformTitle == "")
            {
                filterContext.Result = new RedirectToRouteResult(
                    new RouteValueDictionary {{ "Controller", "Setup" },
                                      { "Action", "Index" } });
            }

            base.OnActionExecuting(filterContext);
        }
        #endregion

        #endregion

        public bool ValidateUserPermissions( bool monitorAndControlIsAllowed,bool monitorOnlyIsAllowed)
        {
            bool result = false;
            if (Core.Config.PublicAccess == false)
            {
                if (User.Identity.IsAuthenticated == true)
                {
                    if (User.IsInRole(StaticMenus.UserRoles.GetAdminRoleName()))
                    {
                        result = true;
                    }
                    if ((monitorAndControlIsAllowed == true) && (User.IsInRole(StaticMenus.UserRoles.GetMonitorAndControlRoleName())))
                    {
                        result = true;
                    }
                    if ((monitorOnlyIsAllowed == true) && (User.IsInRole(StaticMenus.UserRoles.GetMonitorOnlyRoleName())))
                    {
                        result = true;
                    }
                }
            }
            else
            {
                result = true;
            }
            return result;
        }
    }
}