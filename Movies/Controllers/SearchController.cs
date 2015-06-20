using Movies.DB;
using Movies.DB.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using Microsoft.AspNet.Identity;
using PagedList;
using PagedList.Mvc;

namespace Movies.Controllers
{
    public class SearchController : Controller
    {
        public IMovieRepository repo { get; set; }

        public SearchController(IMovieRepository repo)
        {
            this.repo = repo;
        }


        public ActionResult Index(int? page, string movie = "")
        {
            //var movie = Request.QueryString["movie"];
            
            
            if (!String.IsNullOrEmpty(movie)) 
            {
                var moviesEnumerable = repo.SearchEnumerable(movie, User.Identity.GetUserId());
                ViewData["movie"] = movie;
                return View(moviesEnumerable.ToPagedList(page ?? 1, 10));
            }

            return View();
        }
	}
}