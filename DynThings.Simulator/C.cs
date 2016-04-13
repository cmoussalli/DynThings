using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DynThings.WebAPI.Models;

namespace DynThings.Simulator
{
    public static class C
    {
        #region Properties
        private static string webAppURL = "http://localhost/dynthings.webportal/";
        public static string WebAppURL
        {
            get
            {
                return webAppURL;
            }

            set
            {
                webAppURL = value;
            }
        }

        public static string WebAPIURL
        {
            get
            {
                return webAppURL + "/api/APISimulatorServices/";
            }
        }

        public static string PlatformGUID = "a86bb826-988d-4f9a-9f43-169045506194";
        public static string PlatformGUIDParam = "platformKey=" + PlatformGUID;

        public static  List<APIDevice> apiDevices = new List<APIDevice>();
        public static List<APIEndPoint> apiEndPoints = new List<APIEndPoint>();

        public static ApiResponse response = new ApiResponse();
        #endregion


        #region Forms
        public static  FrmMain frmMain = new FrmMain();

        #endregion




    }
}
