/////////////////////////////////////////////////////////////////
// Created by : Caesar Moussalli                               //
// TimeStamp  : 31-1-2016                                      //
// Content    : Handel the Home Actions                        //
// Notes      :                                                //
//                                                             //
/////////////////////////////////////////////////////////////////
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DynThings.Data.Repositories;
namespace DynThings.WebPortal.Controllers
{
    [Authorize]
    public class HomeController : Controller
    {
        UnitOfWork_Repositories uof_repos = new UnitOfWork_Repositories();

        //TODO: Design a Main Page with review 4
        public ActionResult Index()
        {
            
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}