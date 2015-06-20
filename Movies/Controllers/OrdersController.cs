using Movies.DB.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using Microsoft.AspNet.Identity;
using System.Threading.Tasks;
using Movies.Services;

namespace Movies.Controllers
{
    [Authorize]
    public class OrdersController : Controller
    {
        private IUserRepository userRepo { get; set; }

        private IMovieRepository movieRepo { get; set; }

        public OrdersController(IUserRepository userRepo, IMovieRepository movieRepo)
        {
            this.userRepo = userRepo;
            this.movieRepo = movieRepo;
        }

        [HttpPost]
        public ActionResult Save(int movieId)
        {
            
            if (userRepo.SaveOrder(User.Identity.GetUserId(), movieId))
            {
                // Add flash
                this.FlashSuccess("Your order has been saved.");
            }
            else
            {
                // Add errors
                this.FlashError("Internal error occured. Please try again later.");
            }
            return Redirect(Request.UrlReferrer.PathAndQuery);

        }

        [HttpGet]
        public ActionResult Show()
        {
            var orders = userRepo.GetOrderedMovies(User.Identity.GetUserId());
            return View(orders);

        }

        [HttpGet]
        [Authorize]
        public async Task<ActionResult> Return(int id)
        {
            var movie = await movieRepo.Find(id);
            return View(movie);
        }

        [Authorize]
        [HttpPost]
        public ActionResult ReturnMovie(int movieId) 
        {
            userRepo.ReturnMovie(User.Identity.GetUserId(), movieId);
            this.FlashSuccess("A movie has been returned.");
            return RedirectToAction("Show");
        }
	}
}