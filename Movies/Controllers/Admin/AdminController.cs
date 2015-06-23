using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;
using Movies.DB.Repositories;
using Movies.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace Movies.Controllers.Admin
{
    [Authorize]
    public class AdminController : Controller
    {
        private IAuthenticationManager AuthenticationManager
        {
            get
            {
                return HttpContext.GetOwinContext().Authentication;
            }
        }

        private UserManager<ApplicationUser> UserManager { get; set; }

        public AdminController(UserManager<ApplicationUser> userManager)
        {
            UserManager =   userManager; 
        }

        //
        // GET: /Admin/
        [HttpGet]
        [AllowAnonymous]
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [AllowAnonymous]
        public async Task<ActionResult> Login(string username, string password) 
        {
            var user = await UserManager.FindAsync(username, password);
            if (user != null)// && user.Role == (int)UserRoles.Admin)
            {
                AuthenticationManager.SignOut(DefaultAuthenticationTypes.ExternalCookie);
                var identity = await UserManager.CreateIdentityAsync(user, DefaultAuthenticationTypes.ApplicationCookie);
                AuthenticationManager.SignIn(new AuthenticationProperties() { IsPersistent = true }, identity);

                return RedirectToAction("Index", "Users");
            }
            // Add flash error
            return Redirect(Request.UrlReferrer.AbsoluteUri);
        }

        [AllowAnonymous]
        public ActionResult Logout() 
        {
            AuthenticationManager.SignOut();
            return RedirectToAction("Index", "Home");
        }
	}
}