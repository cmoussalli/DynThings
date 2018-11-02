﻿namespace DynThings.WebAPIClientServicesTester
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.button1 = new System.Windows.Forms.Button();
            this.txtURL = new System.Windows.Forms.TextBox();
            this.txtAppID = new System.Windows.Forms.TextBox();
            this.gv1 = new System.Windows.Forms.DataGridView();
            this.txtUser = new System.Windows.Forms.TextBox();
            this.txtPassword = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.txtToken = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.btnGetTokenInfo = new System.Windows.Forms.Button();
            this.btnGetLocationViews = new System.Windows.Forms.Button();
            this.btnGetLocation = new System.Windows.Forms.Button();
            this.btnThings = new System.Windows.Forms.Button();
            this.btnSubmitEndPointInput = new System.Windows.Forms.Button();
            this.btnGetEndPointsWarnings = new System.Windows.Forms.Button();
            this.btnGetEndPoints = new System.Windows.Forms.Button();
            this.btnGetThingsWarnings = new System.Windows.Forms.Button();
            this.btnGetLocationsWarnings = new System.Windows.Forms.Button();
            this.btnGetViewsWarnings = new System.Windows.Forms.Button();
            this.btnSubmitEndPointLog = new System.Windows.Forms.Button();
            this.btnGetEndPointPendingCommands = new System.Windows.Forms.Button();
            this.btnSetEndpointCommandAsExecuted = new System.Windows.Forms.Button();
            this.btnGetIOsWarnings = new System.Windows.Forms.Button();
            this.btnGenerateNewToken = new System.Windows.Forms.Button();
            this.btnGetDevices = new System.Windows.Forms.Button();
            this.btnGetEnpointsCommands = new System.Windows.Forms.Button();
            this.btnGetDeviceCommands = new System.Windows.Forms.Button();
            this.btnGetThingEnds = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.gv1)).BeginInit();
            this.SuspendLayout();
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(1257, 103);
            this.button1.Margin = new System.Windows.Forms.Padding(4);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(205, 28);
            this.button1.TabIndex = 0;
            this.button1.Text = "Validate Token";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_ClickAsync);
            // 
            // txtURL
            // 
            this.txtURL.Location = new System.Drawing.Point(128, 15);
            this.txtURL.Margin = new System.Windows.Forms.Padding(4);
            this.txtURL.Name = "txtURL";
            this.txtURL.Size = new System.Drawing.Size(567, 22);
            this.txtURL.TabIndex = 1;
            this.txtURL.Text = "http://localhost/Dynthings.webportal/";
            // 
            // txtAppID
            // 
            this.txtAppID.Location = new System.Drawing.Point(128, 47);
            this.txtAppID.Margin = new System.Windows.Forms.Padding(4);
            this.txtAppID.Name = "txtAppID";
            this.txtAppID.Size = new System.Drawing.Size(567, 22);
            this.txtAppID.TabIndex = 2;
            this.txtAppID.Text = "8dbb7927-5564-45ff-928c-3627d5d163ef";
            this.txtAppID.TextChanged += new System.EventHandler(this.txtAppID_TextChanged);
            // 
            // gv1
            // 
            this.gv1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.gv1.Location = new System.Drawing.Point(16, 175);
            this.gv1.Margin = new System.Windows.Forms.Padding(4);
            this.gv1.Name = "gv1";
            this.gv1.Size = new System.Drawing.Size(1448, 511);
            this.gv1.TabIndex = 3;
            // 
            // txtUser
            // 
            this.txtUser.Location = new System.Drawing.Point(128, 79);
            this.txtUser.Margin = new System.Windows.Forms.Padding(4);
            this.txtUser.Name = "txtUser";
            this.txtUser.Size = new System.Drawing.Size(249, 22);
            this.txtUser.TabIndex = 4;
            this.txtUser.Text = "cmoussalli@gmail.com";
            // 
            // txtPassword
            // 
            this.txtPassword.Location = new System.Drawing.Point(128, 111);
            this.txtPassword.Margin = new System.Windows.Forms.Padding(4);
            this.txtPassword.Name = "txtPassword";
            this.txtPassword.Size = new System.Drawing.Size(249, 22);
            this.txtPassword.TabIndex = 5;
            this.txtPassword.Text = "Medi@22222";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(20, 18);
            this.label1.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(36, 17);
            this.label1.TabIndex = 6;
            this.label1.Text = "URL";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(20, 50);
            this.label2.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(69, 17);
            this.label2.TabIndex = 7;
            this.label2.Text = "APP Guid";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(20, 85);
            this.label3.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(38, 17);
            this.label3.TabIndex = 7;
            this.label3.Text = "User";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(20, 114);
            this.label4.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(69, 17);
            this.label4.TabIndex = 7;
            this.label4.Text = "Password";
            // 
            // txtToken
            // 
            this.txtToken.Location = new System.Drawing.Point(128, 143);
            this.txtToken.Margin = new System.Windows.Forms.Padding(4);
            this.txtToken.Name = "txtToken";
            this.txtToken.Size = new System.Drawing.Size(567, 22);
            this.txtToken.TabIndex = 8;
            this.txtToken.Text = "0271f1da-7414-40f0-bedc-d2ab71da4d59";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(20, 146);
            this.label5.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(99, 17);
            this.label5.TabIndex = 9;
            this.label5.Text = "Current Token";
            // 
            // btnGetTokenInfo
            // 
            this.btnGetTokenInfo.Location = new System.Drawing.Point(1257, 138);
            this.btnGetTokenInfo.Margin = new System.Windows.Forms.Padding(4);
            this.btnGetTokenInfo.Name = "btnGetTokenInfo";
            this.btnGetTokenInfo.Size = new System.Drawing.Size(205, 28);
            this.btnGetTokenInfo.TabIndex = 11;
            this.btnGetTokenInfo.Text = "Get Token Info";
            this.btnGetTokenInfo.UseVisualStyleBackColor = true;
            this.btnGetTokenInfo.Click += new System.EventHandler(this.btnGetTokenInfo_ClickAsync);
            // 
            // btnGetLocationViews
            // 
            this.btnGetLocationViews.Location = new System.Drawing.Point(16, 718);
            this.btnGetLocationViews.Margin = new System.Windows.Forms.Padding(4);
            this.btnGetLocationViews.Name = "btnGetLocationViews";
            this.btnGetLocationViews.Size = new System.Drawing.Size(205, 28);
            this.btnGetLocationViews.TabIndex = 12;
            this.btnGetLocationViews.Text = "Get LocationViews";
            this.btnGetLocationViews.UseVisualStyleBackColor = true;
            this.btnGetLocationViews.Click += new System.EventHandler(this.btnGetLocationViews_Click);
            // 
            // btnGetLocation
            // 
            this.btnGetLocation.Location = new System.Drawing.Point(229, 718);
            this.btnGetLocation.Margin = new System.Windows.Forms.Padding(4);
            this.btnGetLocation.Name = "btnGetLocation";
            this.btnGetLocation.Size = new System.Drawing.Size(205, 28);
            this.btnGetLocation.TabIndex = 13;
            this.btnGetLocation.Text = "Get Locations";
            this.btnGetLocation.UseVisualStyleBackColor = true;
            this.btnGetLocation.Click += new System.EventHandler(this.btnGetLocation_Click);
            // 
            // btnThings
            // 
            this.btnThings.Location = new System.Drawing.Point(443, 718);
            this.btnThings.Margin = new System.Windows.Forms.Padding(4);
            this.btnThings.Name = "btnThings";
            this.btnThings.Size = new System.Drawing.Size(205, 28);
            this.btnThings.TabIndex = 14;
            this.btnThings.Text = "Get Things";
            this.btnThings.UseVisualStyleBackColor = true;
            this.btnThings.Click += new System.EventHandler(this.btnThings_Click);
            // 
            // btnSubmitEndPointInput
            // 
            this.btnSubmitEndPointInput.Location = new System.Drawing.Point(1227, 718);
            this.btnSubmitEndPointInput.Margin = new System.Windows.Forms.Padding(4);
            this.btnSubmitEndPointInput.Name = "btnSubmitEndPointInput";
            this.btnSubmitEndPointInput.Size = new System.Drawing.Size(235, 28);
            this.btnSubmitEndPointInput.TabIndex = 15;
            this.btnSubmitEndPointInput.Text = "Submit EndPoint Input";
            this.btnSubmitEndPointInput.UseVisualStyleBackColor = true;
            this.btnSubmitEndPointInput.Click += new System.EventHandler(this.btnSubmitEndPointInput_Click);
            // 
            // btnGetEndPointsWarnings
            // 
            this.btnGetEndPointsWarnings.Location = new System.Drawing.Point(656, 753);
            this.btnGetEndPointsWarnings.Margin = new System.Windows.Forms.Padding(4);
            this.btnGetEndPointsWarnings.Name = "btnGetEndPointsWarnings";
            this.btnGetEndPointsWarnings.Size = new System.Drawing.Size(205, 28);
            this.btnGetEndPointsWarnings.TabIndex = 16;
            this.btnGetEndPointsWarnings.Text = "Get EndPoints with Warnings";
            this.btnGetEndPointsWarnings.UseVisualStyleBackColor = true;
            this.btnGetEndPointsWarnings.Click += new System.EventHandler(this.btnGetEndPointsWarnings_Click);
            // 
            // btnGetEndPoints
            // 
            this.btnGetEndPoints.Location = new System.Drawing.Point(656, 718);
            this.btnGetEndPoints.Margin = new System.Windows.Forms.Padding(4);
            this.btnGetEndPoints.Name = "btnGetEndPoints";
            this.btnGetEndPoints.Size = new System.Drawing.Size(205, 28);
            this.btnGetEndPoints.TabIndex = 17;
            this.btnGetEndPoints.Text = "Get EndPoints";
            this.btnGetEndPoints.UseVisualStyleBackColor = true;
            this.btnGetEndPoints.Click += new System.EventHandler(this.btnGetEndPoints_Click);
            // 
            // btnGetThingsWarnings
            // 
            this.btnGetThingsWarnings.Location = new System.Drawing.Point(443, 753);
            this.btnGetThingsWarnings.Margin = new System.Windows.Forms.Padding(4);
            this.btnGetThingsWarnings.Name = "btnGetThingsWarnings";
            this.btnGetThingsWarnings.Size = new System.Drawing.Size(205, 28);
            this.btnGetThingsWarnings.TabIndex = 18;
            this.btnGetThingsWarnings.Text = "Get Things with Warnings";
            this.btnGetThingsWarnings.UseVisualStyleBackColor = true;
            this.btnGetThingsWarnings.Click += new System.EventHandler(this.btnGetThingsWarnings_Click);
            // 
            // btnGetLocationsWarnings
            // 
            this.btnGetLocationsWarnings.Location = new System.Drawing.Point(229, 753);
            this.btnGetLocationsWarnings.Margin = new System.Windows.Forms.Padding(4);
            this.btnGetLocationsWarnings.Name = "btnGetLocationsWarnings";
            this.btnGetLocationsWarnings.Size = new System.Drawing.Size(205, 28);
            this.btnGetLocationsWarnings.TabIndex = 19;
            this.btnGetLocationsWarnings.Text = "Get Locations Warnings";
            this.btnGetLocationsWarnings.UseVisualStyleBackColor = true;
            this.btnGetLocationsWarnings.Click += new System.EventHandler(this.btnGetLocationsWarnings_Click);
            // 
            // btnGetViewsWarnings
            // 
            this.btnGetViewsWarnings.Location = new System.Drawing.Point(16, 753);
            this.btnGetViewsWarnings.Margin = new System.Windows.Forms.Padding(4);
            this.btnGetViewsWarnings.Name = "btnGetViewsWarnings";
            this.btnGetViewsWarnings.Size = new System.Drawing.Size(205, 28);
            this.btnGetViewsWarnings.TabIndex = 20;
            this.btnGetViewsWarnings.Text = "Get Views Warnings";
            this.btnGetViewsWarnings.UseVisualStyleBackColor = true;
            this.btnGetViewsWarnings.Click += new System.EventHandler(this.btnGetViewsWarnings_Click);
            // 
            // btnSubmitEndPointLog
            // 
            this.btnSubmitEndPointLog.Location = new System.Drawing.Point(1229, 753);
            this.btnSubmitEndPointLog.Margin = new System.Windows.Forms.Padding(4);
            this.btnSubmitEndPointLog.Name = "btnSubmitEndPointLog";
            this.btnSubmitEndPointLog.Size = new System.Drawing.Size(233, 28);
            this.btnSubmitEndPointLog.TabIndex = 21;
            this.btnSubmitEndPointLog.Text = "Submit EndPoint Log";
            this.btnSubmitEndPointLog.UseVisualStyleBackColor = true;
            this.btnSubmitEndPointLog.Click += new System.EventHandler(this.btnSubmitEndPointLog_Click);
            // 
            // btnGetEndPointPendingCommands
            // 
            this.btnGetEndPointPendingCommands.Location = new System.Drawing.Point(1229, 789);
            this.btnGetEndPointPendingCommands.Margin = new System.Windows.Forms.Padding(4);
            this.btnGetEndPointPendingCommands.Name = "btnGetEndPointPendingCommands";
            this.btnGetEndPointPendingCommands.Size = new System.Drawing.Size(233, 28);
            this.btnGetEndPointPendingCommands.TabIndex = 22;
            this.btnGetEndPointPendingCommands.Text = "Get EndPoint Pending Commands";
            this.btnGetEndPointPendingCommands.UseVisualStyleBackColor = true;
            this.btnGetEndPointPendingCommands.Click += new System.EventHandler(this.btnGetEndPointPendingCommands_Click);
            // 
            // btnSetEndpointCommandAsExecuted
            // 
            this.btnSetEndpointCommandAsExecuted.Location = new System.Drawing.Point(1229, 825);
            this.btnSetEndpointCommandAsExecuted.Margin = new System.Windows.Forms.Padding(4);
            this.btnSetEndpointCommandAsExecuted.Name = "btnSetEndpointCommandAsExecuted";
            this.btnSetEndpointCommandAsExecuted.Size = new System.Drawing.Size(235, 28);
            this.btnSetEndpointCommandAsExecuted.TabIndex = 23;
            this.btnSetEndpointCommandAsExecuted.Text = "Set Command as Executed";
            this.btnSetEndpointCommandAsExecuted.UseVisualStyleBackColor = true;
            this.btnSetEndpointCommandAsExecuted.Click += new System.EventHandler(this.btnSetEndpointCommandAsExecuted_Click);
            // 
            // btnGetIOsWarnings
            // 
            this.btnGetIOsWarnings.Location = new System.Drawing.Point(16, 950);
            this.btnGetIOsWarnings.Margin = new System.Windows.Forms.Padding(4);
            this.btnGetIOsWarnings.Name = "btnGetIOsWarnings";
            this.btnGetIOsWarnings.Size = new System.Drawing.Size(1448, 28);
            this.btnGetIOsWarnings.TabIndex = 24;
            this.btnGetIOsWarnings.Text = "Get IO Warnings";
            this.btnGetIOsWarnings.UseVisualStyleBackColor = true;
            this.btnGetIOsWarnings.Click += new System.EventHandler(this.btnGetIOsWarnings_Click);
            // 
            // btnGenerateNewToken
            // 
            this.btnGenerateNewToken.Location = new System.Drawing.Point(1257, 12);
            this.btnGenerateNewToken.Margin = new System.Windows.Forms.Padding(4);
            this.btnGenerateNewToken.Name = "btnGenerateNewToken";
            this.btnGenerateNewToken.Size = new System.Drawing.Size(205, 28);
            this.btnGenerateNewToken.TabIndex = 25;
            this.btnGenerateNewToken.Text = "Generate New Token";
            this.btnGenerateNewToken.UseVisualStyleBackColor = true;
            this.btnGenerateNewToken.Click += new System.EventHandler(this.btnGenerateNewToken_Click);
            // 
            // btnGetDevices
            // 
            this.btnGetDevices.Location = new System.Drawing.Point(869, 718);
            this.btnGetDevices.Margin = new System.Windows.Forms.Padding(4);
            this.btnGetDevices.Name = "btnGetDevices";
            this.btnGetDevices.Size = new System.Drawing.Size(205, 28);
            this.btnGetDevices.TabIndex = 17;
            this.btnGetDevices.Text = "Get Devices";
            this.btnGetDevices.UseVisualStyleBackColor = true;
            this.btnGetDevices.Click += new System.EventHandler(this.btnGetDevices_ClickAsync);
            // 
            // btnGetEnpointsCommands
            // 
            this.btnGetEnpointsCommands.Location = new System.Drawing.Point(658, 789);
            this.btnGetEnpointsCommands.Name = "btnGetEnpointsCommands";
            this.btnGetEnpointsCommands.Size = new System.Drawing.Size(205, 28);
            this.btnGetEnpointsCommands.TabIndex = 26;
            this.btnGetEnpointsCommands.Text = "Get Enpoints Commands";
            this.btnGetEnpointsCommands.UseVisualStyleBackColor = true;
            this.btnGetEnpointsCommands.Click += new System.EventHandler(this.btnGetEnpointsCommands_ClickAsync);
            // 
            // btnGetDeviceCommands
            // 
            this.btnGetDeviceCommands.Location = new System.Drawing.Point(869, 789);
            this.btnGetDeviceCommands.Name = "btnGetDeviceCommands";
            this.btnGetDeviceCommands.Size = new System.Drawing.Size(205, 28);
            this.btnGetDeviceCommands.TabIndex = 27;
            this.btnGetDeviceCommands.Text = "Get Device Commands";
            this.btnGetDeviceCommands.UseVisualStyleBackColor = true;
            this.btnGetDeviceCommands.Click += new System.EventHandler(this.btnGetDeviceCommands_ClickAsync);
            // 
            // btnGetThingEnds
            // 
            this.btnGetThingEnds.Location = new System.Drawing.Point(443, 850);
            this.btnGetThingEnds.Name = "btnGetThingEnds";
            this.btnGetThingEnds.Size = new System.Drawing.Size(418, 28);
            this.btnGetThingEnds.TabIndex = 28;
            this.btnGetThingEnds.Text = "Get ThingEnds";
            this.btnGetThingEnds.UseVisualStyleBackColor = true;
            this.btnGetThingEnds.Click += new System.EventHandler(this.btnGetThingEnds_ClickAsync);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1475, 991);
            this.Controls.Add(this.btnGetThingEnds);
            this.Controls.Add(this.btnGetDeviceCommands);
            this.Controls.Add(this.btnGetEnpointsCommands);
            this.Controls.Add(this.btnGenerateNewToken);
            this.Controls.Add(this.btnGetIOsWarnings);
            this.Controls.Add(this.btnSetEndpointCommandAsExecuted);
            this.Controls.Add(this.btnGetEndPointPendingCommands);
            this.Controls.Add(this.btnSubmitEndPointLog);
            this.Controls.Add(this.btnGetViewsWarnings);
            this.Controls.Add(this.btnGetLocationsWarnings);
            this.Controls.Add(this.btnGetThingsWarnings);
            this.Controls.Add(this.btnGetDevices);
            this.Controls.Add(this.btnGetEndPoints);
            this.Controls.Add(this.btnGetEndPointsWarnings);
            this.Controls.Add(this.btnSubmitEndPointInput);
            this.Controls.Add(this.btnThings);
            this.Controls.Add(this.btnGetLocation);
            this.Controls.Add(this.btnGetLocationViews);
            this.Controls.Add(this.btnGetTokenInfo);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.txtToken);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.txtPassword);
            this.Controls.Add(this.txtUser);
            this.Controls.Add(this.gv1);
            this.Controls.Add(this.txtAppID);
            this.Controls.Add(this.txtURL);
            this.Controls.Add(this.button1);
            this.Margin = new System.Windows.Forms.Padding(4);
            this.Name = "Form1";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.gv1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.TextBox txtURL;
        private System.Windows.Forms.TextBox txtAppID;
        private System.Windows.Forms.DataGridView gv1;
        private System.Windows.Forms.TextBox txtUser;
        private System.Windows.Forms.TextBox txtPassword;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox txtToken;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Button btnGetTokenInfo;
        private System.Windows.Forms.Button btnGetLocationViews;
        private System.Windows.Forms.Button btnGetLocation;
        private System.Windows.Forms.Button btnThings;
        private System.Windows.Forms.Button btnSubmitEndPointInput;
        private System.Windows.Forms.Button btnGetEndPointsWarnings;
        private System.Windows.Forms.Button btnGetEndPoints;
        private System.Windows.Forms.Button btnGetThingsWarnings;
        private System.Windows.Forms.Button btnGetLocationsWarnings;
        private System.Windows.Forms.Button btnGetViewsWarnings;
        private System.Windows.Forms.Button btnSubmitEndPointLog;
        private System.Windows.Forms.Button btnGetEndPointPendingCommands;
        private System.Windows.Forms.Button btnSetEndpointCommandAsExecuted;
        private System.Windows.Forms.Button btnGetIOsWarnings;
        private System.Windows.Forms.Button btnGenerateNewToken;
        private System.Windows.Forms.Button btnGetDevices;
        private System.Windows.Forms.Button btnGetEnpointsCommands;
        private System.Windows.Forms.Button btnGetDeviceCommands;
        private System.Windows.Forms.Button btnGetThingEnds;
    }
}

