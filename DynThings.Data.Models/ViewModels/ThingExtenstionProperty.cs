
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DynThings.Data.Models.ViewModels
{
    public class ThingExtenstionProperty
    {
        public long ThingID { get; set; }
        public string ThingTitle { get; set; }
        public VMThingExtenstion ThingExtenstion { get; set; }
        public VMThingCategory ThingCategory { get; set; }
        public VMDataType DataType { get; set; }
        public long ValueID { get; set; }
        public string  Value { get; set; }

        #region Converters

        public void ConvertFromQuery_GetThingExtenstionsList(GetThingExtenstions_Result source)
        {
            VMDataType vmdt = new VMDataType();
            vmdt.ID = source.DataTypeID;
            vmdt.Title = source.DataTypeTitle;
            this.DataType = vmdt;

            VMThingCategory vmtc = new VMThingCategory();
            vmtc.ID = source.CategoryID;
            vmtc.Title = source.ThingCategoryTitle;
            this.ThingCategory = vmtc;

            VMThingExtenstion vmte = new VMThingExtenstion();
            vmte.ID = source.ThingExtenstionID;
            vmte.Title = source.ThingExtenstionTitle;
            vmte.Code = source.ThingExtenstionCode;
            vmte.GUID = source.ThingExtenstionGUID;
            vmte.ThingCategoryID = source.CategoryID;
            vmte.IsList = source.IsList;
            this.ThingExtenstion = vmte;

            this.ThingID = source.ThingID;
            this.ThingTitle = source.ThingTitle;
            this.ValueID = source.ValueID;
            this.Value = source.Value;

        }

        #endregion
    }


}
