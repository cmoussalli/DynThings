using DynThings.Data.Models;
using System.Collections.Generic;
using System.Linq;
using DynHighCharts;
using DynThings.Data.Repositories;
using DynHighCharts.Properies;
using DynHighCharts.Enums;
using static DynThings.Data.WidgetModels.InfoBoxs;

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
            s1.Name = "EndPoint's connections";
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

            #region GetDevicesIOs Count
            Serie s2 = new Serie();
            s2.Name = " Device's connections";
            Rpt_EndPointAndDevices_IOsCount_Minutes_Result rpt2 = rpt[1];
            List<int> resultDevicess = new List<int>();
            resultDevicess.Add(rpt2.C1.GetValueOrDefault());
            resultDevicess.Add(rpt2.C2.GetValueOrDefault());
            resultDevicess.Add(rpt2.C3.GetValueOrDefault());
            resultDevicess.Add(rpt2.C4.GetValueOrDefault());
            resultDevicess.Add(rpt2.C5.GetValueOrDefault());
            resultDevicess.Add(rpt2.C6.GetValueOrDefault());
            resultDevicess.Add(rpt2.C7.GetValueOrDefault());
            resultDevicess.Add(rpt2.C8.GetValueOrDefault());
            resultDevicess.Add(rpt2.C9.GetValueOrDefault());
            resultDevicess.Add(rpt2.C10.GetValueOrDefault());
            resultDevicess.Add(rpt2.C11.GetValueOrDefault());
            resultDevicess.Add(rpt2.C12.GetValueOrDefault());
            resultDevicess.Add(rpt2.C13.GetValueOrDefault());
            resultDevicess.Add(rpt2.C14.GetValueOrDefault());
            resultDevicess.Add(rpt2.C15.GetValueOrDefault());
            resultDevicess.Add(rpt2.C16.GetValueOrDefault());
            resultDevicess.Add(rpt2.C17.GetValueOrDefault());
            resultDevicess.Add(rpt2.C18.GetValueOrDefault());
            resultDevicess.Add(rpt2.C19.GetValueOrDefault());
            resultDevicess.Add(rpt2.C20.GetValueOrDefault());
            resultDevicess.Add(rpt2.C21.GetValueOrDefault());
            resultDevicess.Add(rpt2.C22.GetValueOrDefault());
            resultDevicess.Add(rpt2.C23.GetValueOrDefault());
            resultDevicess.Add(rpt2.C24.GetValueOrDefault());
            resultDevicess.Add(rpt2.C25.GetValueOrDefault());
            resultDevicess.Add(rpt2.C26.GetValueOrDefault());
            resultDevicess.Add(rpt2.C27.GetValueOrDefault());
            resultDevicess.Add(rpt2.C28.GetValueOrDefault());
            resultDevicess.Add(rpt2.C29.GetValueOrDefault());
            resultDevicess.Add(rpt2.C30.GetValueOrDefault());
            resultDevicess.Add(rpt2.C31.GetValueOrDefault());
            resultDevicess.Add(rpt2.C32.GetValueOrDefault());
            resultDevicess.Add(rpt2.C32.GetValueOrDefault());
            resultDevicess.Add(rpt2.C33.GetValueOrDefault());
            resultDevicess.Add(rpt2.C34.GetValueOrDefault());
            resultDevicess.Add(rpt2.C35.GetValueOrDefault());
            resultDevicess.Add(rpt2.C36.GetValueOrDefault());
            resultDevicess.Add(rpt2.C37.GetValueOrDefault());
            resultDevicess.Add(rpt2.C38.GetValueOrDefault());
            resultDevicess.Add(rpt2.C39.GetValueOrDefault());
            resultDevicess.Add(rpt2.C40.GetValueOrDefault());
            resultDevicess.Add(rpt2.C41.GetValueOrDefault());
            resultDevicess.Add(rpt2.C42.GetValueOrDefault());
            resultDevicess.Add(rpt2.C43.GetValueOrDefault());
            resultDevicess.Add(rpt2.C44.GetValueOrDefault());
            resultDevicess.Add(rpt2.C45.GetValueOrDefault());
            resultDevicess.Add(rpt2.C46.GetValueOrDefault());
            resultDevicess.Add(rpt2.C47.GetValueOrDefault());
            resultDevicess.Add(rpt2.C48.GetValueOrDefault());
            resultDevicess.Add(rpt2.C49.GetValueOrDefault());
            resultDevicess.Add(rpt2.C50.GetValueOrDefault());
            resultDevicess.Add(rpt2.C51.GetValueOrDefault());
            resultDevicess.Add(rpt2.C52.GetValueOrDefault());
            resultDevicess.Add(rpt2.C53.GetValueOrDefault());
            resultDevicess.Add(rpt2.C54.GetValueOrDefault());
            resultDevicess.Add(rpt2.C55.GetValueOrDefault());
            resultDevicess.Add(rpt2.C56.GetValueOrDefault());
            resultDevicess.Add(rpt2.C57.GetValueOrDefault());
            resultDevicess.Add(rpt2.C58.GetValueOrDefault());
            resultDevicess.Add(rpt2.C59.GetValueOrDefault());
            resultDevicess.Add(rpt2.C60.GetValueOrDefault());
            resultDevicess.Reverse();
            s2.Data = resultDevicess;
            hc.series.Add(s2);
            #endregion


            return hc;
        }

        public InfoBox LastHourConnectionsStatistics()
        {
            InfoBox result = new InfoBox();
            result.ID = "InfoBox_LastHourConnections";
            result.Color = InfoBoxColor.success;
            result.Title = "Last Hour Connections";

            List<InfoBoxEntry> entries = new List<InfoBoxEntry>();
            List<Rpt_LastHoursConnections_Result> cons = db.Rpt_LastHoursConnections().ToList();

            InfoBoxEntry entry1 = new InfoBoxEntry();
            entry1.InfoBoxEntryType = InfoBoxEntryType.Text;
            entry1.Title = "EndPoint IOs";
            entry1.Value = cons[0].EndPointConnections.ToString();
            entries.Add(entry1);

            InfoBoxEntry entry2 = new InfoBoxEntry();
            entry2.InfoBoxEntryType = InfoBoxEntryType.Text;
            entry2.Title = "Devices IOs";
            entry2.Value = cons[0].DeviceConnections.ToString();
            entries.Add(entry2);

            InfoBoxEntry entry3 = new InfoBoxEntry();
            entry3.InfoBoxEntryType = InfoBoxEntryType.Text;
            entry3.Title = "API Utilisation";
            entry3.Value = cons[0].APIConnections.ToString();
            entries.Add(entry3);

            result.Entries = entries;
            return result;
        }


    }
}
