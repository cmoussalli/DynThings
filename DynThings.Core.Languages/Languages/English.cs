using System;
using System.Collections.Generic;
using System.Text;

namespace DynThings.Core.Languages
{
    public partial class LanguageData
    {
        #region Language: English
        private void SetLanguage_English()
        {
            //Commands
            Commands.Add = "Add";
            Commands.Edit = "Edit";


            //Messages
            Messages.RecordNotFound = "Record not found";


            //Components
            Components.LocationView = "Location View";
            Components.LocationViews = "Location Views";


        }
        #endregion

    }
}
