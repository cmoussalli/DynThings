using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.ServiceProcess;
using System.Text;
using System.Threading.Tasks;
using System.Timers;
using DynThings.Core;
using System.Configuration;

namespace DynThings.Service
{
    public partial class ServiceCore : ServiceBase
    {
        string evSource;
        string evLog;


        Timer tim = new Timer();


        #region ServiceCore

        public ServiceCore()
        {
            InitializeComponent();
        }

        public void OnDebug()
        {
            OnStart(null);
        }


        protected override void OnStart(string[] args)
        {
            evSource = "DynThings Background Service";
            evLog = "Application";
            if (!EventLog.SourceExists(evSource))
                EventLog.CreateEventSource(evSource, evLog);

            string[] values = System.IO.File.ReadAllLines(AppDomain.CurrentDomain.BaseDirectory + @"DynThings.Service.exe.configs");
            string serverStr = values[0].ToString();
            string databaseStr = values[1].ToString();
            string usernameStr = values[2].ToString();
            string passwordStr = values[3].ToString();
            SetupModels.DatabaseSetup dbModel = new SetupModels.DatabaseSetup(serverStr, databaseStr, usernameStr, passwordStr);

            ConnectionStringSettings c1 = ConfigurationManager.ConnectionStrings["DefaultConnection"];
            ConnectionStringSettings c2 = ConfigurationManager.ConnectionStrings["DynThingsEntities"];

            string con1 = "connectionString=\"Data Source=" + dbModel.Server + ";Initial Catalog=" + dbModel.DatabaseName + ";user id=" + dbModel.User + ";password=" + dbModel.Password + ";multipleactiveresultsets=True;application name=EntityFramework\" ";
            string con2 = "connectionString=\"metadata = res://*/;provider=System.Data.SqlClient;provider connection string='data source=" + dbModel.Server + ";initial catalog=" + dbModel.DatabaseName + ";user id=" + dbModel.User + ";password=" + dbModel.Password + ";multipleactiveresultsets=True;application name=EntityFramework'\" ";

            string source = System.IO.File.ReadAllText(AppContext.BaseDirectory + @"\DynThings.Service.exe.config");
            int source1Start = source.IndexOf("DefaultConnection" ) + 19;
            int source1End = source.IndexOf("providerName=\"System.Data.SqlClient\"") - source1Start;
            string out1 = source.Remove(source1Start,source1End);
            source = out1.Insert(source1Start, con1);

            int source2Start = source.IndexOf("DynThingsEntities") + 19;
            int source2End = source.IndexOf("providerName=\"System.Data.EntityClient\"") - source2Start;
            string out2 = source.Remove(source2Start, source2End);
            source = out2.Insert(source2Start, con2);

            System.IO.File.WriteAllText(AppContext.BaseDirectory + @"\DynThings.Service.exe.config", source);

            EventLog.WriteEntry(evSource, "Service Started", EventLogEntryType.Information);

        }


        protected override void OnStop()
        {
            EventLog.WriteEntry(evSource, "Service Stoped", EventLogEntryType.Information);
        }
        #endregion




        private void timer1_Elapsed(object sender, ElapsedEventArgs e)
        {
            timer1.Enabled = false;
            Mails mailsService = new Mails();
            mailsService.SendPendingEmails(10);
            timer1.Enabled = true;
        }
    }
}
