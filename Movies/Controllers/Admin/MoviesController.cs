using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Movies.DB;
using Movies.DB.Repositories;
using Movies.API;
using Movies.Services;
using PagedList;

namespace Movies.Controllers.Admin
{
    public class MoviesController : Controller
    {
        private IMovieRepository repo { get; set; }

        private APIHelper API { get; set; }

        public MoviesController(IMovieRepository repo, APIHelper api)
        {
            this.repo = repo;
            this.API = api;
        }

        
        public ActionResult Index(int? page)
        {
            var movies = repo.AllQueryable().ToPagedList(page ?? 1, 10);
            return View(movies);
        }

        // GET: /Movies/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            this.FlashError("Error");
            
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Movie movie = await repo.Find(id);
            if (movie == null)
            {
                return HttpNotFound();
            }
            return View(movie);
        }

        // GET: /Movies/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: /Movies/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include="Id,Title,Year,Released,Runtime,Director,Writer,Actors,Language,Country,Awards,Poster,ImdbRating,ImdbVotes,ImdbId")] Movie movie)
        {
            if (ModelState.IsValid)
            {
                await repo.Insert(movie);
                this.FlashSuccess("Saved.");
                return RedirectToAction("Index");
            }

            return View(movie);
        }

        // GET: /Movies/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Movie movie = await repo.Find(id);
            if (movie == null)
            {
                return HttpNotFound();
            }
            return View(movie);
        }

        // POST: /Movies/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include="Id,Title,Year,Released,Runtime,Director,Writer,Actors,Language,Country,Awards,Poster,ImdbRating,ImdbVotes,ImdbId")] Movie movie)
        {
            if (ModelState.IsValid)
            {
                await repo.Update(movie);
                this.FlashSuccess("Saved.");
                return RedirectToAction("Index");
            }
            return View(movie);
        }

        // GET: /Movies/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Movie movie = await repo.Find(id);
            if (movie == null)
            {
                return HttpNotFound();
            }
            return View(movie);
        }

        // POST: /Movies/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            Movie movie = await repo.Find(id);
            if (movie == null)
            {
                return HttpNotFound();
            }
            await repo.Delete(movie);
            this.FlashSuccess("Deleted.");
            return RedirectToAction("Index");
        }

        [HttpGet]
        public JsonResult Import() 
        {
            string name = Request.QueryString["name"];
            if (name == null)
            {
                Response.StatusCode = (int)HttpStatusCode.NotFound;
                return Json(new { status = "Error" }, JsonRequestBehavior.AllowGet);
            }
            try
            {
                return Json(API.Search(name), JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new { status = "Error" }, JsonRequestBehavior.AllowGet);
            }
        }

        public ActionResult GetMovie()
        {
            string id = Request.QueryString["id"];
            if (id == null)
            {
                Response.StatusCode = (int)HttpStatusCode.NotFound;
                return Json(new { status = "Error" }, JsonRequestBehavior.AllowGet);
            }
            try
            {
                var obj = API.GetMovie(id);
                return Json(obj, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new { status = "Error" }, JsonRequestBehavior.AllowGet);
            }
        }
    }
}
