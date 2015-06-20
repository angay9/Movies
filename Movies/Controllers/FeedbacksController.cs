using Movies.DB.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using Microsoft.AspNet.Identity;

namespace Movies.Controllers
{
    [Authorize]
    public class FeedbacksController : Controller
    {

        private IFeedBacksRepository repo { get; set; }

        public FeedbacksController(IFeedBacksRepository repo) 
        {
            this.repo = repo;
        }

        [HttpPost]
        public async Task<ActionResult> Save(int movieId, string comment, int? rating)
        {
            await repo.SaveFeedback(User.Identity.GetUserId(), movieId, comment, rating);
            return Json(new { comment = comment, rating = rating });
        }
	}
}