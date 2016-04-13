namespace DynThings.Simulator
{
    partial class FrmDevice
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
            this.tabControl1 = new System.Windows.Forms.TabControl();
            this.tabPage2 = new System.Windows.Forms.TabPage();
            this.btnSendInput = new System.Windows.Forms.Button();
            this.txtInput = new System.Windows.Forms.TextBox();
            this.tabPage3 = new System.Windows.Forms.TabPage();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.lblSelectedFormType = new System.Windows.Forms.Label();
            this.lblTitle = new System.Windows.Forms.Label();
            this.lntInputs = new System.Windows.Forms.ListView();
            this.btnSendLog = new System.Windows.Forms.Button();
            this.txtLog = new System.Windows.Forms.TextBox();
            this.tabControl1.SuspendLayout();
            this.tabPage2.SuspendLayout();
            this.tabPage3.SuspendLayout();
            this.SuspendLayout();
            // 
            // tabControl1
            // 
            this.tabControl1.Controls.Add(this.tabPage2);
            this.tabControl1.Controls.Add(this.tabPage3);
            this.tabControl1.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.tabControl1.Location = new System.Drawing.Point(0, 366);
            this.tabControl1.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.tabControl1.Name = "tabControl1";
            this.tabControl1.SelectedIndex = 0;
            this.tabControl1.Size = new System.Drawing.Size(554, 68);
            this.tabControl1.TabIndex = 0;
            // 
            // tabPage2
            // 
            this.tabPage2.Controls.Add(this.btnSendInput);
            this.tabPage2.Controls.Add(this.txtInput);
            this.tabPage2.Location = new System.Drawing.Point(4, 26);
            this.tabPage2.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.tabPage2.Name = "tabPage2";
            this.tabPage2.Padding = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.tabPage2.Size = new System.Drawing.Size(546, 38);
            this.tabPage2.TabIndex = 1;
            this.tabPage2.Text = "Submit Input";
            this.tabPage2.UseVisualStyleBackColor = true;
            // 
            // btnSendInput
            // 
            this.btnSendInput.Location = new System.Drawing.Point(461, 7);
            this.btnSendInput.Name = "btnSendInput";
            this.btnSendInput.Size = new System.Drawing.Size(75, 25);
            this.btnSendInput.TabIndex = 1;
            this.btnSendInput.Text = "Send";
            this.btnSendInput.UseVisualStyleBackColor = true;
            this.btnSendInput.Click += new System.EventHandler(this.btnSendInput_Click);
            // 
            // txtInput
            // 
            this.txtInput.Location = new System.Drawing.Point(6, 7);
            this.txtInput.Name = "txtInput";
            this.txtInput.Size = new System.Drawing.Size(449, 25);
            this.txtInput.TabIndex = 0;
            // 
            // tabPage3
            // 
            this.tabPage3.Controls.Add(this.btnSendLog);
            this.tabPage3.Controls.Add(this.txtLog);
            this.tabPage3.Location = new System.Drawing.Point(4, 26);
            this.tabPage3.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.tabPage3.Name = "tabPage3";
            this.tabPage3.Size = new System.Drawing.Size(546, 38);
            this.tabPage3.TabIndex = 2;
            this.tabPage3.Text = "Submit Log";
            this.tabPage3.UseVisualStyleBackColor = true;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(21, 20);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(121, 17);
            this.label1.TabIndex = 1;
            this.label1.Text = "Device \\ EndPoint : ";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(21, 50);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(39, 17);
            this.label2.TabIndex = 2;
            this.label2.Text = "Title :";
            // 
            // lblSelectedFormType
            // 
            this.lblSelectedFormType.AutoSize = true;
            this.lblSelectedFormType.Location = new System.Drawing.Point(150, 20);
            this.lblSelectedFormType.Name = "lblSelectedFormType";
            this.lblSelectedFormType.Size = new System.Drawing.Size(128, 17);
            this.lblSelectedFormType.TabIndex = 3;
            this.lblSelectedFormType.Text = "lblSelectedFormType";
            // 
            // lblTitle
            // 
            this.lblTitle.AutoSize = true;
            this.lblTitle.Location = new System.Drawing.Point(150, 50);
            this.lblTitle.Name = "lblTitle";
            this.lblTitle.Size = new System.Drawing.Size(46, 17);
            this.lblTitle.TabIndex = 4;
            this.lblTitle.Text = "lblTitle";
            // 
            // lntInputs
            // 
            this.lntInputs.Location = new System.Drawing.Point(4, 97);
            this.lntInputs.Name = "lntInputs";
            this.lntInputs.Size = new System.Drawing.Size(546, 262);
            this.lntInputs.TabIndex = 4;
            this.lntInputs.UseCompatibleStateImageBehavior = false;
            this.lntInputs.View = System.Windows.Forms.View.List;
            // 
            // btnSendLog
            // 
            this.btnSendLog.Location = new System.Drawing.Point(461, 7);
            this.btnSendLog.Name = "btnSendLog";
            this.btnSendLog.Size = new System.Drawing.Size(75, 25);
            this.btnSendLog.TabIndex = 3;
            this.btnSendLog.Text = "Send";
            this.btnSendLog.UseVisualStyleBackColor = true;
            this.btnSendLog.Click += new System.EventHandler(this.btnSendLog_Click);
            // 
            // txtLog
            // 
            this.txtLog.Location = new System.Drawing.Point(6, 7);
            this.txtLog.Name = "txtLog";
            this.txtLog.Size = new System.Drawing.Size(449, 25);
            this.txtLog.TabIndex = 2;
            // 
            // FrmDevice
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 17F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.ClientSize = new System.Drawing.Size(554, 434);
            this.Controls.Add(this.lblTitle);
            this.Controls.Add(this.lblSelectedFormType);
            this.Controls.Add(this.lntInputs);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.tabControl1);
            this.Font = new System.Drawing.Font("Segoe UI", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.MaximizeBox = false;
            this.Name = "FrmDevice";
            this.Text = "frmDevice";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.FrmDevice_FormClosing);
            this.Load += new System.EventHandler(this.FrmDevice_Load);
            this.tabControl1.ResumeLayout(false);
            this.tabPage2.ResumeLayout(false);
            this.tabPage2.PerformLayout();
            this.tabPage3.ResumeLayout(false);
            this.tabPage3.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TabControl tabControl1;
        private System.Windows.Forms.TabPage tabPage2;
        private System.Windows.Forms.TabPage tabPage3;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        public System.Windows.Forms.Label lblSelectedFormType;
        public System.Windows.Forms.Label lblTitle;
        private System.Windows.Forms.Button btnSendInput;
        private System.Windows.Forms.TextBox txtInput;
        private System.Windows.Forms.ListView lntInputs;
        private System.Windows.Forms.Button btnSendLog;
        private System.Windows.Forms.TextBox txtLog;
    }
}