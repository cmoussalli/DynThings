using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DynThings.Data.Models;

namespace DynThings.WebPortal.Controllers
{
    public class UsersManagementController : Controller
    {
        private DynThingsEntities db = new DynThingsEntities();
        private ApplicationSignInManager _signInManager;
        private ApplicationUserManager _userManager;
      
        // GET: UsersManagement
        //public ActionResult Index()
        //{
        //        var userStore = new

        //    var usermanager = new _userManager<ApplicationIdentity>.Users.ToList();
        //    //List<User> users = _userManager.Users.ToList();

        //    //ApplicationUserManager um = new ApplicationUserManager()
        //    return View(applicationusers);
        //}
    }
}