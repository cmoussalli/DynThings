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
    public enum Layout
    {
        vertical,
        horizontal
    }
    public enum HAlign
    {
        left,
        center,
        right
    }
    public enum VAlign
    {
        top,
        middle,
        bottom
    }
    #endregion


    #region Props
    public class Title
    {
        #region Constructor
        public Title()
        {
            this.Text = "";
            this.X = -20;
        }
        public Title(string titleText)
        {
            
            this.Text = titleText;
            this.X  = -20;
        }
        #endregion

        [JsonProperty(PropertyName = "text")]
        public string Text = "";
        [JsonProperty(PropertyName = "x")]
        public double X = -20;
    }
    public class Serie
    {
        [JsonProperty(PropertyName = "name")]
        public string Name;
        [JsonProperty(PropertyName = "data")]
        public List<int> Data = new List<int>();
    }

    public class XAxis
    {
        [JsonProperty(PropertyName = "categories")]
        public List<string> Categories = new List<string>();

        public void GenerateMonthsList()
        {
            List<string> cats = new List<string>();
            string c1 = "Jan";
            string c2 = "Feb";
            string c3 = "Mar";
            string c4 = "Apr";
            string c5 = "Mar";
            string c6 = "Jun";
            string c7 = "Jul";
            string c8 = "Aug";
            string c9 = "Sep";
            string c10 = "Oct";
            string c11 = "Nov";
            string c12 = "Dec";

            cats.Add(c1);
            cats.Add(c2);
            cats.Add(c3);
            cats.Add(c4);
            cats.Add(c5);
            cats.Add(c6);
            cats.Add(c7);
            cats.Add(c8);
            cats.Add(c9);
            cats.Add(c10);
            cats.Add(c11);
            cats.Add(c12);

            Categories = cats;
        }
    }

    public class YAxis
    {
        public YAxis()
        {
            plotLines.Add(new PlotLine { Value = 0, Width = 1, Color = "#808080" });
        }
        public Title title = new Title();
        public List<PlotLine> plotLines = new List<PlotLine>();
    }
    public class PlotLine
    {
        public PlotLine()
        {
            Value = 0;
            Width = 1;
            Color = "#808080";
        }
        [JsonProperty(PropertyName = "value")]
        public int Value;
        [JsonProperty(PropertyName = "width")]
        public int Width;
        [JsonProperty(PropertyName = "color")]
        public string Color;
    }

    public class Tooltip
    {
        public string valueSuffix = "";
    }
    public class Legend
    {
        #region Constructor
        public Legend()
        {
            borderWidth = 0;
            layout = Layout.vertical.ToString();
            hAlign = HAlign.right.ToString();
            vAlign = VAlign.middle.ToString();
        }
        public Legend(Layout _layout, HAlign _hAlign, VAlign _vAlign, int _borderwidth)
        {
            borderWidth = _borderwidth;
            layout = _layout.ToString();
            hAlign = _hAlign.ToString();
            vAlign = _vAlign.ToString();
        }
        #endregion

        [JsonProperty(PropertyName = "vertical")]
        public string layout;

        [JsonProperty(PropertyName = "align")]
        public string hAlign;

        [JsonProperty(PropertyName = "verticalAlign")]
        public string vAlign;

        public int borderWidth;

    }
    #endregion


    public class HighChartsModel
    {
        #region Constructor
        public HighChartsModel()
        {
            yAxis = new YAxis();
        }
        #endregion



        public Title title = new Title();
        public bool credits { get { return false; } }

        [JsonProperty(PropertyName = "subtitle")]
        public Title subTitle = new Title();
        public XAxis xAxis = new XAxis();
        public YAxis yAxis;
        public Tooltip tooltip = new Tooltip();
        public Legend legend = new Legend();
        public List<Serie> series = new List<Serie>();


        public string JsonOutput(HighChartsModel model)
        {
            string json = JsonConvert.SerializeObject(model);
            return json;
        }


    }
}
