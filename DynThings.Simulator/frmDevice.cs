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
    public partial class FrmDevice : Form
    {
        public enum Device_EndPoint
        {
            Device,
            EndPoint
        }
        public Device_EndPoint SelectedFormType;
        public long SelectedID;
        public APIDevice SelectedApiDevice= new APIDevice();
        public APIEndPoint SelectedAPIEndPoint = new APIEndPoint();

        public List<APIDeviceIO> SelectedApiDevicePendingCommands = new List<APIDeviceIO>();



        public FrmDevice()
        {
            InitializeComponent();
        }

        private void FrmDevice_Load(object sender, EventArgs e)
        {

        }

        private void FrmDevice_FormClosing(object sender, FormClosingEventArgs e)
        {
            this.Dispose();
        }

        public void ShowDeviceInfo()
        {
            if (SelectedFormType == Device_EndPoint.EndPoint)
            {
                this.Text = SelectedFormType.ToString() + ": " + SelectedAPIEndPoint.Title;
                this.lblTitle.Text = SelectedAPIEndPoint.Title;
                
            }
            else
            {
                this.Text = SelectedFormType.ToString() + ": " + SelectedApiDevice.Title;
                this.lblTitle.Text = SelectedApiDevice.Title;
                
            }
            

        }

        private void btnSendInput_Click(object sender, EventArgs e)
        {
            if (SelectedFormType == Device_EndPoint.Device)
            {
                lntInputs.Items.Add("Send Input : *" + txtInput.Text + "*");
                APIs.SubmitDeviceInput(SelectedApiDevice.KeyPass, txtInput.Text, DateTime.Now);
                lntInputs.TopItem = lntInputs.Items[lntInputs.Items.Count - 1];

            }

            if (SelectedFormType == Device_EndPoint.EndPoint)
            {
                lntInputs.Items.Add("Send Input : *" + txtInput.Text + "*");
                APIs.SubmitEndPointInput(SelectedAPIEndPoint.KeyPass, txtInput.Text, DateTime.Now);
                lntInputs.TopItem = lntInputs.Items[lntInputs.Items.Count - 1];

            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            MessageBox.Show(C.response.Status);
        }

        private void btnSendLog_Click(object sender, EventArgs e)
        {
            if (SelectedFormType == Device_EndPoint.Device)
            {
                lntInputs.Items.Add("Send Log : *" + txtInput.Text + "*");
                APIs.SubmitDeviceLog(SelectedApiDevice.KeyPass, txtInput.Text, DateTime.Now);
                lntInputs.TopItem = lntInputs.Items[lntInputs.Items.Count - 1];

            }

            if (SelectedFormType == Device_EndPoint.EndPoint)
            {
                lntInputs.Items.Add("Send Log : *" + txtInput.Text + "*");
                APIs.SubmitEndPointLog(SelectedAPIEndPoint.KeyPass, txtInput.Text, DateTime.Now);
                lntInputs.TopItem = lntInputs.Items[lntInputs.Items.Count - 1];

            }
        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            APIs.GetDevicePendingCommands(SelectedApiDevice.KeyPass);
            MessageBox.Show(SelectedApiDevicePendingCommands.Count.ToString());
        }

       
    }
}
