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
using System.Net.Http;
using System.Net.Http.Headers;

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
        public List<APIEndPointIO> SelectedApiEndPointPendingCommands = new List<APIEndPointIO>();


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

        private void btnSendLog_Click(object sender, EventArgs e)
        {
            if (SelectedFormType == Device_EndPoint.Device)
            {
                lntInputs.Items.Add("Send Log : *" + txtInput.Text + "*");
                APIs.SubmitDeviceLog(SelectedApiDevice.KeyPass, txtLog.Text, DateTime.Now);
                lntInputs.TopItem = lntInputs.Items[lntInputs.Items.Count - 1];

            }

            if (SelectedFormType == Device_EndPoint.EndPoint)
            {
                lntInputs.Items.Add("Send Log : *" + txtInput.Text + "*");
                APIs.SubmitEndPointLog(SelectedAPIEndPoint.KeyPass, txtLog.Text, DateTime.Now);
                lntInputs.TopItem = lntInputs.Items[lntInputs.Items.Count - 1];

            }
        }

        private void button1_Click_1(object sender, EventArgs e)
        {
             GetDevicePendingCommands(SelectedApiDevice.KeyPass);
            
        }

        private void button1_Click(object sender, EventArgs e)
        {
            MessageBox.Show(C.response.Status);
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            GetPendingCommands();
        }

        public void GetPendingCommands()
        {
            if (SelectedFormType == Device_EndPoint.Device)
            {
                GetDevicePendingCommands(SelectedApiDevice.KeyPass);
            }
            else // EndPoint
            {
                GetEndPointPendingCommands(SelectedAPIEndPoint.KeyPass);
            }
           
        }





        public async Task<List<APIDeviceIO>> GetDevicePendingCommands(Guid deviceKeyPass)
        {
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri(C.WebAppURL);
                client.DefaultRequestHeaders.Accept.Clear();
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                HttpResponseMessage response = await client.GetAsync("api/thingsIO/GetDevicePendingCommands?devicekeypass=" + deviceKeyPass.ToString());
                if (response.IsSuccessStatusCode)
                {
                }
                IEnumerable<APIDeviceIO> cmds = response.Content.ReadAsAsync<IEnumerable<APIDeviceIO>>().Result;
                SelectedApiDevicePendingCommands = cmds.ToList();
                dataGridView1.DataSource = SelectedApiDevicePendingCommands;
                return cmds.ToList();
            }
        }

        public  async Task<List<APIEndPointIO>> GetEndPointPendingCommands(Guid endPointKeyPass)
        {
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri(C.WebAppURL);
                client.DefaultRequestHeaders.Accept.Clear();
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                HttpResponseMessage response = await client.GetAsync("api/thingsIO/GetEndPointPendingCommands?endPointKeyPass=" + endPointKeyPass.ToString());
                if (response.IsSuccessStatusCode)
                {
                }
                IEnumerable<APIEndPointIO> cmds = response.Content.ReadAsAsync<IEnumerable<APIEndPointIO>>().Result;
                SelectedApiEndPointPendingCommands = cmds.ToList();
                dataGridView1.DataSource = SelectedApiEndPointPendingCommands;
                return cmds.ToList();
            }
        }
    }
}
