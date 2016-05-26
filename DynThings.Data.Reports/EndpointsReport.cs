using DynThings.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DynHighCharts;
using DynThings.Data.Repositories;
using DynHighCharts.Properies;

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

        public Chart IOs_Monthly_Average(long endPointID)
        {
            Endpoint ep = UnitOfWork_Repositories.repoEndpoints.Find(endPointID);

            Chart hc = new Chart();
            hc.title.Text = "Monthly Average";
            hc.subTitle.Text = endPointID.ToString();
            hc.xAxis.GenerateMonthsList();


            List<Rpt_EndPoint_IOs_Months_Result> rpt = db.Rpt_EndPoint_IOs_Months(endPointID).ToList();


            Serie s3 = new Serie();
            s3.Name = "Avg";

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

            #region GetMin
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




            return hc;
        }

       
    }
}
