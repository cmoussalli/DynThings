namespace DynThings.WebAPIClientServicesTester
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
            ((System.ComponentModel.ISupportInitialize)(this.gv1)).BeginInit();
            this.SuspendLayout();
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(779, 10);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(154, 23);
            this.button1.TabIndex = 0;
            this.button1.Text = "Validate Token";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_ClickAsync);
            // 
            // txtURL
            // 
            this.txtURL.Location = new System.Drawing.Point(96, 12);
            this.txtURL.Name = "txtURL";
            this.txtURL.Size = new System.Drawing.Size(426, 20);
            this.txtURL.TabIndex = 1;
            this.txtURL.Text = "http://localhost/Dynthings.webportal";
            // 
            // txtAppID
            // 
            this.txtAppID.Location = new System.Drawing.Point(96, 38);
            this.txtAppID.Name = "txtAppID";
            this.txtAppID.Size = new System.Drawing.Size(426, 20);
            this.txtAppID.TabIndex = 2;
            this.txtAppID.Text = "dab4958b-d1ef-4357-81f5-d3d8ab64713d";
            // 
            // gv1
            // 
            this.gv1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.gv1.Location = new System.Drawing.Point(12, 142);
            this.gv1.Name = "gv1";
            this.gv1.Size = new System.Drawing.Size(529, 367);
            this.gv1.TabIndex = 3;
            // 
            // txtUser
            // 
            this.txtUser.Location = new System.Drawing.Point(96, 64);
            this.txtUser.Name = "txtUser";
            this.txtUser.Size = new System.Drawing.Size(188, 20);
            this.txtUser.TabIndex = 4;
            // 
            // txtPassword
            // 
            this.txtPassword.Location = new System.Drawing.Point(96, 90);
            this.txtPassword.Name = "txtPassword";
            this.txtPassword.Size = new System.Drawing.Size(188, 20);
            this.txtPassword.TabIndex = 5;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(15, 15);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(26, 13);
            this.label1.TabIndex = 6;
            this.label1.Text = "URL";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(15, 41);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(50, 13);
            this.label2.TabIndex = 7;
            this.label2.Text = "APP Guid";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(15, 69);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(29, 13);
            this.label3.TabIndex = 7;
            this.label3.Text = "User";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(15, 93);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(53, 13);
            this.label4.TabIndex = 7;
            this.label4.Text = "Password";
            // 
            // txtToken
            // 
            this.txtToken.Location = new System.Drawing.Point(96, 116);
            this.txtToken.Name = "txtToken";
            this.txtToken.Size = new System.Drawing.Size(426, 20);
            this.txtToken.TabIndex = 8;
            this.txtToken.Text = "d6a8c51f-33f8-46c8-b5b6-4de5c7eb7e1b";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(15, 119);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(76, 13);
            this.label5.TabIndex = 9;
            this.label5.Text = "Current Token";
            // 
            // btnGetTokenInfo
            // 
            this.btnGetTokenInfo.Location = new System.Drawing.Point(779, 38);
            this.btnGetTokenInfo.Name = "btnGetTokenInfo";
            this.btnGetTokenInfo.Size = new System.Drawing.Size(154, 23);
            this.btnGetTokenInfo.TabIndex = 11;
            this.btnGetTokenInfo.Text = "Get Token Info";
            this.btnGetTokenInfo.UseVisualStyleBackColor = true;
            this.btnGetTokenInfo.Click += new System.EventHandler(this.btnGetTokenInfo_ClickAsync);
            // 
            // btnGetLocationViews
            // 
            this.btnGetLocationViews.Location = new System.Drawing.Point(779, 67);
            this.btnGetLocationViews.Name = "btnGetLocationViews";
            this.btnGetLocationViews.Size = new System.Drawing.Size(154, 23);
            this.btnGetLocationViews.TabIndex = 12;
            this.btnGetLocationViews.Text = "Get LocationViews";
            this.btnGetLocationViews.UseVisualStyleBackColor = true;
            this.btnGetLocationViews.Click += new System.EventHandler(this.btnGetLocationViews_Click);
            // 
            // btnGetLocation
            // 
            this.btnGetLocation.Location = new System.Drawing.Point(779, 96);
            this.btnGetLocation.Name = "btnGetLocation";
            this.btnGetLocation.Size = new System.Drawing.Size(154, 23);
            this.btnGetLocation.TabIndex = 13;
            this.btnGetLocation.Text = "Get Locations";
            this.btnGetLocation.UseVisualStyleBackColor = true;
            this.btnGetLocation.Click += new System.EventHandler(this.btnGetLocation_Click);
            // 
            // btnThings
            // 
            this.btnThings.Location = new System.Drawing.Point(779, 125);
            this.btnThings.Name = "btnThings";
            this.btnThings.Size = new System.Drawing.Size(154, 23);
            this.btnThings.TabIndex = 14;
            this.btnThings.Text = "Get Things";
            this.btnThings.UseVisualStyleBackColor = true;
            this.btnThings.Click += new System.EventHandler(this.btnThings_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(945, 521);
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
            this.Name = "Form1";
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
    }
}

