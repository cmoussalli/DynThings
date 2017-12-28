
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DynThings.Data.Models.ViewModels
{
    public class ThingExtensionProperty
    {
        public long ThingID { get; set; }
        public string ThingTitle { get; set; }
        public VMThingExtension ThingExtension { get; set; }
        public VMThingCategory ThingCategory { get; set; }
        public VMDataType DataType { get; set; }
        public long ValueID { get; set; }
        public string  Value { get; set; }

        #region Converters

        public void ConvertFromQuery_GetThingExtensionsList(GetThingExtensions_Result source)
        {
            VMDataType vmdt = new VMDataType();
            vmdt.ID = source.DataTypeID;
            vmdt.Title = source.DataTypeTitle;
            this.DataType = vmdt;

            VMThingCategory vmtc = new VMThingCategory();
            vmtc.ID = source.CategoryID;
            vmtc.Title = source.ThingCategoryTitle;
            this.ThingCategory = vmtc;

            VMThingExtension vmte = new VMThingExtension();
            vmte.ID = source.ThingExtensionID;
            vmte.Title = source.ThingExtensionTitle;
            vmte.Code = source.ThingExtensionCode;
            vmte.GUID = source.ThingExtensionGUID;
            vmte.ThingCategoryID = source.CategoryID;
            vmte.IsList = source.IsList;
            this.ThingExtension = vmte;

            this.ThingID = source.ThingID;
            this.ThingTitle = source.ThingTitle;
            this.ValueID = source.ValueID;
            this.Value = source.Value;

        }

        #endregion
    }


}
