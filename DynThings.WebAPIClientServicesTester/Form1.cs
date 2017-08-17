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
using DynThings.WebAPI.ClientServices;



namespace DynThings.WebAPIClientServicesTester
{
    public partial class Form1 : Form
    {
        UnitOfWork uow;
        HostConfig conf = new HostConfig();
        Guid appGUID;
        Guid token;


        public Form1()
        {
            InitializeComponent();
            Initialize();
        }

        private void Initialize()
        {
            appGUID = Guid.Parse(txtAppID.Text);
            conf.Token = txtToken.Text;
            conf.URL = txtURL.Text;
            conf.UserName = txtUser.Text;
            conf.Password = txtPassword.Text;
            conf.AppGUID = txtAppID.Text;
            uow = new UnitOfWork(conf);
            
        }



        private async void button1_ClickAsync(object sender, EventArgs e)
        {
            Initialize();
            ApiResponse resp = await uow.TokenService.Validate();
            MessageBox.Show(resp.StatusTitle);

            

        }

        private async void btnGetTokenInfo_ClickAsync(object sender, EventArgs e)
        {
            Initialize();
            
            APIAppUserToken token = await uow.TokenService.GetTokenInfo();
            MessageBox.Show("Expire Date: " + token.ExpireDate.ToShortDateString());
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private async  void btnGetLocationViews_Click(object sender, EventArgs e)
        {
            Initialize();

            List<APILocationView> views = await uow.LocationViewsService.GetListAsync(1, 10, "", true, true);
            gv1.DataSource = views;
        }

        private async void btnGetLocation_Click(object sender, EventArgs e)
        {
            Initialize();

            List<APILocation> views = await uow.LocationsService.GetListAsync(1,25,true,true,"",0);
            gv1.DataSource = views;
        }

        private void btnThings_Click(object sender, EventArgs e)
        {
            Initialize();

            List<APIThing> things = await uow.;
            gv1.DataSource = views;
        }
    }
}
