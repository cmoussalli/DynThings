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
using DynThings.WebAPI.Models.RequestModels;
using DynThings.WebAPI.Models.ResponseModels;


namespace DynThings.WebAPIClientServicesTester
{
    public partial class Form1 : Form
    {
        UnitOfWork uow;
        HostConfig conf = new HostConfig();
        Guid appGUID;


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
           // Initialize();
            APIAppUserTokenResponseModels.ValidateToken resp = await uow.TokenService.ValidateToken();
            MessageBox.Show(resp.Response.StatusTitle);
        }

        private async void btnGetTokenInfo_ClickAsync(object sender, EventArgs e)
        {
           // Initialize();
            APIAppUserTokenResponseModels.GetTokenInfo resp = await uow.TokenService.GetTokenInfo();
            MessageBox.Show("Expire Date: " + resp.AppUserToken.ExpireDate.ToShortDateString());
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private async void btnGetLocationViews_Click(object sender, EventArgs e)
        {
            Initialize();

            APILocationViewRequestModels.GetLocationViewsList model = new APILocationViewRequestModels.GetLocationViewsList();
            model.LoadLocations = true;
            model.PageNumber = 1; model.PageSize = 1; model.Token = Guid.Parse(txtToken.Text);

            APILocationViewResponseModels.GetLocationViewsList views = await uow.LocationViewsService.GetListAsync(model);
            gv1.DataSource = views.Views;
        }

        private async void btnGetLocation_Click(object sender, EventArgs e)
        {
            Initialize();

            APILocationRequestModels.GetLocationsList model = new APILocationRequestModels.GetLocationsList();
            model.LoadThings = true;
            model.LoadViews = true;
            
            model.PageNumber = 1; model.PageSize = 1; model.Token = Guid.Parse(txtToken.Text);

            APILocationResponseModels.GetLocationsList locations = await uow.LocationsService.GetListAsync(model);
            gv1.DataSource = locations.Locations;
        }

        private async void btnThings_Click(object sender, EventArgs e)
        {
            Initialize();

            APIThingRequestModels.GetThingsList model = new APIThingRequestModels.GetThingsList();
            model.LoadEndPoints = true;
            model.LoadLocation = true;
            model.LoadThingEnds = true;
            model.LoadThingExtensionValues = true;

            model.PageNumber = 1; model.PageSize = 1; model.Token = Guid.Parse(txtToken.Text);

            APIThingResponseModels.GetThingsList things = await uow.ThingsService.GetThingsListAsync(model);
            gv1.DataSource = things.Things;

        }

        private async void btnSubmitEndPointInput_Click(object sender, EventArgs e)
        {
            ApiResponse result = await uow.IOService.SubmitEndPointInput(Guid.Parse("D5E4B5E6-C4E1-4E7B-A3E5-49FE3C251882"), "1");
            MessageBox.Show(result.Message);
        }

        private async void btnGetEndPointsWarnings_Click(object sender, EventArgs e)
        {
            Initialize();
            APIEndpointResponseModels.GetEndpointsList ends = await uow.EndPointsService.GetEndpointsWithWarningsList(new APIEndpointRequestModels.GetEndpointsList { Token = Guid.Parse( conf.Token) });
            gv1.DataSource = ends.Endpoints;
        }

        private async void btnGetEndPoints_Click(object sender, EventArgs e)
        {
            Initialize();

            APIEndpointRequestModels.GetEndpointsList model = new APIEndpointRequestModels.GetEndpointsList();
            model.DeviceID = 0;model.PageNumber = 1;model.PageSize = 1;model.Token = Guid.Parse (txtToken.Text) ;

            APIEndpointResponseModels.GetEndpointsList ends = await uow.EndPointsService.GetEndpointsListAsync(model);
            gv1.DataSource = ends.Endpoints;
        }

        private async void btnGetThingsWarnings_Click(object sender, EventArgs e)
        {
            Initialize();

            APIThingRequestModels.GetThingsList model = new APIThingRequestModels.GetThingsList();
            model.LoadEndPoints = true;
            model.LoadLocation = true;
            model.LoadThingEnds = true;
            model.LoadThingExtensionValues = true;

            model.PageNumber = 1; model.PageSize = 1; model.Token = Guid.Parse(txtToken.Text);

            APIThingResponseModels.GetThingsList things = await uow.ThingsService.GetThingsWithWarningsListAsync(model);
            gv1.DataSource = things.Things;
        }

        private async void btnGetLocationsWarnings_Click(object sender, EventArgs e)
        {
            Initialize();

            APILocationRequestModels.GetLocationsList model = new APILocationRequestModels.GetLocationsList();
            model.LoadThings = true;
            model.LoadViews = true;

            model.PageNumber = 1; model.PageSize = 1; model.Token = Guid.Parse(txtToken.Text);

            APILocationResponseModels.GetLocationsList locations = await uow.LocationsService.GetLocationsWithWarningsListAsync(model);
            gv1.DataSource = locations.Locations;
        }

        private async void btnGetViewsWarnings_Click(object sender, EventArgs e)
        {
            Initialize();

            APILocationViewRequestModels.GetLocationViewsList model = new APILocationViewRequestModels.GetLocationViewsList();
            model.LoadLocations = true;
            model.PageNumber = 1; model.PageSize = 1; model.Token = Guid.Parse(txtToken.Text);

            APILocationViewResponseModels.GetLocationViewsList views = await uow.LocationViewsService.GetLocationViewsWithWarningsListAsync(model);
            gv1.DataSource = views.Views;
        }

        private async void btnSubmitEndPointLog_Click(object sender, EventArgs e)
        {
            ApiResponse result = await uow.IOService.SubmitEndPointLog(Guid.Parse("D5E4B5E6-C4E1-4E7B-A3E5-49FE3C251882"), "1");
            MessageBox.Show(result.Message);
        }

        private async void btnGetEndPointPendingCommands_Click(object sender, EventArgs e)
        {
            Initialize();
            List<APIEndPointIO> cmds = await uow.IOService.GetEndPointPendingCommands(Guid.Parse("D5E4B5E6-C4E1-4E7B-A3E5-49FE3C251882"));
            gv1.DataSource = cmds;
        }

        private async void btnSetEndpointCommandAsExecuted_Click(object sender, EventArgs e)
        {
            long commandID = 0;
            commandID = long.Parse(gv1.SelectedRows[0].Cells[0].Value.ToString());
            Initialize();
            ApiResponse res = await uow.IOService.SetEndPointCommandAsExecuted(commandID, Guid.Parse("D5E4B5E6-C4E1-4E7B-A3E5-49FE3C251882"));
        }

        private async void btnGetIOsWarnings_Click(object sender, EventArgs e)
        {
            Initialize();
            List<APIEndPointIOWarning> wars = await uow.WarningsService.GetListAsync(1, 100, true, true, "", 0);
            gv1.DataSource = wars;
        }

        private async void btnGenerateNewToken_Click(object sender, EventArgs e)
        {
            appGUID = Guid.Parse(txtAppID.Text);

            conf.URL = txtURL.Text;
            conf.UserName = txtUser.Text;
            conf.Password = txtPassword.Text;
            conf.AppGUID = txtAppID.Text;
            uow = new UnitOfWork(conf);
            try
            {
                APIAppUserTokenResponseModels.GetNewToken resp = await uow.TokenService.GetNewToken();

                conf.URL = txtURL.Text;
                conf.UserName = txtUser.Text;
                conf.Password = txtPassword.Text;
                conf.AppGUID = txtAppID.Text;
                conf.Token = resp.AppUserToken.Token.ToString();
                uow = new UnitOfWork(conf);

                txtToken.Text = resp.AppUserToken.Token.ToString();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }


        }

        private void txtAppID_TextChanged(object sender, EventArgs e)
        {

        }

        private async void btnGetDevices_ClickAsync(object sender, EventArgs e)
        {
            Initialize();

            APIDeviceRequestModels.GetDevicesList model = new APIDeviceRequestModels.GetDevicesList();
            model.LoadDeviceCommands = true;
            model.LoadEndpoints = true;

            model.PageNumber = 1; model.PageSize = 1; model.Token = Guid.Parse(txtToken.Text);

            APIDeviceResponseModels.GetDevicesList devs = await uow.DevicesService.GetDevicesListAsync(model);
            gv1.DataSource = devs.Devices;
        }

        private async void btnGetEnpointsCommands_ClickAsync(object sender, EventArgs e)
        {
            Initialize();

            APIEndpointCommandRequestModels.GetEndpointCommandsList model = new APIEndpointCommandRequestModels.GetEndpointCommandsList();
            model.LoadEndpoint = true;

            model.PageNumber = 1; model.PageSize = 1; model.Token = Guid.Parse(txtToken.Text);

            APIEndpointCommandResponseModels.GetEndpointCommandsList cmds = await uow.EndPointCommandsService.GetEndPointsListAsync(model);
            gv1.DataSource = cmds.EndpointCommands;
        }

        private async void btnGetDeviceCommands_ClickAsync(object sender, EventArgs e)
        {
            Initialize();

            APIDeviceCommandRequestModels.GetDeviceCommandsList model = new APIDeviceCommandRequestModels.GetDeviceCommandsList();
            model.LoadDevice = true;

            model.PageNumber = 1; model.PageSize = 1; model.Token = Guid.Parse(txtToken.Text);

            APIDeviceCommandResponseModels.GetDeviceCommandsList cmds = await uow.DeviceCommandsService.GetDevicesListAsync(model);
            gv1.DataSource = cmds.DeviceCommands;
        }

        private async void btnGetThingEnds_ClickAsync(object sender, EventArgs e)
        {
            Initialize();

            APIThingEndRequestModels.GetThingEndsList model = new APIThingEndRequestModels.GetThingEndsList();
            model.LoadEndpoint = true;
            model.LoadThing = true;

            model.PageNumber = 1; model.PageSize = 1; model.Token = Guid.Parse(txtToken.Text);

            APIThingEndResponseModels.GetThingEndsList thingEnds = await uow.ThingEndsService.GetThingEndsListAsync(model);
            gv1.DataSource = thingEnds.ThingEnds;
        }
    }
}
