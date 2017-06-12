using DynHighCharts;
using DynThings.Data.Reports;
using DynThings.Data.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using static DynThings.Data.WidgetModels.InfoBoxs;

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
        /// <summary>
        /// Return HighChart object, represent the connections per minutes in the last hour
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult Rpt_LastHourConnectionsPerMinutes()
        {
            Chart chart = uof_reports.rptConnectivity.LastHourConnectionsPerMinutes();
            return PartialView("_HighChart", chart);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult Widget_LastHourConnectionsCount()
        {
            InfoBox infobox = uof_reports.rptConnectivity.LastHourConnectionsStatistics();
            return PartialView("Widgets/_InfoBox", infobox);
        }

        #endregion
    }
}