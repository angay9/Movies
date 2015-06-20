using Movies.DB.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace Movies.Controllers
{
    [HandleError]
    public class MovieController : Controller
    {
        IMovieRepository repo { get; set; }

        public MovieController(IMovieRepository repo)
        {
            this.repo = repo;
        }

        [HttpGet]
        public async Task<ActionResult> Details(int id)
        {
            var movie = await repo.Find(id);
            if (movie != null)
                HttpNotFound("Movie was not found");

            return View(movie);
        }

	}
}