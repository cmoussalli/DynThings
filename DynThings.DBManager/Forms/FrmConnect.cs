using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using DataConnector;

namespace DynThings.DBManager
{
    public partial class FrmConnect : Form
    {
        public FrmConnect()
        {
            InitializeComponent();
        }

        private void FrmConnect_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (e.CloseReason == CloseReason.UserClosing)
            {
                e.Cancel = true;
                Environment.Exit(0);
            }
        }

        private void btnConnect_Click(object sender, EventArgs e)
        {
            sc.SQLServer = txtServer.Text;
            sc.SQLUser = txtUser.Text;
            sc.SQLPassword = txtPassword.Text;
            sc.SQLDatabase = txtDataBase.Text;
            FormLock();
            try
            {
                sc.frmMain.lblStripStatus.Text = "Connecting...";
                if (sc.TestConnection())
                {
                    sc.frmMain.lblStripStatus.Text = "Connected";
                    sc.LoadDatabaseInfo();
                    sc.LoadServerInfo();
                    sc.frmMain.Show();
                    sc.frmMain.LoadUI();
                    this.Dispose();
                }
                else
                {
                    MessageBox.Show("Connection Failed", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    FormUnlock();
                }
            }
            catch (Exception ex)
            {
                if (ex.Message == "Error: Empty Database")
                {
                    DialogResult dialogResult = MessageBox.Show("Database is Empty, do you want to deploy the latest DynThings database on '" + txtDataBase.Text + "' datbase?", "Error", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                    if (dialogResult == DialogResult.Yes)
                    {
                        DeployNewDynThingsDB(txtServer.Text, txtUser.Text, txtPassword.Text, txtDataBase.Text);

                    }
                    else
                    {

                    }

                    return;
                }
                MessageBox.Show("Error: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);

                FormUnlock();
            }
        }

        public void DeployNewDynThingsDB(string server, string user, string password, string database)
        {
            sc.SQLServer = server;
            sc.SQLDatabase = database;
            sc.SQLUser = user;
            sc.SQLPassword = password;

            sc.Jobs.Clear();

            sc.Jobs.Add(new Job { title = "Create new database", jobType = JobType.CreateDatabase });

            FrmSQLExec sqlExec = new FrmSQLExec();
            sqlExec.ShowDialog();

        }

        public void FormLock()
        {
            txtServer.Enabled = false;
            txtUser.Enabled = false;
            txtPassword.Enabled = false;
            txtDataBase.Enabled = false;
            txtServer.Enabled = false;
        }

        public void FormUnlock()
        {
            txtServer.Enabled = true;
            txtUser.Enabled = true;
            txtPassword.Enabled = true;
            txtDataBase.Enabled = true;
            txtServer.Enabled = true;
        }

        private void FrmConnect_Load(object sender, EventArgs e)
        {

        }


    }
}
