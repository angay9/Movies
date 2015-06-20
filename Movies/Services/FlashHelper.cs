using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Movies.Services
{
    public static class FlashHelper
    {
        public static void FlashSuccess(this Controller controller, string msg) 
        {
            if (controller.TempData["flash"] != null)
            {
                controller.TempData["flash"] = null;
            }
            controller.TempData["flash"] = new FlashMessage { Message = msg, Type = "success"};
        }

        public static void FlashError(this Controller controller, string msg) 
        {
            if (controller.TempData["flash"] != null)
            {
                controller.TempData["flash"] = null;
            }
            controller.TempData["flash"] = new FlashMessage { Message = msg, Type = "danger" };
        }
    };

    public class FlashMessage
    {
        public string Message {get; set;}
        public string Type {get; set;}
    }
}