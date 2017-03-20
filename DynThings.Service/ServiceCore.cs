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


namespace DynThings.Service
{
    public partial class ServiceCore : ServiceBase
    {

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

            
        }


        protected override void OnStop()
        {
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
