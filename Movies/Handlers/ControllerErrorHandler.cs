using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Movies.Services;
using System.Web.Routing;

namespace Movies.Handlers
{
    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method,
    AllowMultiple = true, Inherited = true)]
    public class ControllerErrorHandler : HandleErrorAttribute
    {
        public override void OnException(ExceptionContext context)
        {
            if (context.Exception is DbEntityValidationException)
            {
                var ex = context.Exception as DbEntityValidationException;
                var errorMessages = ex.EntityValidationErrors
                    .SelectMany(x => x.ValidationErrors)
                    .Select(x => x.ErrorMessage);

                var fullErrorMessage = string.Join("<br/> ", errorMessages);
                var exceptionMessage = string.Concat("Validation errors: <br/>", fullErrorMessage);
                var controller = context.Controller as Controller;
                controller.FlashError(exceptionMessage);
                context.ExceptionHandled = true;

                // Redirect
                context.Result = new RedirectToRouteResult(
                new RouteValueDictionary 
                { 
                    { "controller", context.Controller.ControllerContext.RouteData.Values["controller"].ToString() }, 
                    { "action", context.Controller.ControllerContext.RouteData.Values["action"].ToString() } 
                });
                base.OnException(context);
            }
        }
    }
}