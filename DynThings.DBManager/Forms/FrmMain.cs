using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DynThings.DBManager
{
    public partial class FrmMain : Form
    {
        public FrmMain()
        {
            InitializeComponent();
        }


        private void FrmMain_FormClosing(object sender, FormClosingEventArgs e)
        {
            e.Cancel = true;
            Application.Exit();
        }

        public void LoadUI()
        {
            LoadUI_DatabaseInfo();
            LoadUI_ServerInfo();
        }

       public void LoadUI_DatabaseInfo()
        {
            txtDatabaseVersion.Text = sc.databaseInfo.DBVersion;
        }

        public void LoadUI_ServerInfo()
        {
            txtServerMachineName.Text = sc.serverInfo.MachineName;
            txtServerName.Text = sc.serverInfo.ServerName;
            txtServerEdition.Text = sc.serverInfo.Edition;
            txtServerEngineEdition.Text = sc.serverInfo.EngineEdition;
            txtServerProductLevel.Text = sc.serverInfo.ProductLevel;
            txtServerHadrManagerStatus.Text = sc.serverInfo.HadrManagerStatus;
            txtServerIsHadrEnabled.Text = sc.serverInfo.IsHadrEnabled.ToString();
            txtServerIsClustered.Text = sc.serverInfo.IsClustered.ToString();
            
        }

        private void mnuBtnConnect_Click(object sender, EventArgs e)
        {
            FrmConnect frmConnect = new FrmConnect();
            frmConnect.ShowDialog();
        }
    }
}
