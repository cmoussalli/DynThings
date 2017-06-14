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

namespace DynThings.ServiceConfigurationManager
{
    class ConnectionInfo
    {
        public string Server { get; set; }
        public string Database { get; set; }
        public string User { get; set; }
        public string Password { get; set; }
    }

    public partial class Form1 : Form
    {
        ConnectionInfo connectionInfo = new ConnectionInfo();

        public Form1()
        {
            InitializeComponent();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            LoadConfig();
        }

        private void LoadConfig()
        {
            string connectionStr = System.Configuration.ConfigurationManager.ConnectionStrings["DynThingsEntities"].ConnectionString;
            MessageBox.Show(connectionStr);

            EntityConnectionStringBuilder connectionEntity = new EntityConnectionStringBuilder(connectionStr);
            string x = connectionEntity.ProviderConnectionString;
            SqlConnection connectionSQL = new SqlConnection(x);
            connectionInfo.Server = connectionSQL.DataSource;
            connectionInfo.Database = connectionSQL.Database;
            connectionInfo.User = connectionSQL.Credential.UserId;
            connectionInfo.Password = connectionSQL.Credential.Password.ToString();
        }

    }
}
