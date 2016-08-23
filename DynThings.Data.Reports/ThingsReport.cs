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
    public class ThingsReport
    {
        #region Constructor
        public DynThingsEntities db { get; set; }
        public ThingsReport(DynThingsEntities dynThingsEntities)
        {
            this.db = dynThingsEntities;
        }
        #endregion


        public Chart IOs_Minute(long ThingID,long EndPointTypeID)
        {
            EndPointType endType = UnitOfWork_Repositories.repoEndpointTypes.Find(EndPointTypeID);
            Thing th = UnitOfWork_Repositories.repoThings.Find(ThingID);
            Chart hc = new Chart("HC_" + "Thing" + ThingID + "EndPointType" + EndPointTypeID + "Inputs");
            hc.title.Text = "Last 60 Minutes";
            hc.subTitle.Text = th.Title + " - " + endType.Title ;
            hc.xAxis.GenerateMinutesList(true);
            hc.legend.layout = Layout.vertical.ToString();

            List<Rpt_ThingEnd_IOs_Minutes_Result> rpt = db.Rpt_ThingEnd_IOs_Minutes(ThingID,EndPointTypeID).ToList();

            #region GetMin
            Serie s1 = new Serie();
            s1.Name = "Min";
            Rpt_ThingEnd_IOs_Minutes_Result rpt1 = rpt[0];
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
            resultMin.Add(rpt1.C31.GetValueOrDefault());
            resultMin.Add(rpt1.C32.GetValueOrDefault());
            resultMin.Add(rpt1.C32.GetValueOrDefault());
            resultMin.Add(rpt1.C33.GetValueOrDefault());
            resultMin.Add(rpt1.C34.GetValueOrDefault());
            resultMin.Add(rpt1.C35.GetValueOrDefault());
            resultMin.Add(rpt1.C36.GetValueOrDefault());
            resultMin.Add(rpt1.C37.GetValueOrDefault());
            resultMin.Add(rpt1.C38.GetValueOrDefault());
            resultMin.Add(rpt1.C39.GetValueOrDefault());
            resultMin.Add(rpt1.C40.GetValueOrDefault());
            resultMin.Add(rpt1.C41.GetValueOrDefault());
            resultMin.Add(rpt1.C42.GetValueOrDefault());
            resultMin.Add(rpt1.C43.GetValueOrDefault());
            resultMin.Add(rpt1.C44.GetValueOrDefault());
            resultMin.Add(rpt1.C45.GetValueOrDefault());
            resultMin.Add(rpt1.C46.GetValueOrDefault());
            resultMin.Add(rpt1.C47.GetValueOrDefault());
            resultMin.Add(rpt1.C48.GetValueOrDefault());
            resultMin.Add(rpt1.C49.GetValueOrDefault());
            resultMin.Add(rpt1.C50.GetValueOrDefault());
            resultMin.Add(rpt1.C51.GetValueOrDefault());
            resultMin.Add(rpt1.C52.GetValueOrDefault());
            resultMin.Add(rpt1.C53.GetValueOrDefault());
            resultMin.Add(rpt1.C54.GetValueOrDefault());
            resultMin.Add(rpt1.C55.GetValueOrDefault());
            resultMin.Add(rpt1.C56.GetValueOrDefault());
            resultMin.Add(rpt1.C57.GetValueOrDefault());
            resultMin.Add(rpt1.C58.GetValueOrDefault());
            resultMin.Add(rpt1.C59.GetValueOrDefault());
            resultMin.Add(rpt1.C60.GetValueOrDefault());
            resultMin.Reverse();
            s1.Data = resultMin;
            hc.series.Add(s1);
            #endregion

            #region GetMax
            Serie s2 = new Serie();
            s2.Name = "Max";
            Rpt_ThingEnd_IOs_Minutes_Result rpt2 = rpt[1];
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
            resultMax.Add(rpt2.C31.GetValueOrDefault());
            resultMax.Add(rpt2.C32.GetValueOrDefault());
            resultMax.Add(rpt2.C32.GetValueOrDefault());
            resultMax.Add(rpt2.C33.GetValueOrDefault());
            resultMax.Add(rpt2.C34.GetValueOrDefault());
            resultMax.Add(rpt2.C35.GetValueOrDefault());
            resultMax.Add(rpt2.C36.GetValueOrDefault());
            resultMax.Add(rpt2.C37.GetValueOrDefault());
            resultMax.Add(rpt2.C38.GetValueOrDefault());
            resultMax.Add(rpt2.C39.GetValueOrDefault());
            resultMax.Add(rpt2.C40.GetValueOrDefault());
            resultMax.Add(rpt2.C41.GetValueOrDefault());
            resultMax.Add(rpt2.C42.GetValueOrDefault());
            resultMax.Add(rpt2.C43.GetValueOrDefault());
            resultMax.Add(rpt2.C44.GetValueOrDefault());
            resultMax.Add(rpt2.C45.GetValueOrDefault());
            resultMax.Add(rpt2.C46.GetValueOrDefault());
            resultMax.Add(rpt2.C47.GetValueOrDefault());
            resultMax.Add(rpt2.C48.GetValueOrDefault());
            resultMax.Add(rpt2.C49.GetValueOrDefault());
            resultMax.Add(rpt2.C50.GetValueOrDefault());
            resultMax.Add(rpt2.C51.GetValueOrDefault());
            resultMax.Add(rpt2.C52.GetValueOrDefault());
            resultMax.Add(rpt2.C53.GetValueOrDefault());
            resultMax.Add(rpt2.C54.GetValueOrDefault());
            resultMax.Add(rpt2.C55.GetValueOrDefault());
            resultMax.Add(rpt2.C56.GetValueOrDefault());
            resultMax.Add(rpt2.C57.GetValueOrDefault());
            resultMax.Add(rpt2.C58.GetValueOrDefault());
            resultMax.Add(rpt2.C59.GetValueOrDefault());
            resultMax.Add(rpt2.C60.GetValueOrDefault());
            resultMax.Reverse();
            s2.Data = resultMax;
            hc.series.Add(s2);
            #endregion

            #region GetAvg
            Serie s3 = new Serie();
            s3.Name = "Avg";
            Rpt_ThingEnd_IOs_Minutes_Result rpt3 = rpt[2];
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
            resultAvg.Add(rpt3.C31.GetValueOrDefault());
            resultAvg.Add(rpt3.C32.GetValueOrDefault());
            resultAvg.Add(rpt3.C32.GetValueOrDefault());
            resultAvg.Add(rpt3.C33.GetValueOrDefault());
            resultAvg.Add(rpt3.C34.GetValueOrDefault());
            resultAvg.Add(rpt3.C35.GetValueOrDefault());
            resultAvg.Add(rpt3.C36.GetValueOrDefault());
            resultAvg.Add(rpt3.C37.GetValueOrDefault());
            resultAvg.Add(rpt3.C38.GetValueOrDefault());
            resultAvg.Add(rpt3.C39.GetValueOrDefault());
            resultAvg.Add(rpt3.C40.GetValueOrDefault());
            resultAvg.Add(rpt3.C41.GetValueOrDefault());
            resultAvg.Add(rpt3.C42.GetValueOrDefault());
            resultAvg.Add(rpt3.C43.GetValueOrDefault());
            resultAvg.Add(rpt3.C44.GetValueOrDefault());
            resultAvg.Add(rpt3.C45.GetValueOrDefault());
            resultAvg.Add(rpt3.C46.GetValueOrDefault());
            resultAvg.Add(rpt3.C47.GetValueOrDefault());
            resultAvg.Add(rpt3.C48.GetValueOrDefault());
            resultAvg.Add(rpt3.C49.GetValueOrDefault());
            resultAvg.Add(rpt3.C50.GetValueOrDefault());
            resultAvg.Add(rpt3.C51.GetValueOrDefault());
            resultAvg.Add(rpt3.C52.GetValueOrDefault());
            resultAvg.Add(rpt3.C53.GetValueOrDefault());
            resultAvg.Add(rpt3.C54.GetValueOrDefault());
            resultAvg.Add(rpt3.C55.GetValueOrDefault());
            resultAvg.Add(rpt3.C56.GetValueOrDefault());
            resultAvg.Add(rpt3.C57.GetValueOrDefault());
            resultAvg.Add(rpt3.C58.GetValueOrDefault());
            resultAvg.Add(rpt3.C59.GetValueOrDefault());
            resultAvg.Add(rpt3.C60.GetValueOrDefault());
            resultAvg.Reverse();
            s3.Data = resultAvg;
            hc.series.Add(s3);
            #endregion

            return hc;
        }

        public Chart IOs_Hour(long ThingID,long EndPointTypeID)
        {
            Thing ep = UnitOfWork_Repositories.repoThings.Find(ThingID);
            Chart hc = new Chart("HC_" + "Thing" + ThingID + "EndPointType" + EndPointTypeID + "Inputs");
            hc.title.Text = "Last 24 Hours";
            hc.subTitle.Text = ep.Title;
            hc.xAxis.GenerateHoursList(true);
            hc.legend.layout = Layout.vertical.ToString();

            List<Rpt_ThingEnd_IOs_Hours_Result> rpt = db.Rpt_ThingEnd_IOs_Hours(ThingID, EndPointTypeID).ToList();

            #region GetMin
            Serie s1 = new Serie();
            s1.Name = "Min";
            Rpt_ThingEnd_IOs_Hours_Result rpt1 = rpt[0];
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
            resultMin.Reverse();
            s1.Data = resultMin;
            hc.series.Add(s1);
            #endregion

            #region GetMax
            Serie s2 = new Serie();
            s2.Name = "Max";
            Rpt_ThingEnd_IOs_Hours_Result rpt2 = rpt[1];
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
            resultMax.Reverse();
            s2.Data = resultMax;
            hc.series.Add(s2);
            #endregion

            #region GetAvg
            Serie s3 = new Serie();
            s3.Name = "Avg";
            Rpt_ThingEnd_IOs_Hours_Result rpt3 = rpt[2];
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
            resultAvg.Reverse();
            s3.Data = resultAvg;
            hc.series.Add(s3);
            #endregion

            return hc;
        }

        public Chart IOs_Days(long ThingID, long EndPointTypeID)
        {
            EndPointType endType = UnitOfWork_Repositories.repoEndpointTypes.Find(EndPointTypeID);
            Thing th = UnitOfWork_Repositories.repoThings.Find(ThingID);
            Chart hc = new Chart("HC_" + "Thing" + ThingID + "EndPointType" + EndPointTypeID + "Inputs");
            hc.title.Text = "Last 30 Days";
            hc.subTitle.Text = th.Title + " - " + endType.Title;
            hc.xAxis.GenerateDaysList(true);
            hc.legend.layout = Layout.vertical.ToString();

            List<Rpt_ThingEnd_IOs_Days_Result> rpt = db.Rpt_ThingEnd_IOs_Days(ThingID, EndPointTypeID).ToList();

            #region GetMin
            Serie s1 = new Serie();
            s1.Name = "Min";
            Rpt_ThingEnd_IOs_Days_Result rpt1 = rpt[0];
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
            Rpt_ThingEnd_IOs_Days_Result rpt2 = rpt[1];
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
            Rpt_ThingEnd_IOs_Days_Result rpt3 = rpt[2];
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

        public Chart IOs_Months(long ThingID, long EndPointTypeID,long Year)
        {
            EndPointType endType = UnitOfWork_Repositories.repoEndpointTypes.Find(EndPointTypeID);
            Thing th = UnitOfWork_Repositories.repoThings.Find(ThingID);
            Chart hc = new Chart("HC_" + "Thing" + ThingID + "EndPointType" + EndPointTypeID + "Inputs");
            hc.title.Text = "Last 12 Months";
            hc.subTitle.Text = th.Title + " - " + endType.Title;
            hc.xAxis.GenerateMonthsList();
            hc.legend.layout = Layout.vertical.ToString();

            List<Rpt_ThingEnd_IOs_Months_Result> rpt = db.Rpt_ThingEnd_IOs_Months(ThingID, EndPointTypeID,Year).ToList();

            #region GetMin
            Serie s1 = new Serie();
            s1.Name = "Min";
            Rpt_ThingEnd_IOs_Months_Result rpt1 = rpt[0];
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
            resultMin.Reverse();
            s1.Data = resultMin;
            hc.series.Add(s1);
            #endregion

            #region GetMax
            Serie s2 = new Serie();
            s2.Name = "Max";
            Rpt_ThingEnd_IOs_Months_Result rpt2 = rpt[1];
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
            resultMax.Reverse();
            s2.Data = resultMax;
            hc.series.Add(s2);
            #endregion

            #region GetAvg
            Serie s3 = new Serie();
            s3.Name = "Avg";
            Rpt_ThingEnd_IOs_Months_Result rpt3 = rpt[2];
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
            resultAvg.Reverse();
            s3.Data = resultAvg;
            hc.series.Add(s3);
            #endregion

            return hc;
        }
    }
}
