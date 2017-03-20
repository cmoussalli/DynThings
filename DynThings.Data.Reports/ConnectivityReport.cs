using DynThings.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DynHighCharts;
using DynThings.Data.Repositories;
using DynHighCharts.Properies;
using DynHighCharts.Enums;

namespace DynThings.Data.Reports
{
    public class ConnectivityReport
    {
        #region Constructor
        public ConnectivityReport(DynThingsEntities dbSource)
        {
            db = dbSource;
            repoEndpoints = new EndpointsRepository(dbSource);
        }

        #endregion

        #region props
        DynThingsEntities db;
        EndpointsRepository repoEndpoints;
        #endregion

        public Chart LastHourConnectionsPerMinutes()
        {
            Chart hc = new Chart("HC_" + "LastHourConnectionsPerMinutes");
            hc.title.Text = "Last hour connections per minutes";
            hc.subTitle.Text = "";
            hc.xAxis.GenerateMinutesList(true);
            
            hc.legend.layout = Layout.vertical.ToString();

            List<Rpt_EndPointAndDevices_IOsCount_Minutes_Result> rpt = db.Rpt_EndPointAndDevices_IOsCount_Minutes().ToList();

            #region GetEndPointIOs Count
            Serie s1 = new Serie();
            s1.Name = "EndPoints";
            Rpt_EndPointAndDevices_IOsCount_Minutes_Result rpt1 = rpt[0];
            List<int> resultEndPoints = new List<int>();
            resultEndPoints.Add(rpt1.C1.GetValueOrDefault());
            resultEndPoints.Add(rpt1.C2.GetValueOrDefault());
            resultEndPoints.Add(rpt1.C3.GetValueOrDefault());
            resultEndPoints.Add(rpt1.C4.GetValueOrDefault());
            resultEndPoints.Add(rpt1.C5.GetValueOrDefault());
            resultEndPoints.Add(rpt1.C6.GetValueOrDefault());
            resultEndPoints.Add(rpt1.C7.GetValueOrDefault());
            resultEndPoints.Add(rpt1.C8.GetValueOrDefault());
            resultEndPoints.Add(rpt1.C9.GetValueOrDefault());
            resultEndPoints.Add(rpt1.C10.GetValueOrDefault());
            resultEndPoints.Add(rpt1.C11.GetValueOrDefault());
            resultEndPoints.Add(rpt1.C12.GetValueOrDefault());
            resultEndPoints.Add(rpt1.C13.GetValueOrDefault());
            resultEndPoints.Add(rpt1.C14.GetValueOrDefault());
            resultEndPoints.Add(rpt1.C15.GetValueOrDefault());
            resultEndPoints.Add(rpt1.C16.GetValueOrDefault());
            resultEndPoints.Add(rpt1.C17.GetValueOrDefault());
            resultEndPoints.Add(rpt1.C18.GetValueOrDefault());
            resultEndPoints.Add(rpt1.C19.GetValueOrDefault());
            resultEndPoints.Add(rpt1.C20.GetValueOrDefault());
            resultEndPoints.Add(rpt1.C21.GetValueOrDefault());
            resultEndPoints.Add(rpt1.C22.GetValueOrDefault());
            resultEndPoints.Add(rpt1.C23.GetValueOrDefault());
            resultEndPoints.Add(rpt1.C24.GetValueOrDefault());
            resultEndPoints.Add(rpt1.C25.GetValueOrDefault());
            resultEndPoints.Add(rpt1.C26.GetValueOrDefault());
            resultEndPoints.Add(rpt1.C27.GetValueOrDefault());
            resultEndPoints.Add(rpt1.C28.GetValueOrDefault());
            resultEndPoints.Add(rpt1.C29.GetValueOrDefault());
            resultEndPoints.Add(rpt1.C30.GetValueOrDefault());
            resultEndPoints.Add(rpt1.C31.GetValueOrDefault());
            resultEndPoints.Add(rpt1.C32.GetValueOrDefault());
            resultEndPoints.Add(rpt1.C32.GetValueOrDefault());
            resultEndPoints.Add(rpt1.C33.GetValueOrDefault());
            resultEndPoints.Add(rpt1.C34.GetValueOrDefault());
            resultEndPoints.Add(rpt1.C35.GetValueOrDefault());
            resultEndPoints.Add(rpt1.C36.GetValueOrDefault());
            resultEndPoints.Add(rpt1.C37.GetValueOrDefault());
            resultEndPoints.Add(rpt1.C38.GetValueOrDefault());
            resultEndPoints.Add(rpt1.C39.GetValueOrDefault());
            resultEndPoints.Add(rpt1.C40.GetValueOrDefault());
            resultEndPoints.Add(rpt1.C41.GetValueOrDefault());
            resultEndPoints.Add(rpt1.C42.GetValueOrDefault());
            resultEndPoints.Add(rpt1.C43.GetValueOrDefault());
            resultEndPoints.Add(rpt1.C44.GetValueOrDefault());
            resultEndPoints.Add(rpt1.C45.GetValueOrDefault());
            resultEndPoints.Add(rpt1.C46.GetValueOrDefault());
            resultEndPoints.Add(rpt1.C47.GetValueOrDefault());
            resultEndPoints.Add(rpt1.C48.GetValueOrDefault());
            resultEndPoints.Add(rpt1.C49.GetValueOrDefault());
            resultEndPoints.Add(rpt1.C50.GetValueOrDefault());
            resultEndPoints.Add(rpt1.C51.GetValueOrDefault());
            resultEndPoints.Add(rpt1.C52.GetValueOrDefault());
            resultEndPoints.Add(rpt1.C53.GetValueOrDefault());
            resultEndPoints.Add(rpt1.C54.GetValueOrDefault());
            resultEndPoints.Add(rpt1.C55.GetValueOrDefault());
            resultEndPoints.Add(rpt1.C56.GetValueOrDefault());
            resultEndPoints.Add(rpt1.C57.GetValueOrDefault());
            resultEndPoints.Add(rpt1.C58.GetValueOrDefault());
            resultEndPoints.Add(rpt1.C59.GetValueOrDefault());
            resultEndPoints.Add(rpt1.C60.GetValueOrDefault());
            resultEndPoints.Reverse();
            s1.Data = resultEndPoints;
            hc.series.Add(s1);
            #endregion



            return hc;
        }



    }
}
