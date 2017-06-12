using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DynThings.Data.WidgetModels
{
    public class InfoBoxs
    {
        public enum InfoBoxColor
        {
            success = 1,
            info = 2,
            warning = 3,
            danger = 4,
            purple = 5

        }

        public enum InfoBoxEntryType
        {
            Text = 0,
            ProgressBar = 1
        }

        public class InfoBoxEntry
        {
            public string Title { get; set; }
            public string Value { get; set; }
            public InfoBoxEntryType InfoBoxEntryType { get; set; }
        }

        public class InfoBox
        {
            public string ID { get; set; }
            public string Title { get; set; }
            public InfoBoxColor Color { get; set; }
            public List<InfoBoxEntry> Entries { get; set; }
        }
    }
}
