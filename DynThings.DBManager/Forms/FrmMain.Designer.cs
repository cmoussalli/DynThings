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
            this.panel2 = new System.Windows.Forms.Panel();
            this.label13 = new System.Windows.Forms.Label();
            this.label14 = new System.Windows.Forms.Label();
            this.label15 = new System.Windows.Forms.Label();
            this.label16 = new System.Windows.Forms.Label();
            this.lblMaxCPHToday = new System.Windows.Forms.Label();
            this.lblLast24hCpH = new System.Windows.Forms.Label();
            this.progDBUtilized = new System.Windows.Forms.ProgressBar();
            this.lblDBUtilized = new System.Windows.Forms.Label();
            this.btnShrink = new System.Windows.Forms.Button();
            this.pictureBox3 = new System.Windows.Forms.PictureBox();
            this.pictureBox2 = new System.Windows.Forms.PictureBox();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.button1 = new System.Windows.Forms.Button();
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
            this.menuStrip1.Location = new System.Drawing.Point(0, 24);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Size = new System.Drawing.Size(937, 24);
            this.menuStrip1.TabIndex = 0;
            this.menuStrip1.Text = "menuStrip1";
            // 
            // statusStrip1
            // 
            this.statusStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toolStripStatusLabel1,
            this.lblStripStatus});
            this.statusStrip1.Location = new System.Drawing.Point(0, 548);
            this.statusStrip1.Name = "statusStrip1";
            this.statusStrip1.Size = new System.Drawing.Size(937, 22);
            this.statusStrip1.TabIndex = 1;
            this.statusStrip1.Text = "statusStrip1";
            // 
            // toolStripStatusLabel1
            // 
            this.toolStripStatusLabel1.Name = "toolStripStatusLabel1";
            this.toolStripStatusLabel1.Size = new System.Drawing.Size(45, 17);
            this.toolStripStatusLabel1.Text = "Status: ";
            // 
            // lblStripStatus
            // 
            this.lblStripStatus.Name = "lblStripStatus";
            this.lblStripStatus.Size = new System.Drawing.Size(76, 17);
            this.lblStripStatus.Text = "lblStripStatus";
            // 
            // txtDatabaseVersion
            // 
            this.txtDatabaseVersion.Location = new System.Drawing.Point(183, 203);
            this.txtDatabaseVersion.Name = "txtDatabaseVersion";
            this.txtDatabaseVersion.ReadOnly = true;
            this.txtDatabaseVersion.Size = new System.Drawing.Size(100, 20);
            this.txtDatabaseVersion.TabIndex = 1;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(612, 209);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(83, 13);
            this.label2.TabIndex = 0;
            this.label2.Text = "Machine Name";
            // 
            // menuStrip2
            // 
            this.menuStrip2.GripStyle = System.Windows.Forms.ToolStripGripStyle.Visible;
            this.menuStrip2.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.fileToolStripMenuItem1});
            this.menuStrip2.Location = new System.Drawing.Point(0, 0);
            this.menuStrip2.Name = "menuStrip2";
            this.menuStrip2.Size = new System.Drawing.Size(937, 24);
            this.menuStrip2.TabIndex = 3;
            this.menuStrip2.Text = "menuStrip2";
            // 
            // fileToolStripMenuItem1
            // 
            this.fileToolStripMenuItem1.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.mnuBtnConnect});
            this.fileToolStripMenuItem1.Name = "fileToolStripMenuItem1";
            this.fileToolStripMenuItem1.Size = new System.Drawing.Size(37, 20);
            this.fileToolStripMenuItem1.Text = "File";
            // 
            // mnuBtnConnect
            // 
            this.mnuBtnConnect.Name = "mnuBtnConnect";
            this.mnuBtnConnect.Size = new System.Drawing.Size(119, 22);
            this.mnuBtnConnect.Text = "Connect";
            this.mnuBtnConnect.Click += new System.EventHandler(this.mnuBtnConnect_Click);
            // 
            // txtServerIsClustered
            // 
            this.txtServerIsClustered.Location = new System.Drawing.Point(743, 452);
            this.txtServerIsClustered.Name = "txtServerIsClustered";
            this.txtServerIsClustered.ReadOnly = true;
            this.txtServerIsClustered.Size = new System.Drawing.Size(159, 20);
            this.txtServerIsClustered.TabIndex = 16;
            // 
            // txtServerHadrManagerStatus
            // 
            this.txtServerHadrManagerStatus.Location = new System.Drawing.Point(743, 417);
            this.txtServerHadrManagerStatus.Name = "txtServerHadrManagerStatus";
            this.txtServerHadrManagerStatus.ReadOnly = true;
            this.txtServerHadrManagerStatus.Size = new System.Drawing.Size(159, 20);
            this.txtServerHadrManagerStatus.TabIndex = 15;
            // 
            // txtServerIsHadrEnabled
            // 
            this.txtServerIsHadrEnabled.Location = new System.Drawing.Point(743, 382);
            this.txtServerIsHadrEnabled.Name = "txtServerIsHadrEnabled";
            this.txtServerIsHadrEnabled.ReadOnly = true;
            this.txtServerIsHadrEnabled.Size = new System.Drawing.Size(159, 20);
            this.txtServerIsHadrEnabled.TabIndex = 14;
            // 
            // txtServerMachineName
            // 
            this.txtServerMachineName.Location = new System.Drawing.Point(743, 206);
            this.txtServerMachineName.Name = "txtServerMachineName";
            this.txtServerMachineName.ReadOnly = true;
            this.txtServerMachineName.Size = new System.Drawing.Size(159, 20);
            this.txtServerMachineName.TabIndex = 13;
            // 
            // txtServerProductLevel
            // 
            this.txtServerProductLevel.Location = new System.Drawing.Point(743, 346);
            this.txtServerProductLevel.Name = "txtServerProductLevel";
            this.txtServerProductLevel.ReadOnly = true;
            this.txtServerProductLevel.Size = new System.Drawing.Size(159, 20);
            this.txtServerProductLevel.TabIndex = 12;
            // 
            // txtServerEngineEdition
            // 
            this.txtServerEngineEdition.Location = new System.Drawing.Point(743, 309);
            this.txtServerEngineEdition.Name = "txtServerEngineEdition";
            this.txtServerEngineEdition.ReadOnly = true;
            this.txtServerEngineEdition.Size = new System.Drawing.Size(159, 20);
            this.txtServerEngineEdition.TabIndex = 11;
            // 
            // txtServerEdition
            // 
            this.txtServerEdition.Location = new System.Drawing.Point(743, 277);
            this.txtServerEdition.Name = "txtServerEdition";
            this.txtServerEdition.ReadOnly = true;
            this.txtServerEdition.Size = new System.Drawing.Size(159, 20);
            this.txtServerEdition.TabIndex = 10;
            // 
            // txtServerName
            // 
            this.txtServerName.Location = new System.Drawing.Point(743, 240);
            this.txtServerName.Name = "txtServerName";
            this.txtServerName.ReadOnly = true;
            this.txtServerName.Size = new System.Drawing.Size(159, 20);
            this.txtServerName.TabIndex = 9;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Segoe UI", 18F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(639, 153);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(82, 32);
            this.label3.TabIndex = 17;
            this.label3.Text = "Server";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Segoe UI", 18F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(81, 153);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(113, 32);
            this.label4.TabIndex = 19;
            this.label4.Text = "Database";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(612, 243);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(38, 13);
            this.label1.TabIndex = 20;
            this.label1.Text = "Server";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.Location = new System.Drawing.Point(612, 280);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(78, 13);
            this.label5.TabIndex = 21;
            this.label5.Text = "Server Edition";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label6.Location = new System.Drawing.Point(612, 312);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(83, 13);
            this.label6.TabIndex = 22;
            this.label6.Text = "Engine Edition";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label7.Location = new System.Drawing.Point(612, 349);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(66, 13);
            this.label7.TabIndex = 23;
            this.label7.Text = "Server Level";
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label8.Location = new System.Drawing.Point(612, 385);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(90, 13);
            this.label8.TabIndex = 24;
            this.label8.Text = "High Availability";
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label9.Location = new System.Drawing.Point(612, 420);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(125, 13);
            this.label9.TabIndex = 25;
            this.label9.Text = "High Availability Status";
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label10.Location = new System.Drawing.Point(612, 455);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(56, 13);
            this.label10.TabIndex = 26;
            this.label10.Text = "Clustered";
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label11.Location = new System.Drawing.Point(53, 206);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(117, 13);
            this.label11.TabIndex = 0;
            this.label11.Text = "DynThingsDB Version";
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.Font = new System.Drawing.Font("Segoe UI", 18F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label12.Location = new System.Drawing.Point(81, 341);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(175, 32);
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
            this.panel1.Location = new System.Drawing.Point(206, 46);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(732, 68);
            this.panel1.TabIndex = 31;
            // 
            // panel2
            // 
            this.panel2.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(43)))), ((int)(((byte)(58)))), ((int)(((byte)(72)))));
            this.panel2.Controls.Add(this.label14);
            this.panel2.Controls.Add(this.label13);
            this.panel2.Location = new System.Drawing.Point(0, 46);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(213, 68);
            this.panel2.TabIndex = 0;
            // 
            // label13
            // 
            this.label13.AutoSize = true;
            this.label13.Font = new System.Drawing.Font("Segoe UI", 18F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label13.ForeColor = System.Drawing.Color.White;
            this.label13.Location = new System.Drawing.Point(12, 2);
            this.label13.Name = "label13";
            this.label13.Size = new System.Drawing.Size(129, 32);
            this.label13.TabIndex = 20;
            this.label13.Text = "DynThings";
            // 
            // label14
            // 
            this.label14.AutoSize = true;
            this.label14.Font = new System.Drawing.Font("Segoe UI", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label14.ForeColor = System.Drawing.Color.White;
            this.label14.Location = new System.Drawing.Point(39, 33);
            this.label14.Name = "label14";
            this.label14.Size = new System.Drawing.Size(120, 17);
            this.label14.TabIndex = 21;
            this.label14.Text = "Database Manager";
            // 
            // label15
            // 
            this.label15.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.label15.AutoSize = true;
            this.label15.Font = new System.Drawing.Font("Segoe UI", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label15.ForeColor = System.Drawing.Color.White;
            this.label15.Location = new System.Drawing.Point(525, 11);
            this.label15.Name = "label15";
            this.label15.Size = new System.Drawing.Size(104, 17);
            this.label15.TabIndex = 22;
            this.label15.Text = "Max CpH Today:";
            // 
            // label16
            // 
            this.label16.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.label16.AutoSize = true;
            this.label16.Font = new System.Drawing.Font("Segoe UI", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label16.ForeColor = System.Drawing.Color.White;
            this.label16.Location = new System.Drawing.Point(525, 35);
            this.label16.Name = "label16";
            this.label16.Size = new System.Drawing.Size(88, 17);
            this.label16.TabIndex = 23;
            this.label16.Text = "Last 24h CpH:";
            // 
            // lblMaxCPHToday
            // 
            this.lblMaxCPHToday.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.lblMaxCPHToday.AutoSize = true;
            this.lblMaxCPHToday.Font = new System.Drawing.Font("Segoe UI", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblMaxCPHToday.ForeColor = System.Drawing.Color.White;
            this.lblMaxCPHToday.Location = new System.Drawing.Point(635, 11);
            this.lblMaxCPHToday.Name = "lblMaxCPHToday";
            this.lblMaxCPHToday.Size = new System.Drawing.Size(106, 17);
            this.lblMaxCPHToday.TabIndex = 24;
            this.lblMaxCPHToday.Text = "lblMaxCPHToday";
            // 
            // lblLast24hCpH
            // 
            this.lblLast24hCpH.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.lblLast24hCpH.AutoSize = true;
            this.lblLast24hCpH.Font = new System.Drawing.Font("Segoe UI", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblLast24hCpH.ForeColor = System.Drawing.Color.White;
            this.lblLast24hCpH.Location = new System.Drawing.Point(635, 35);
            this.lblLast24hCpH.Name = "lblLast24hCpH";
            this.lblLast24hCpH.Size = new System.Drawing.Size(91, 17);
            this.lblLast24hCpH.TabIndex = 25;
            this.lblLast24hCpH.Text = "lblLast24hCpH";
            // 
            // progDBUtilized
            // 
            this.progDBUtilized.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.progDBUtilized.Location = new System.Drawing.Point(284, 33);
            this.progDBUtilized.Name = "progDBUtilized";
            this.progDBUtilized.Size = new System.Drawing.Size(181, 21);
            this.progDBUtilized.TabIndex = 32;
            // 
            // lblDBUtilized
            // 
            this.lblDBUtilized.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.lblDBUtilized.AutoSize = true;
            this.lblDBUtilized.Font = new System.Drawing.Font("Segoe UI", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblDBUtilized.ForeColor = System.Drawing.Color.White;
            this.lblDBUtilized.Location = new System.Drawing.Point(281, 11);
            this.lblDBUtilized.Name = "lblDBUtilized";
            this.lblDBUtilized.Size = new System.Drawing.Size(81, 17);
            this.lblDBUtilized.TabIndex = 33;
            this.lblDBUtilized.Text = "lblDBUtilized";
            // 
            // btnShrink
            // 
            this.btnShrink.Font = new System.Drawing.Font("Segoe UI", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnShrink.Image = global::DynThings.DBManager.Properties.Resources.press;
            this.btnShrink.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnShrink.Location = new System.Drawing.Point(65, 396);
            this.btnShrink.Name = "btnShrink";
            this.btnShrink.Size = new System.Drawing.Size(173, 57);
            this.btnShrink.TabIndex = 30;
            this.btnShrink.Text = "Shrink           ";
            this.btnShrink.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnShrink.UseVisualStyleBackColor = true;
            // 
            // pictureBox3
            // 
            this.pictureBox3.Image = global::DynThings.DBManager.Properties.Resources.wrench;
            this.pictureBox3.Location = new System.Drawing.Point(28, 329);
            this.pictureBox3.Name = "pictureBox3";
            this.pictureBox3.Size = new System.Drawing.Size(51, 50);
            this.pictureBox3.TabIndex = 28;
            this.pictureBox3.TabStop = false;
            // 
            // pictureBox2
            // 
            this.pictureBox2.Image = global::DynThings.DBManager.Properties.Resources.data;
            this.pictureBox2.Location = new System.Drawing.Point(28, 141);
            this.pictureBox2.Name = "pictureBox2";
            this.pictureBox2.Size = new System.Drawing.Size(51, 50);
            this.pictureBox2.TabIndex = 18;
            this.pictureBox2.TabStop = false;
            // 
            // pictureBox1
            // 
            this.pictureBox1.Image = global::DynThings.DBManager.Properties.Resources.server;
            this.pictureBox1.Location = new System.Drawing.Point(586, 141);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(51, 50);
            this.pictureBox1.TabIndex = 4;
            this.pictureBox1.TabStop = false;
            // 
            // button1
            // 
            this.button1.Font = new System.Drawing.Font("Segoe UI", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button1.Image = global::DynThings.DBManager.Properties.Resources.press;
            this.button1.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.button1.Location = new System.Drawing.Point(65, 469);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(173, 57);
            this.button1.TabIndex = 32;
            this.button1.Text = "Shrink           ";
            this.button1.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.button1.UseVisualStyleBackColor = true;
            // 
            // FrmMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.ClientSize = new System.Drawing.Size(937, 570);
            this.Controls.Add(this.button1);
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
            this.MaximizeBox = false;
            this.Name = "FrmMain";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "DynThings Database Manager";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.FrmMain_FormClosing);
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
        private System.Windows.Forms.Button button1;
    }
}