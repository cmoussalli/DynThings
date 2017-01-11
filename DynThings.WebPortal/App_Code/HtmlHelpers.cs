using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Html;

namespace DynThings.WebPortal
{

    public static class HelperUI
    {
        public static MvcHtmlString SimpleCheckBox(this HtmlHelper htmlHelper, string name, object htmlAttributes)
        {
            string checkBoxWithHidden = htmlHelper.CheckBox(name, htmlAttributes).ToHtmlString().Trim();
            string pureCheckBox = checkBoxWithHidden.Substring(0, checkBoxWithHidden.IndexOf("<input", 1));
            return new MvcHtmlString(pureCheckBox);
        }
    }

}