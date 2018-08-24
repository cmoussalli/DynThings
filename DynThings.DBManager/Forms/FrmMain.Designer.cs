namespace DynThings.DBManager
{
    partial class FrmMain
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
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.statusStrip1 = new System.Windows.Forms.StatusStrip();
            this.toolStripStatusLabel1 = new System.Windows.Forms.ToolStripStatusLabel();
            this.lblStripStatus = new System.Windows.Forms.ToolStripStatusLabel();
            this.txtDatabaseVersion = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.menuStrip2 = new System.Windows.Forms.MenuStrip();
            this.fileToolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuBtnConnect = new System.Windows.Forms.ToolStripMenuItem();
            this.txtServerIsClustered = new System.Windows.Forms.TextBox();
            this.txtServerHadrManagerStatus = new System.Windows.Forms.TextBox();
            this.txtServerIsHadrEnabled = new System.Windows.Forms.TextBox();
            this.txtServerMachineName = new System.Windows.Forms.TextBox();
            this.txtServerProductLevel = new System.Windows.Forms.TextBox();
            this.txtServerEngineEdition = new System.Windows.Forms.TextBox();
            this.txtServerEdition = new System.Windows.Forms.TextBox();
            this.txtServerName = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.label9 = new System.Windows.Forms.Label();
            this.label10 = new System.Windows.Forms.Label();
            this.label11 = new System.Windows.Forms.Label();
            this.label12 = new System.Windows.Forms.Label();
            this.panel1 = new System.Windows.Forms.Panel();
            this.lblDBUtilized = new System.Windows.Forms.Label();
            this.progDBUtilized = new System.Windows.Forms.ProgressBar();
            this.lblLast24hCpH = new System.Windows.Forms.Label();
            this.lblMaxCPHToday = new System.Windows.Forms.Label();
            this.label16 = new System.Windows.Forms.Label();
            this.label15 = new System.Windows.Forms.Label();
            this.panel2 = new System.Windows.Forms.Panel();
            this.label14 = new System.Windows.Forms.Label();
            this.label13 = new System.Windows.Forms.Label();
            this.btnShrink = new System.Windows.Forms.Button();
            this.pictureBox3 = new System.Windows.Forms.PictureBox();
            this.pictureBox2 = new System.Windows.Forms.PictureBox();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.btnBackup = new System.Windows.Forms.Button();
            this.statusStrip1.SuspendLayout();
            this.menuStrip2.SuspendLayout();
            this.panel1.SuspendLayout();
            this.panel2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox3)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox2)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.SuspendLayout();
            // 
            // menuStrip1
            // 
            this.menuStrip1.GripStyle = System.Windows.Forms.ToolStripGripStyle.Visible;
            this.menuStrip1.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.menuStrip1.Location = new System.Drawing.Point(0, 33);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Padding = new System.Windows.Forms.Padding(4, 2, 0, 2);
            this.menuStrip1.Size = new System.Drawing.Size(1405, 24);
            this.menuStrip1.TabIndex = 0;
            this.menuStrip1.Text = "menuStrip1";
            // 
            // statusStrip1
            // 
            this.statusStrip1.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.statusStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toolStripStatusLabel1,
            this.lblStripStatus});
            this.statusStrip1.Location = new System.Drawing.Point(0, 848);
            this.statusStrip1.Name = "statusStrip1";
            this.statusStrip1.Padding = new System.Windows.Forms.Padding(1, 0, 21, 0);
            this.statusStrip1.Size = new System.Drawing.Size(1405, 30);
            this.statusStrip1.TabIndex = 1;
            this.statusStrip1.Text = "statusStrip1";
            // 
            // toolStripStatusLabel1
            // 
            this.toolStripStatusLabel1.Name = "toolStripStatusLabel1";
            this.toolStripStatusLabel1.Size = new System.Drawing.Size(69, 25);
            this.toolStripStatusLabel1.Text = "Status: ";
            // 
            // lblStripStatus
            // 
            this.lblStripStatus.Name = "lblStripStatus";
            this.lblStripStatus.Size = new System.Drawing.Size(115, 25);
            this.lblStripStatus.Text = "lblStripStatus";
            // 
            // txtDatabaseVersion
            // 
            this.txtDatabaseVersion.Location = new System.Drawing.Point(1214, 309);
            this.txtDatabaseVersion.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.txtDatabaseVersion.Name = "txtDatabaseVersion";
            this.txtDatabaseVersion.ReadOnly = true;
            this.txtDatabaseVersion.Size = new System.Drawing.Size(148, 26);
            this.txtDatabaseVersion.TabIndex = 1;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(81, 326);
            this.label2.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(126, 23);
            this.label2.TabIndex = 0;
            this.label2.Text = "Machine Name";
            // 
            // menuStrip2
            // 
            this.menuStrip2.GripStyle = System.Windows.Forms.ToolStripGripStyle.Visible;
            this.menuStrip2.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.menuStrip2.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.fileToolStripMenuItem1});
            this.menuStrip2.Location = new System.Drawing.Point(0, 0);
            this.menuStrip2.Name = "menuStrip2";
            this.menuStrip2.Padding = new System.Windows.Forms.Padding(4, 2, 0, 2);
            this.menuStrip2.Size = new System.Drawing.Size(1405, 33);
            this.menuStrip2.TabIndex = 3;
            this.menuStrip2.Text = "menuStrip2";
            // 
            // fileToolStripMenuItem1
            // 
            this.fileToolStripMenuItem1.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.mnuBtnConnect});
            this.fileToolStripMenuItem1.Name = "fileToolStripMenuItem1";
            this.fileToolStripMenuItem1.Size = new System.Drawing.Size(50, 29);
            this.fileToolStripMenuItem1.Text = "File";
            // 
            // mnuBtnConnect
            // 
            this.mnuBtnConnect.Name = "mnuBtnConnect";
            this.mnuBtnConnect.Size = new System.Drawing.Size(161, 30);
            this.mnuBtnConnect.Text = "Connect";
            this.mnuBtnConnect.Click += new System.EventHandler(this.mnuBtnConnect_Click);
            // 
            // txtServerIsClustered
            // 
            this.txtServerIsClustered.Location = new System.Drawing.Point(278, 700);
            this.txtServerIsClustered.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.txtServerIsClustered.Name = "txtServerIsClustered";
            this.txtServerIsClustered.ReadOnly = true;
            this.txtServerIsClustered.Size = new System.Drawing.Size(237, 26);
            this.txtServerIsClustered.TabIndex = 16;
            // 
            // txtServerHadrManagerStatus
            // 
            this.txtServerHadrManagerStatus.Location = new System.Drawing.Point(278, 646);
            this.txtServerHadrManagerStatus.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.txtServerHadrManagerStatus.Name = "txtServerHadrManagerStatus";
            this.txtServerHadrManagerStatus.ReadOnly = true;
            this.txtServerHadrManagerStatus.Size = new System.Drawing.Size(237, 26);
            this.txtServerHadrManagerStatus.TabIndex = 15;
            // 
            // txtServerIsHadrEnabled
            // 
            this.txtServerIsHadrEnabled.Location = new System.Drawing.Point(278, 592);
            this.txtServerIsHadrEnabled.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.txtServerIsHadrEnabled.Name = "txtServerIsHadrEnabled";
            this.txtServerIsHadrEnabled.ReadOnly = true;
            this.txtServerIsHadrEnabled.Size = new System.Drawing.Size(237, 26);
            this.txtServerIsHadrEnabled.TabIndex = 14;
            // 
            // txtServerMachineName
            // 
            this.txtServerMachineName.Location = new System.Drawing.Point(278, 322);
            this.txtServerMachineName.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.txtServerMachineName.Name = "txtServerMachineName";
            this.txtServerMachineName.ReadOnly = true;
            this.txtServerMachineName.Size = new System.Drawing.Size(237, 26);
            this.txtServerMachineName.TabIndex = 13;
            // 
            // txtServerProductLevel
            // 
            this.txtServerProductLevel.Location = new System.Drawing.Point(278, 538);
            this.txtServerProductLevel.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.txtServerProductLevel.Name = "txtServerProductLevel";
            this.txtServerProductLevel.ReadOnly = true;
            this.txtServerProductLevel.Size = new System.Drawing.Size(237, 26);
            this.txtServerProductLevel.TabIndex = 12;
            // 
            // txtServerEngineEdition
            // 
            this.txtServerEngineEdition.Location = new System.Drawing.Point(278, 480);
            this.txtServerEngineEdition.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.txtServerEngineEdition.Name = "txtServerEngineEdition";
            this.txtServerEngineEdition.ReadOnly = true;
            this.txtServerEngineEdition.Size = new System.Drawing.Size(237, 26);
            this.txtServerEngineEdition.TabIndex = 11;
            // 
            // txtServerEdition
            // 
            this.txtServerEdition.Location = new System.Drawing.Point(278, 431);
            this.txtServerEdition.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.txtServerEdition.Name = "txtServerEdition";
            this.txtServerEdition.ReadOnly = true;
            this.txtServerEdition.Size = new System.Drawing.Size(237, 26);
            this.txtServerEdition.TabIndex = 10;
            // 
            // txtServerName
            // 
            this.txtServerName.Location = new System.Drawing.Point(278, 374);
            this.txtServerName.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.txtServerName.Name = "txtServerName";
            this.txtServerName.ReadOnly = true;
            this.txtServerName.Size = new System.Drawing.Size(237, 26);
            this.txtServerName.TabIndex = 9;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Segoe UI", 18F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(122, 240);
            this.label3.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(276, 48);
            this.label3.TabIndex = 17;
            this.label3.Text = "Database Server";
            this.label3.Click += new System.EventHandler(this.label3_Click);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Segoe UI", 18F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(1061, 231);
            this.label4.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(166, 48);
            this.label4.TabIndex = 19;
            this.label4.Text = "Database";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(81, 379);
            this.label1.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(57, 23);
            this.label1.TabIndex = 20;
            this.label1.Text = "Server";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.Location = new System.Drawing.Point(81, 436);
            this.label5.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(115, 23);
            this.label5.TabIndex = 21;
            this.label5.Text = "Server Edition";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label6.Location = new System.Drawing.Point(81, 485);
            this.label6.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(120, 23);
            this.label6.TabIndex = 22;
            this.label6.Text = "Engine Edition";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label7.Location = new System.Drawing.Point(81, 542);
            this.label7.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(100, 23);
            this.label7.TabIndex = 23;
            this.label7.Text = "Server Level";
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label8.Location = new System.Drawing.Point(81, 598);
            this.label8.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(132, 23);
            this.label8.TabIndex = 24;
            this.label8.Text = "High Availability";
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label9.Location = new System.Drawing.Point(81, 651);
            this.label9.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(183, 23);
            this.label9.TabIndex = 25;
            this.label9.Text = "High Availability Status";
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label10.Location = new System.Drawing.Point(81, 705);
            this.label10.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(82, 23);
            this.label10.TabIndex = 26;
            this.label10.Text = "Clustered";
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label11.Location = new System.Drawing.Point(1019, 314);
            this.label11.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(173, 23);
            this.label11.TabIndex = 0;
            this.label11.Text = "DynThingsDB Version";
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.Font = new System.Drawing.Font("Segoe UI", 18F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label12.Location = new System.Drawing.Point(1061, 521);
            this.label12.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(257, 48);
            this.label12.TabIndex = 29;
            this.label12.Text = "Database Tools";
            // 
            // panel1
            // 
            this.panel1.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.panel1.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(66)))), ((int)(((byte)(165)))), ((int)(((byte)(245)))));
            this.panel1.Controls.Add(this.lblDBUtilized);
            this.panel1.Controls.Add(this.progDBUtilized);
            this.panel1.Controls.Add(this.lblLast24hCpH);
            this.panel1.Controls.Add(this.lblMaxCPHToday);
            this.panel1.Controls.Add(this.label16);
            this.panel1.Controls.Add(this.label15);
            this.panel1.Location = new System.Drawing.Point(309, 71);
            this.panel1.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(1098, 105);
            this.panel1.TabIndex = 31;
            // 
            // lblDBUtilized
            // 
            this.lblDBUtilized.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.lblDBUtilized.AutoSize = true;
            this.lblDBUtilized.Font = new System.Drawing.Font("Segoe UI", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblDBUtilized.ForeColor = System.Drawing.Color.White;
            this.lblDBUtilized.Location = new System.Drawing.Point(422, 18);
            this.lblDBUtilized.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lblDBUtilized.Name = "lblDBUtilized";
            this.lblDBUtilized.Size = new System.Drawing.Size(126, 28);
            this.lblDBUtilized.TabIndex = 33;
            this.lblDBUtilized.Text = "lblDBUtilized";
            this.lblDBUtilized.Visible = false;
            // 
            // progDBUtilized
            // 
            this.progDBUtilized.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.progDBUtilized.Location = new System.Drawing.Point(426, 51);
            this.progDBUtilized.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.progDBUtilized.Name = "progDBUtilized";
            this.progDBUtilized.Size = new System.Drawing.Size(271, 32);
            this.progDBUtilized.TabIndex = 32;
            this.progDBUtilized.Visible = false;
            // 
            // lblLast24hCpH
            // 
            this.lblLast24hCpH.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.lblLast24hCpH.AutoSize = true;
            this.lblLast24hCpH.Font = new System.Drawing.Font("Segoe UI", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblLast24hCpH.ForeColor = System.Drawing.Color.White;
            this.lblLast24hCpH.Location = new System.Drawing.Point(953, 54);
            this.lblLast24hCpH.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lblLast24hCpH.Name = "lblLast24hCpH";
            this.lblLast24hCpH.Size = new System.Drawing.Size(139, 28);
            this.lblLast24hCpH.TabIndex = 25;
            this.lblLast24hCpH.Text = "lblLast24hCpH";
            this.lblLast24hCpH.Visible = false;
            // 
            // lblMaxCPHToday
            // 
            this.lblMaxCPHToday.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.lblMaxCPHToday.AutoSize = true;
            this.lblMaxCPHToday.Font = new System.Drawing.Font("Segoe UI", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblMaxCPHToday.ForeColor = System.Drawing.Color.White;
            this.lblMaxCPHToday.Location = new System.Drawing.Point(953, 18);
            this.lblMaxCPHToday.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lblMaxCPHToday.Name = "lblMaxCPHToday";
            this.lblMaxCPHToday.Size = new System.Drawing.Size(160, 28);
            this.lblMaxCPHToday.TabIndex = 24;
            this.lblMaxCPHToday.Text = "lblMaxCPHToday";
            this.lblMaxCPHToday.Visible = false;
            // 
            // label16
            // 
            this.label16.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.label16.AutoSize = true;
            this.label16.Font = new System.Drawing.Font("Segoe UI", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label16.ForeColor = System.Drawing.Color.White;
            this.label16.Location = new System.Drawing.Point(788, 54);
            this.label16.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label16.Name = "label16";
            this.label16.Size = new System.Drawing.Size(131, 28);
            this.label16.TabIndex = 23;
            this.label16.Text = "Last 24h CpH:";
            this.label16.Visible = false;
            // 
            // label15
            // 
            this.label15.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.label15.AutoSize = true;
            this.label15.Font = new System.Drawing.Font("Segoe UI", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label15.ForeColor = System.Drawing.Color.White;
            this.label15.Location = new System.Drawing.Point(788, 18);
            this.label15.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label15.Name = "label15";
            this.label15.Size = new System.Drawing.Size(153, 28);
            this.label15.TabIndex = 22;
            this.label15.Text = "Max CpH Today:";
            this.label15.Visible = false;
            // 
            // panel2
            // 
            this.panel2.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(43)))), ((int)(((byte)(58)))), ((int)(((byte)(72)))));
            this.panel2.Controls.Add(this.label14);
            this.panel2.Controls.Add(this.label13);
            this.panel2.Location = new System.Drawing.Point(0, 71);
            this.panel2.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(320, 105);
            this.panel2.TabIndex = 0;
            // 
            // label14
            // 
            this.label14.AutoSize = true;
            this.label14.Font = new System.Drawing.Font("Segoe UI", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label14.ForeColor = System.Drawing.Color.White;
            this.label14.Location = new System.Drawing.Point(58, 51);
            this.label14.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label14.Name = "label14";
            this.label14.Size = new System.Drawing.Size(176, 28);
            this.label14.TabIndex = 21;
            this.label14.Text = "Database Manager";
            // 
            // label13
            // 
            this.label13.AutoSize = true;
            this.label13.Font = new System.Drawing.Font("Segoe UI", 18F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label13.ForeColor = System.Drawing.Color.White;
            this.label13.Location = new System.Drawing.Point(18, 2);
            this.label13.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label13.Name = "label13";
            this.label13.Size = new System.Drawing.Size(186, 48);
            this.label13.TabIndex = 20;
            this.label13.Text = "DynThings";
            // 
            // btnShrink
            // 
            this.btnShrink.Font = new System.Drawing.Font("Segoe UI", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnShrink.Image = global::DynThings.DBManager.Properties.Resources.press;
            this.btnShrink.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnShrink.Location = new System.Drawing.Point(1037, 605);
            this.btnShrink.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.btnShrink.Name = "btnShrink";
            this.btnShrink.Size = new System.Drawing.Size(260, 88);
            this.btnShrink.TabIndex = 30;
            this.btnShrink.Text = "Shrink           ";
            this.btnShrink.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnShrink.UseVisualStyleBackColor = true;
            // 
            // pictureBox3
            // 
            this.pictureBox3.Image = global::DynThings.DBManager.Properties.Resources.wrench;
            this.pictureBox3.Location = new System.Drawing.Point(981, 502);
            this.pictureBox3.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.pictureBox3.Name = "pictureBox3";
            this.pictureBox3.Size = new System.Drawing.Size(76, 78);
            this.pictureBox3.TabIndex = 28;
            this.pictureBox3.TabStop = false;
            // 
            // pictureBox2
            // 
            this.pictureBox2.Image = global::DynThings.DBManager.Properties.Resources.data;
            this.pictureBox2.Location = new System.Drawing.Point(981, 214);
            this.pictureBox2.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.pictureBox2.Name = "pictureBox2";
            this.pictureBox2.Size = new System.Drawing.Size(76, 78);
            this.pictureBox2.TabIndex = 18;
            this.pictureBox2.TabStop = false;
            // 
            // pictureBox1
            // 
            this.pictureBox1.Image = global::DynThings.DBManager.Properties.Resources.server;
            this.pictureBox1.Location = new System.Drawing.Point(42, 222);
            this.pictureBox1.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(76, 78);
            this.pictureBox1.TabIndex = 4;
            this.pictureBox1.TabStop = false;
            // 
            // btnBackup
            // 
            this.btnBackup.Font = new System.Drawing.Font("Segoe UI", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnBackup.Image = global::DynThings.DBManager.Properties.Resources.press;
            this.btnBackup.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnBackup.Location = new System.Drawing.Point(1037, 718);
            this.btnBackup.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.btnBackup.Name = "btnBackup";
            this.btnBackup.Size = new System.Drawing.Size(260, 88);
            this.btnBackup.TabIndex = 32;
            this.btnBackup.Text = "Backup          ";
            this.btnBackup.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnBackup.UseVisualStyleBackColor = true;
            this.btnBackup.Click += new System.EventHandler(this.btnBackup_Click);
            // 
            // FrmMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.ClientSize = new System.Drawing.Size(1405, 878);
            this.Controls.Add(this.btnBackup);
            this.Controls.Add(this.panel2);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.btnShrink);
            this.Controls.Add(this.label12);
            this.Controls.Add(this.pictureBox3);
            this.Controls.Add(this.label10);
            this.Controls.Add(this.label9);
            this.Controls.Add(this.label8);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.pictureBox2);
            this.Controls.Add(this.txtDatabaseVersion);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label11);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.txtServerIsClustered);
            this.Controls.Add(this.txtServerHadrManagerStatus);
            this.Controls.Add(this.txtServerIsHadrEnabled);
            this.Controls.Add(this.txtServerMachineName);
            this.Controls.Add(this.txtServerProductLevel);
            this.Controls.Add(this.txtServerEngineEdition);
            this.Controls.Add(this.txtServerEdition);
            this.Controls.Add(this.txtServerName);
            this.Controls.Add(this.pictureBox1);
            this.Controls.Add(this.statusStrip1);
            this.Controls.Add(this.menuStrip1);
            this.Controls.Add(this.menuStrip2);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.MainMenuStrip = this.menuStrip1;
            this.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.MaximizeBox = false;
            this.Name = "FrmMain";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "DynThings Database Manager";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.FrmMain_FormClosing);
            this.Load += new System.EventHandler(this.FrmMain_Load);
            this.statusStrip1.ResumeLayout(false);
            this.statusStrip1.PerformLayout();
            this.menuStrip2.ResumeLayout(false);
            this.menuStrip2.PerformLayout();
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.panel2.ResumeLayout(false);
            this.panel2.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox3)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox2)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.StatusStrip statusStrip1;
        public System.Windows.Forms.TextBox txtDatabaseVersion;
        private System.Windows.Forms.ToolStripStatusLabel toolStripStatusLabel1;
        public System.Windows.Forms.ToolStripStatusLabel lblStripStatus;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.MenuStrip menuStrip2;
        private System.Windows.Forms.ToolStripMenuItem fileToolStripMenuItem1;
        private System.Windows.Forms.ToolStripMenuItem mnuBtnConnect;
        private System.Windows.Forms.PictureBox pictureBox1;
        public System.Windows.Forms.TextBox txtServerIsClustered;
        public System.Windows.Forms.TextBox txtServerHadrManagerStatus;
        public System.Windows.Forms.TextBox txtServerIsHadrEnabled;
        public System.Windows.Forms.TextBox txtServerMachineName;
        public System.Windows.Forms.TextBox txtServerProductLevel;
        public System.Windows.Forms.TextBox txtServerEngineEdition;
        public System.Windows.Forms.TextBox txtServerEdition;
        public System.Windows.Forms.TextBox txtServerName;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.PictureBox pictureBox2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.Label label12;
        private System.Windows.Forms.PictureBox pictureBox3;
        private System.Windows.Forms.Button btnShrink;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Label lblDBUtilized;
        private System.Windows.Forms.ProgressBar progDBUtilized;
        private System.Windows.Forms.Label lblLast24hCpH;
        private System.Windows.Forms.Label lblMaxCPHToday;
        private System.Windows.Forms.Label label16;
        private System.Windows.Forms.Label label15;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.Label label14;
        private System.Windows.Forms.Label label13;
        private System.Windows.Forms.Button btnBackup;
    }
}