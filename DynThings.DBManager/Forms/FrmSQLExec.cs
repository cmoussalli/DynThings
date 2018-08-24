using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DynThings.DBManager
{
    public partial class FrmSQLExec : Form
    {
        public FrmSQLExec()
        {
            InitializeComponent();
        }

        private void FrmSQLExec_Load(object sender, EventArgs e)
        {
            lst.View = View.Details;
            lst.Columns.Add("Job");
            lst.Columns.Add("Type");
            lst.Columns.Add("Status");



            foreach(Job j in sc.Jobs)
            {
                lst.Items.Add(new ListViewItem(new string[] {j.title,j.jobType.ToString(),"Waiting" }));
            }

        }

        private void btnExecute_Click(object sender, EventArgs e)
        {
            ExecuteJobs();
        }

        public void ExecuteJobs()
        {
            foreach(Job j in sc.Jobs)
            {
                switch (j.jobType)
                {
                    case JobType.CreateDatabase:
                        CreateNewDatabase();
                        break;


                    default:
                        break;
                }
            }
        }

        private void ExecuteSQLScript(string script)
        {
            var sqlqueries = script.Split(new[] { "GO" + Environment.NewLine }, StringSplitOptions.RemoveEmptyEntries);
            string sqlConnectionString = @"Server=" + sc.SQLServer +";Database=" + sc.SQLDatabase + ";User Id=" + sc.SQLUser + ";Password=" + sc.SQLPassword + ";";
            var con = new SqlConnection(sqlConnectionString);
            var cmd = new SqlCommand(script, con);
            progressBar1.Visible = true;
            lblStatus.Visible = true;
            progressBar1.Value = 0;
            progressBar1.Maximum = sqlqueries.Count();
            lblStatus.Text = "0 / " + sqlqueries.Count().ToString();

            con.Open();
            foreach (var query in sqlqueries)
            {
                cmd.CommandText = query;
                cmd.ExecuteNonQuery();
                progressBar1.Value = progressBar1.Value + 1;
                lblStatus.Text = progressBar1.Value.ToString() + " / " + sqlqueries.Count().ToString();
             
            }
            con.Close();
            progressBar1.Visible = false;
            lblStatus.Visible = false;
        }

        public void CreateNewDatabase()
        {
            string script = File.ReadAllText(AppDomain.CurrentDomain.BaseDirectory + @"\Scripts\CreateDatabase\1.2.txt");
            script = script.Replace("[DynThings]", "[" + sc.SQLDatabase + "]");
            

            ExecuteSQLScript(script);

            //sc.PushSQL(script);
            MessageBox.Show("Ok");
        }
    }
}
