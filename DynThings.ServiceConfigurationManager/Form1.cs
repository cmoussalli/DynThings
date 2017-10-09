using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.Entity;
using System.Data.Entity.Core.EntityClient;
using DynThings.Core;
using System.ServiceProcess;

namespace DynThings.ServiceConfigurationManager
{


    public partial class Form1 : Form
    {
        string ServiceName = "DynThings.Service";

        class ConnectionInfo
        {
            public string Server { get; set; }
            public string Database { get; set; }
            public string User { get; set; }
            public string Password { get; set; }
        }

        ConnectionInfo connectionInfo = new ConnectionInfo();

        public Form1()
        {
            InitializeComponent();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            ValidateServiceStatus();
            LoadConfig();
        }


        private void Form1_Load(object sender, EventArgs e)
        {
            ValidateServiceStatus();
            LoadConfig();
        }


        private void btnSave_Click(object sender, EventArgs e)
        {
            SaveConfig();
            MessageBox.Show("Configurations has been saved");

        }

        private void btnService_Click(object sender, EventArgs e)
        {
            ServiceController sc = new ServiceController(ServiceName);
            if (sc.Status == ServiceControllerStatus.Stopped)
            {
                sc.Start();

            }
            if (sc.Status == ServiceControllerStatus.Running)
            {
                sc.Stop();

            }
        }



        private void LoadConfig()
        {
            string connectionStr = System.Configuration.ConfigurationManager.ConnectionStrings["DynThingsEntities"].ConnectionString;

            EntityConnectionStringBuilder connectionEntity = new EntityConnectionStringBuilder(connectionStr);
            string x = connectionEntity.ProviderConnectionString;
            SqlConnection connectionSQL = new SqlConnection(x);
            connectionInfo.Server = connectionSQL.DataSource;
            connectionInfo.Database = connectionSQL.Database;
            string tempString = "";
            //GetUser
            int userBegin = x.IndexOf("user id=");
            tempString = x.Substring(userBegin + 8);
            int userEnd = tempString.IndexOf(";");
            connectionInfo.User = tempString.Substring(0, userEnd);

            //GetPassword
            int passwordBegin = x.IndexOf("password=");
            tempString = x.Substring(passwordBegin + 9);
            int passwordEnd = tempString.IndexOf(";");
            connectionInfo.Password = tempString.Substring(0, passwordEnd);

            txtServer.Text = connectionInfo.Server;
            txtDatabase.Text = connectionInfo.Database;
            txtUser.Text = connectionInfo.User;
            txtPassword.Text = connectionInfo.Password;

        }

        private void SaveConfig()
        {
            SetupModels.DatabaseSetup databaseModel = new SetupModels.DatabaseSetup();
            databaseModel.Server = txtServer.Text;
            databaseModel.DatabaseName = txtDatabase.Text;
            databaseModel.User = txtUser.Text;
            databaseModel.Password = txtPassword.Text;
            DynThings.Core.Database.SetDatabaseConnection(databaseModel);
        }

        private void ValidateServiceStatus()
        {
            EnableAll();
            try
            {
                ServiceController sc = new ServiceController(ServiceName);

                lblServiceStatus.Text = sc.Status.ToString();
                btnService.Enabled = true;
                switch (sc.Status)
                {
                    case ServiceControllerStatus.Running:
                        lblServiceStatus.Text = "Runing";
                        break;
                    case ServiceControllerStatus.Stopped:

                        break;
                    case ServiceControllerStatus.Paused:

                        break;
                    case ServiceControllerStatus.StopPending:

                        break;
                    case ServiceControllerStatus.StartPending:

                        break;
                    default:

                        break;
                }
            }
            catch (Exception ex)
            {
                lblServiceStatus.Text = "Service is not Installed";
                DisableAll();
            }

        }

        private void DisableAll()
        {
            btnSave.Enabled = false;
            btnService.Enabled = false;
            txtServer.Enabled = false;
            txtDatabase.Enabled = false;
            txtUser.Enabled = false;
            txtPassword.Enabled = false;
        }

        private void EnableAll()
        {
            btnSave.Enabled = true;
            btnService.Enabled = true;
            txtServer.Enabled = true;
            txtDatabase.Enabled = true;
            txtUser.Enabled = true;
            txtPassword.Enabled = true;
        }
    }
}
