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
        string ServiceName = "DynThings Background Service";

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
            try
            {
                SaveConfig();
                MessageBox.Show("Configurations has been saved, but you must stop and re-run the background service in order to get the latest configs.");

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

        }

        private void btnService_Click(object sender, EventArgs e)
        {
            try
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
            catch (Exception ex)
            {
                MessageBox.Show("Error: " + ex.Message);
            }
        }



        private void LoadConfig()
        {
            //string connectionStr = System.Configuration.ConfigurationManager.ConnectionStrings["DynThingsEntities"].ConnectionString;

            //EntityConnectionStringBuilder connectionEntity = new EntityConnectionStringBuilder(connectionStr);
            //string x = connectionEntity.ProviderConnectionString;
            //SqlConnection connectionSQL = new SqlConnection(x);
            //connectionInfo.Server = connectionSQL.DataSource;
            //connectionInfo.Database = connectionSQL.Database;
            //string tempString = "";
            ////GetUser
            //int userBegin = x.IndexOf("user id=");
            //tempString = x.Substring(userBegin + 8);
            //int userEnd = tempString.IndexOf(";");
            //connectionInfo.User = tempString.Substring(0, userEnd);

            ////GetPassword
            //int passwordBegin = x.IndexOf("password=");
            //tempString = x.Substring(passwordBegin + 9);
            //int passwordEnd = tempString.IndexOf(";");
            //connectionInfo.Password = tempString.Substring(0, passwordEnd);
            try
            {
                string[] values = System.IO.File.ReadAllLines(AppDomain.CurrentDomain.BaseDirectory + @"DynThings.Service.exe.configs");
                string serverStr = values[0].ToString();
                string databaseStr = values[1].ToString();
                string usernameStr = values[2].ToString();
                string passwordStr = values[3].ToString();

                txtServer.Text = serverStr;
                txtDatabase.Text = databaseStr;
                txtUser.Text = usernameStr;
                txtPassword.Text = passwordStr;
            }
            catch (Exception ex)
            {

            }
        }

        private void SaveConfig()
        {
            try
            {
                string[] values = { txtServer.Text, txtDatabase.Text, txtUser.Text, txtPassword.Text };
                System.IO.File.WriteAllLines(AppDomain.CurrentDomain.BaseDirectory + @"DynThings.Service.exe.configs", values);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

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
                        btnService.Text = "Stop";
                        break;
                    case ServiceControllerStatus.Stopped:
                        btnService.Text = "Start";
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

        private void timer1_Tick(object sender, EventArgs e)
        {
            ValidateServiceStatus();

        }
    }
}
