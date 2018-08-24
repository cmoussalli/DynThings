using System;
using System.Collections.Generic;
using System.Text;

namespace DynThings.WebAPI.Models
{
    public class APISystemInfo
    {
        #region :: Public Properties ::

        //public float CoreVersion { get; set; }
        //public float DataModelsVersion { get; set; }
        //public float DataRepositoriesVersion { get; set; }
        //public float DataReportsVersion { get; set; }
        //public float APIModelsVersion { get; set; }
        //public float APIRepositoriesVersion { get; set; }
        //public float LanguagesVersion { get; set; }
        //public float WidgetVersion { get; set; }
        //public float CentralServicesVersion { get; set; }

        //public float PortalVersion { get; set; }
        //public float DBVersion { get; set; }

        public List<ComponentInfo> Components = new List<ComponentInfo>();

        public DateTime DeploymentDate { get; set; }

        public int PortalTimeZone { get; set; }
        #endregion

        #region :: Constructor ::
        //public APISystemInfo()
        //{
        //  
        //}
        #endregion


    }


    public class ComponentInfo
    {
        public string Component { get; set; }
        public float Version { get; set; }

    }
}
