using Movies.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Movies.Razor.Extensions
{
    public static class FlashHelper
    {
        public static IHtmlString Flash(this HtmlHelper html) 
        {
            var flash = html.ViewContext.Controller.TempData["flash"];
            if (flash != null)
            {
                var msg = (flash as FlashMessage);
                var box = html.Raw(String.Format("<div class=\"mtop-20 alert alert-{0}\">{1}<button class=\"close pull-right\" data-dismiss=\"alert\">×</button></div>", msg.Type, msg.Message));
                html.ViewContext.Controller.TempData["flash"] = null;
                return box;
            }
            return html.Raw("");
        }
    }
}