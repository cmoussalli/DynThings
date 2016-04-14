using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using DynThings.WebAPI.Models;

namespace DynThings.Simulator
{
    public partial class FrmMain : Form
    {
        public FrmMain()
        {
            InitializeComponent();
        }

        private void toolStripButton1_Click(object sender, EventArgs e)
        {
            APIs a = new APIs();
            a.GetDevicesList();
        }


    

        private void FrmMain_FormClosing(object sender, FormClosingEventArgs e)
        {
            Application.Exit();
        }

        private void treeView1_NodeMouseDoubleClick(object sender, TreeNodeMouseClickEventArgs e)
        {
            FrmDevice frmDevice = new FrmDevice();
            long selectedID = long.Parse(e.Node.Name.Substring(3));
            if (e.Node.Name.Substring(0,3) == "Dev")
            {
                frmDevice.SelectedFormType = FrmDevice.Device_EndPoint.Device;
                frmDevice.SelectedApiDevice = C.apiDevices.First(x => x.ID == selectedID);
            }
            else
            {
                frmDevice.SelectedFormType = FrmDevice.Device_EndPoint.EndPoint;
                frmDevice.SelectedAPIEndPoint = C.apiEndPoints.First(x => x.ID == selectedID);
            }
            frmDevice.lblSelectedFormType.Text = frmDevice.SelectedFormType.ToString();

            frmDevice.ShowDeviceInfo();
            frmDevice.Show();
        }

        private void treeView1_AfterSelect(object sender, TreeViewEventArgs e)
        {

        }

        private void FrmMain_Load(object sender, EventArgs e)
        {

        }
    }
}
