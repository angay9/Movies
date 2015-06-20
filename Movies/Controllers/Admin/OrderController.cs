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
using PagedList;

namespace Movies.Controllers.Admin
{
    public class OrderController : Controller
    {
        private moviesEntities db = new moviesEntities();

        // GET: /Order/
        public ActionResult Index(int? page)
        {
            var orders = db.Orders.Include(o => o.AspNetUser).Include(o => o.Movie);
            return View(orders.OrderBy(o => o.id).ToPagedList(page ?? 1, 10));
        }

        // GET: /Order/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Order order = await db.Orders.FindAsync(id);
            if (order == null)
            {
                return HttpNotFound();
            }
            return View(order);
        }

        // GET: /Order/Create
        //public ActionResult Create()
        //{
        //    ViewBag.UserId = new SelectList(db.AspNetUsers, "Id", "UserName");
        //    ViewBag.MovieId = new SelectList(db.Movies1, "Id", "Title");
        //    return View();
        //}

        // POST: /Order/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public async Task<ActionResult> Create([Bind(Include="id,UserId,MovieId,Returned")] Order order)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        db.Orders.Add(order);
        //        await db.SaveChangesAsync();
        //        return RedirectToAction("Index");
        //    }

        //    ViewBag.UserId = new SelectList(db.AspNetUsers, "Id", "UserName", order.UserId);
        //    ViewBag.MovieId = new SelectList(db.Movies1, "Id", "Title", order.MovieId);
        //    return View(order);
        //}

        // GET: /Order/Edit/5
        //public async Task<ActionResult> Edit(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    Order order = await db.Orders.FindAsync(id);
        //    if (order == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    ViewBag.UserId = new SelectList(db.AspNetUsers, "Id", "UserName", order.UserId);
        //    ViewBag.MovieId = new SelectList(db.Movies1, "Id", "Title", order.MovieId);
        //    return View(order);
        //}

        // POST: /Order/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public async Task<ActionResult> Edit([Bind(Include="id,UserId,MovieId,Returned")] Order order)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        db.Entry(order).State = EntityState.Modified;
        //        await db.SaveChangesAsync();
        //        return RedirectToAction("Index");
        //    }
        //    ViewBag.UserId = new SelectList(db.AspNetUsers, "Id", "UserName", order.UserId);
        //    ViewBag.MovieId = new SelectList(db.Movies1, "Id", "Title", order.MovieId);
        //    return View(order);
        //}

        // GET: /Order/Delete/5
        //public async Task<ActionResult> Delete(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    Order order = await db.Orders.FindAsync(id);
        //    if (order == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(order);
        //}

        // POST: /Order/Delete/5

        //[HttpPost, ActionName("Delete")]
        //[ValidateAntiForgeryToken]
        //public async Task<ActionResult> DeleteConfirmed(int id)
        //{
        //    Order order = await db.Orders.FindAsync(id);
        //    db.Orders.Remove(order);
        //    await db.SaveChangesAsync();
        //    return RedirectToAction("Index");
        //}

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
