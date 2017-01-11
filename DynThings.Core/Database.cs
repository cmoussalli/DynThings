using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Configuration;
using System.Data.SqlClient;

namespace DynThings.Core
{
    public static class Database
    {
        public static SetupModels.DatabaseSetup DatabaseConnectionSetup
        {
            get
            {
                SetupModels.DatabaseSetup dbMdl = new SetupModels.DatabaseSetup();
                string connectString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString();//DynThingsEntities//DefaultConnection
                SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder(connectString);
                dbMdl.Server = builder.DataSource;
                dbMdl.DatabaseName = builder.InitialCatalog;
                dbMdl.User = builder.UserID;
                dbMdl.Password = builder.Password;
                return dbMdl;
            }
        }

        public static ResultInfo.Result SetDatabaseConnection(SetupModels.DatabaseSetup dbModel)
        {
            try
            {
                var configuration = WebConfigurationManager.OpenWebConfiguration("~");
                var section = (ConnectionStringsSection)configuration.GetSection("connectionStrings");
                section.ConnectionStrings["DefaultConnection"].ConnectionString = "Data Source=" + dbModel.Server + ";Initial Catalog=" + dbModel.DatabaseName + ";user id=" + dbModel.User + ";password=" + dbModel.Password + ";multipleactiveresultsets=True;application name=EntityFramework";
                //section.ConnectionStrings["DynThingsEntities"].ConnectionString = "metadata=res://*/;provider=System.Data.SqlClient;provider connection string=&quot;data source=" + dbModel.Server + ";initial catalog=" + dbModel.DatabaseName + ";user id=" + dbModel.User + ";password=" + dbModel.Password + ";multipleactiveresultsets=True;application name=EntityFramework&quot;";
                string con2 = "metadata=res://*/;provider=System.Data.SqlClient;provider connection string='data source=" + dbModel.Server + ";initial catalog=" + dbModel.DatabaseName + ";user id=" + dbModel.User + ";password=" + dbModel.Password + ";multipleactiveresultsets=True;application name=EntityFramework'";
                section.ConnectionStrings["DynThingsEntities"].ConnectionString = con2;
                //section.ConnectionStrings["DynThingsEntities"].ConnectionString = "metadata=res://*/;provider=System.Data.SqlClient;provider connection string=&quot;data source=" + dbModel.Server + ";initial catalog=" + dbModel.DatabaseName + ";user id=" + dbModel.User + ";password=" + dbModel.Password + ";multipleactiveresultsets=True;application name=EntityFramework&quot;";
                configuration.Save();
                return ResultInfo.GenerateOKResult("Saved");
            }
            catch (Exception ex)
            {
                return ResultInfo.GenerateErrorResult(ex.Message);
            }
        }

        public static ResultInfo.Result TestDatabaseConnection(SetupModels.DatabaseSetup dbModel)
        {
            try
            {
                SqlConnection con = new SqlConnection("Data Source=" + dbModel.Server + ";Initial Catalog=" + dbModel.DatabaseName + ";user id=" + dbModel.User + ";password=" + dbModel.Password + ";multipleactiveresultsets=True;application name=EntityFramework");
                con.Open();
                SqlCommand command = new SqlCommand("select * from DynSettings", con);
                command.ExecuteScalar();
                con.Close();
                return ResultInfo.GenerateOKResult();
            }
            catch (Exception ex)
            {
                return ResultInfo.GenerateErrorResult(ex.Message);
            }
        }
    }
}
