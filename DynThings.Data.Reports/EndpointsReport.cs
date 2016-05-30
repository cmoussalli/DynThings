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
    public class EndpointsReport
    {
        #region Constructor
        public DynThingsEntities db { get; set; }
        public EndpointsReport(DynThingsEntities dynThingsEntities)
        {
            this.db = dynThingsEntities;
        }
        #endregion

        public Chart IOs_Monthly(long endPointID,string year)
        {
            Endpoint ep = UnitOfWork_Repositories.repoEndpoints.Find(endPointID);

            Chart hc = new Chart();
            hc.title.Text = "Monthly Average";
            hc.subTitle.Text = endPointID.ToString();
            hc.xAxis.GenerateMonthsList();
            hc.legend.layout = Layout.vertical.ToString();

            List<Rpt_EndPoint_IOs_Months_Result> rpt = db.Rpt_EndPoint_IOs_Months(endPointID,year).ToList();

            #region GetMin
            Serie s1 = new Serie();
            s1.Name = "Min";
            Rpt_EndPoint_IOs_Months_Result rpt1 = rpt[0];
            List<int> resultMin = new List<int>();
            resultMin.Add(rpt1.C1.GetValueOrDefault());
            resultMin.Add(rpt1.C2.GetValueOrDefault());
            resultMin.Add(rpt1.C3.GetValueOrDefault());
            resultMin.Add(rpt1.C4.GetValueOrDefault());
            resultMin.Add(rpt1.C5.GetValueOrDefault());
            resultMin.Add(rpt1.C6.GetValueOrDefault());
            resultMin.Add(rpt1.C7.GetValueOrDefault());
            resultMin.Add(rpt1.C8.GetValueOrDefault());
            resultMin.Add(rpt1.C9.GetValueOrDefault());
            resultMin.Add(rpt1.C10.GetValueOrDefault());
            resultMin.Add(rpt1.C11.GetValueOrDefault());
            resultMin.Add(rpt1.C12.GetValueOrDefault());
            s1.Data = resultMin;
            hc.series.Add(s1);
            #endregion

            #region GetMax
            Serie s2 = new Serie();
            s2.Name = "Max";
            Rpt_EndPoint_IOs_Months_Result rpt2 = rpt[1];
            List<int> resultMax = new List<int>();
            resultMax.Add(rpt2.C1.GetValueOrDefault());
            resultMax.Add(rpt2.C2.GetValueOrDefault());
            resultMax.Add(rpt2.C3.GetValueOrDefault());
            resultMax.Add(rpt2.C4.GetValueOrDefault());
            resultMax.Add(rpt2.C5.GetValueOrDefault());
            resultMax.Add(rpt2.C6.GetValueOrDefault());
            resultMax.Add(rpt2.C7.GetValueOrDefault());
            resultMax.Add(rpt2.C8.GetValueOrDefault());
            resultMax.Add(rpt2.C9.GetValueOrDefault());
            resultMax.Add(rpt2.C10.GetValueOrDefault());
            resultMax.Add(rpt2.C11.GetValueOrDefault());
            resultMax.Add(rpt2.C12.GetValueOrDefault());
            s2.Data = resultMax;
            hc.series.Add(s2);
            #endregion

            #region GetAvg
            Serie s3 = new Serie();
            s3.Name = "Avg";
            Rpt_EndPoint_IOs_Months_Result rpt3 = rpt[2];
            List<int> resultAvg = new List<int>();
            resultAvg.Add(rpt3.C1.GetValueOrDefault());
            resultAvg.Add(rpt3.C2.GetValueOrDefault());
            resultAvg.Add(rpt3.C3.GetValueOrDefault());
            resultAvg.Add(rpt3.C4.GetValueOrDefault());
            resultAvg.Add(rpt3.C5.GetValueOrDefault());
            resultAvg.Add(rpt3.C6.GetValueOrDefault());
            resultAvg.Add(rpt3.C7.GetValueOrDefault());
            resultAvg.Add(rpt3.C8.GetValueOrDefault());
            resultAvg.Add(rpt3.C9.GetValueOrDefault());
            resultAvg.Add(rpt3.C10.GetValueOrDefault());
            resultAvg.Add(rpt3.C11.GetValueOrDefault());
            resultAvg.Add(rpt3.C12.GetValueOrDefault());
            s3.Data = resultAvg;
            hc.series.Add(s3);
            #endregion



            return hc;
        }

        public Chart IOs_Daily(long endPointID)
        {
            Endpoint ep = UnitOfWork_Repositories.repoEndpoints.Find(endPointID);

            Chart hc = new Chart();
            hc.title.Text = "Endpoint Daily Report";
            hc.subTitle.Text = endPointID.ToString();
            hc.xAxis.GenerateDaysList(true);
            hc.legend.layout = Layout.vertical.ToString();

            List<Rpt_EndPoint_IOs_Days_Result> rpt = db.Rpt_EndPoint_IOs_Days(endPointID).ToList();

            #region GetMin
            Serie s1 = new Serie();
            s1.Name = "Min";
            Rpt_EndPoint_IOs_Days_Result rpt1 = rpt[0];
            List<int> resultMin = new List<int>();
            resultMin.Add(rpt1.C1.GetValueOrDefault());
            resultMin.Add(rpt1.C2.GetValueOrDefault());
            resultMin.Add(rpt1.C3.GetValueOrDefault());
            resultMin.Add(rpt1.C4.GetValueOrDefault());
            resultMin.Add(rpt1.C5.GetValueOrDefault());
            resultMin.Add(rpt1.C6.GetValueOrDefault());
            resultMin.Add(rpt1.C7.GetValueOrDefault());
            resultMin.Add(rpt1.C8.GetValueOrDefault());
            resultMin.Add(rpt1.C9.GetValueOrDefault());
            resultMin.Add(rpt1.C10.GetValueOrDefault());
            resultMin.Add(rpt1.C11.GetValueOrDefault());
            resultMin.Add(rpt1.C12.GetValueOrDefault());
            resultMin.Add(rpt1.C13.GetValueOrDefault());
            resultMin.Add(rpt1.C14.GetValueOrDefault());
            resultMin.Add(rpt1.C15.GetValueOrDefault());
            resultMin.Add(rpt1.C16.GetValueOrDefault());
            resultMin.Add(rpt1.C17.GetValueOrDefault());
            resultMin.Add(rpt1.C18.GetValueOrDefault());
            resultMin.Add(rpt1.C19.GetValueOrDefault());
            resultMin.Add(rpt1.C20.GetValueOrDefault());
            resultMin.Add(rpt1.C21.GetValueOrDefault());
            resultMin.Add(rpt1.C22.GetValueOrDefault());
            resultMin.Add(rpt1.C23.GetValueOrDefault());
            resultMin.Add(rpt1.C24.GetValueOrDefault());
            resultMin.Add(rpt1.C25.GetValueOrDefault());
            resultMin.Add(rpt1.C26.GetValueOrDefault());
            resultMin.Add(rpt1.C27.GetValueOrDefault());
            resultMin.Add(rpt1.C28.GetValueOrDefault());
            resultMin.Add(rpt1.C29.GetValueOrDefault());
            resultMin.Add(rpt1.C30.GetValueOrDefault());
            resultMin.Reverse();
            s1.Data = resultMin;
            hc.series.Add(s1);
            #endregion

            #region GetMax
            Serie s2 = new Serie();
            s2.Name = "Max";
            Rpt_EndPoint_IOs_Days_Result rpt2 = rpt[1];
            List<int> resultMax = new List<int>();
            resultMax.Add(rpt2.C1.GetValueOrDefault());
            resultMax.Add(rpt2.C2.GetValueOrDefault());
            resultMax.Add(rpt2.C3.GetValueOrDefault());
            resultMax.Add(rpt2.C4.GetValueOrDefault());
            resultMax.Add(rpt2.C5.GetValueOrDefault());
            resultMax.Add(rpt2.C6.GetValueOrDefault());
            resultMax.Add(rpt2.C7.GetValueOrDefault());
            resultMax.Add(rpt2.C8.GetValueOrDefault());
            resultMax.Add(rpt2.C9.GetValueOrDefault());
            resultMax.Add(rpt2.C10.GetValueOrDefault());
            resultMax.Add(rpt2.C11.GetValueOrDefault());
            resultMax.Add(rpt2.C12.GetValueOrDefault());
            resultMax.Add(rpt2.C13.GetValueOrDefault());
            resultMax.Add(rpt2.C14.GetValueOrDefault());
            resultMax.Add(rpt2.C15.GetValueOrDefault());
            resultMax.Add(rpt2.C16.GetValueOrDefault());
            resultMax.Add(rpt2.C17.GetValueOrDefault());
            resultMax.Add(rpt2.C18.GetValueOrDefault());
            resultMax.Add(rpt2.C19.GetValueOrDefault());
            resultMax.Add(rpt2.C20.GetValueOrDefault());
            resultMax.Add(rpt2.C21.GetValueOrDefault());
            resultMax.Add(rpt2.C22.GetValueOrDefault());
            resultMax.Add(rpt2.C23.GetValueOrDefault());
            resultMax.Add(rpt2.C24.GetValueOrDefault());
            resultMax.Add(rpt2.C25.GetValueOrDefault());
            resultMax.Add(rpt2.C26.GetValueOrDefault());
            resultMax.Add(rpt2.C27.GetValueOrDefault());
            resultMax.Add(rpt2.C28.GetValueOrDefault());
            resultMax.Add(rpt2.C29.GetValueOrDefault());
            resultMax.Add(rpt2.C30.GetValueOrDefault());
            resultMax.Reverse();
            s2.Data = resultMax;
            hc.series.Add(s2);
            #endregion

            #region GetAvg
            Serie s3 = new Serie();
            s3.Name = "Avg";
            Rpt_EndPoint_IOs_Days_Result rpt3 = rpt[2];
            List<int> resultAvg = new List<int>();
            resultAvg.Add(rpt3.C1.GetValueOrDefault());
            resultAvg.Add(rpt3.C2.GetValueOrDefault());
            resultAvg.Add(rpt3.C3.GetValueOrDefault());
            resultAvg.Add(rpt3.C4.GetValueOrDefault());
            resultAvg.Add(rpt3.C5.GetValueOrDefault());
            resultAvg.Add(rpt3.C6.GetValueOrDefault());
            resultAvg.Add(rpt3.C7.GetValueOrDefault());
            resultAvg.Add(rpt3.C8.GetValueOrDefault());
            resultAvg.Add(rpt3.C9.GetValueOrDefault());
            resultAvg.Add(rpt3.C10.GetValueOrDefault());
            resultAvg.Add(rpt3.C11.GetValueOrDefault());
            resultAvg.Add(rpt3.C12.GetValueOrDefault());
            resultAvg.Add(rpt3.C13.GetValueOrDefault());
            resultAvg.Add(rpt3.C14.GetValueOrDefault());
            resultAvg.Add(rpt3.C15.GetValueOrDefault());
            resultAvg.Add(rpt3.C16.GetValueOrDefault());
            resultAvg.Add(rpt3.C17.GetValueOrDefault());
            resultAvg.Add(rpt3.C18.GetValueOrDefault());
            resultAvg.Add(rpt3.C19.GetValueOrDefault());
            resultAvg.Add(rpt3.C20.GetValueOrDefault());
            resultAvg.Add(rpt3.C21.GetValueOrDefault());
            resultAvg.Add(rpt3.C22.GetValueOrDefault());
            resultAvg.Add(rpt3.C23.GetValueOrDefault());
            resultAvg.Add(rpt3.C24.GetValueOrDefault());
            resultAvg.Add(rpt3.C25.GetValueOrDefault());
            resultAvg.Add(rpt3.C26.GetValueOrDefault());
            resultAvg.Add(rpt3.C27.GetValueOrDefault());
            resultAvg.Add(rpt3.C28.GetValueOrDefault());
            resultAvg.Add(rpt3.C29.GetValueOrDefault());
            resultAvg.Add(rpt3.C30.GetValueOrDefault());
            resultAvg.Reverse();
            s3.Data = resultAvg;
            hc.series.Add(s3);
            #endregion



            return hc;
        }


    }
}
