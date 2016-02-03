/////////////////////////////////////////////////////////////////
// Created by : Caesar Moussalli                               //
// TimeStamp  : 3-2-2016                                       //
// Content    : Handle the database configuration              //
// Notes      :                                                //
//                                                             //
/////////////////////////////////////////////////////////////////

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DynThings.Data;
using DynThings.Data.Models;

namespace DynThings.Data.Configurations
{
    public class Config
    {
        #region DB Context
        private static DynThingsEntities db = new DynThingsEntities();
        #endregion

        /// <summary>
        /// Return the develoment mode activation.
        /// </summary>
        public bool developementMode
        {
            get
            {
                bool result = false;
                DBSetting dbset = db.DBSettings.Find(2);
                if (dbset.valu == "1")
                {
                    result = true;
                }
                return result;
            }
        }

        /// <summary>
        /// Return the Database version
        /// </summary>
        public float DBVersion
        {
            get
            {
                float result = 0;
                DBSetting dbset = db.DBSettings.Find(1);
                result = float.Parse(dbset.valu);
                return result;
            }
        }


       
    }


}
