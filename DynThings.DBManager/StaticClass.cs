using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataConnector;
using System.Data;
using DynThings.DBManager.Models;

namespace DynThings.DBManager
{

    public enum JobType
    {
        CreateDatabase = 0,
        UpdateDatabase = 1,
        BackupDatabase = 2,
        ShrinkDatabase = 3
    }
    public class Job
    {
        public string title;
        public JobType jobType; 

    }

    public static class sc
    {
        #region Jobs
        public static List<Job> Jobs = new List<Job>();
        #endregion

        #region Forms
        public static FrmMain frmMain = new FrmMain();

        #endregion

        #region Props
        public static SQLData sqlConnector = new SQLData();
        public static string SQLServer { get; set; }
        public static string SQLUser { get; set; }
        public static string SQLPassword { get; set; }
        public static string SQLDatabase { get; set; }

        public static bool IsConnected { get; set; }

        public static DatabaseInfo databaseInfo { get; set; }
        public static ServerInfo serverInfo { get; set; }
        #endregion

        #region Init
        public static void Initalize()
        {
            databaseInfo = new DatabaseInfo();
            serverInfo = new ServerInfo();
        }
        #endregion

        #region DB

        public static DataSet PullSQL(string sqlScript)
        {
            DataSet ds = sqlConnector.Load_query(SQLServer, SQLUser, SQLPassword, SQLDatabase, sqlScript);
            return ds;
        }

        public static bool PushSQL(string sqlScript)
        {
            bool result = false;
            try
            {
                string resultStr = sqlConnector.Change_query(SQLServer, SQLUser, SQLPassword, SQLDatabase, sqlScript);
                if (resultStr.ToLower() == "ok")
                {
                    result = true;
                }
            }
            catch(Exception ex)
            {
            }
            return result;

        }
        #endregion

        public static bool TestConnection()
        {
            bool result = false;
            try
            {
                string sql = "select count(*) from sys.tables";
                PullSQL(sql);
                result = true;
            }
            catch
            {
            }

            return result;
        }

        #region Methods
        public static void LoadDatabaseInfo()
        {
            DataTable dt = new DataTable();
            //Validate if database is empty or not            
            try
            {
                if (PullSQL("select * from sys.tables").Tables[0].Rows.Count > 0)
                {// Database is Not Empty
                    dt = PullSQL("select * from DynSettings").Tables[0];
                    databaseInfo.DBVersion = dt.Rows[0]["DBVersion"].ToString();

                }
                else
                {//Database is Empty
                    throw new Exception("Empty Database");
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error: " + ex.Message);
            }

        }

        public static void LoadServerInfo()
        {
            DataTable dt = new DataTable();
            //Validate if database is empty or not            
            try
            {
                if (PullSQL("select * from sys.tables").Tables[0].Rows.Count > 0)
                {// Database is Not Empty
                    dt = PullSQL("exec INFO_Server").Tables[0];
                    serverInfo.MachineName = dt.Rows[0]["MachineName"].ToString();
                    serverInfo.ServerName = dt.Rows[0]["ServerName"].ToString();
                    serverInfo.Edition = dt.Rows[0]["Edition"].ToString();
                    serverInfo.EngineEdition = dt.Rows[0]["EngineEdition"].ToString();
                    serverInfo.ProductLevel = dt.Rows[0]["ProductLevel"].ToString();
                    serverInfo.HadrManagerStatus = dt.Rows[0]["HadrManagerStatus"].ToString();
                    serverInfo.IsHadrEnabled = dt.Rows[0]["IsHadrEnabled"].ToString();
                    if (dt.Rows[0]["IsHadrEnabled"].ToString() == "1")
                    {
                        serverInfo.IsClustered = true;
                    }
                }
                else
                {//Database is Empty
                    throw new Exception("Empty Database");
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error: " + ex.Message);
            }

        }

        

        #endregion
    }
}
