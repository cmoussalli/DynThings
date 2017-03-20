using DynHighCharts;
using DynThings.Data.Reports;
using DynThings.Data.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;


namespace DynThings.WebPortal.Controllers
{
    public class ConnectivityController : Controller
    {
        UnitOfWork_Repositories uof_repos = new UnitOfWork_Repositories();
        UnitOfWork_Reports uof_reports = new UnitOfWork_Reports();

        // GET: Connectivity
        public ActionResult Index()
        {
            return View();
        }

        #region Reports
        [HttpGet]
        public ActionResult Rpt_LastHourConnectionsPerMinutes()
        {
            Chart chrt = uof_reports.rptConnectivity.LastHourConnectionsPerMinutes();
            return PartialView("_HighChart", chrt);
        }

        #endregion
    }
}