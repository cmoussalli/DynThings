/////////////////////////////////////////////////////////////////
// Created by : Caesar Moussalli                               //
// TimeStamp  : 31-1-2016                                      //
// Content    : Handel the Users Management Actions            //
// Notes      :                                                //
//                                                             //
/////////////////////////////////////////////////////////////////
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
      
       
    }
}