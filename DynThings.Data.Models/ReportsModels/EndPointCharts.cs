using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Script.Serialization;
using Newtonsoft.Json;

namespace DynThings.Data.Models.ReportsModels
{
    #region Enums

    public enum layout
    {
        vertical,
        horizontal
    }

    public enum hAlign
    {
        left,
        center,
        right
    }

    public enum vAlign
    {
        top,
        middle,
        bottom
    }
    #endregion


    #region Props

    public class serie
    {
        [JsonProperty(PropertyName = "name")]
        public string Name;
        [JsonProperty(PropertyName = "data")]
        public List<int> Data;
    }

    public class yAxis
    {
        public int Value;
        public int Width;
        public string Color;
    }

    public class legend
    {
        public legend(layout _Layout, hAlign _HAlign, vAlign _VAlign, int _Borderwidth)
        {
            BorderWidth = _Borderwidth;
            Layout = _Layout;
            HAlign = _HAlign;
            VAlign = _VAlign;
        }
        public layout Layout;
        public hAlign HAlign;
        public vAlign VAlign;
        public int BorderWidth;

    }
    #endregion


    public class HighChartsModel
    {
        #region Constructor
        public HighChartsModel()
        {
            legend lgnd = new legend(layout.vertical, hAlign.right, vAlign.middle, 0);
            Legend = lgnd;
        }
        #endregion

        public string Title;
        public string SubTitle;
        public List<string> XAxisList;
        public List<yAxis> YAxisList;
        public string YAxisTitle;
        public legend Legend;
        public string ToolTip;
        public List<serie> Series;

        public string XAxisListOutput
        {
            get
            {
                string json = JsonConvert.SerializeObject(XAxisList);
                return json;
            }
        }

        public string SeriesListOutput
        {
            get
            {
                string json = JsonConvert.SerializeObject(Series);
                //json = json.Replace("\"Name\"", "name");
                //json = json.Replace("\"Data\"", "data");
                return json;
            }
        }
    }
}
