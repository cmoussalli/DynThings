using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DynThings.Data.Repositories;

namespace DynThings.WebPortal.Controllers
{
    public class ReportsController : Controller
    {
        UnitOfWork_Repositories uof_repos = new UnitOfWork_Repositories();

        // GET: Reports
        public ActionResult Index()
        {
            return View();
        }
    }
}