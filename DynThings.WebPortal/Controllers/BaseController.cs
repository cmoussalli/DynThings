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
        #region Properties
        public AspNetUser currentUser { get; set; }

        #endregion

        #region Initialize
        protected override void Initialize(RequestContext requestContext)
        {
            base.Initialize(requestContext);
            currentUser = UnitOfWork_Repositories.repoDynUsers.Find(User.Identity.GetUserId());
        }

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