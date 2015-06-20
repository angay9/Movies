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
using Movies.Models;
using PagedList;

namespace Movies.Controllers.Admin
{
    public class UsersController : Controller
    {
        private moviesEntities db = new moviesEntities();

        // GET: /User/
        public ActionResult Index(int? page)
        {
            return View(db.AspNetUsers.Where(u => u.Role != (int)UserRoles.Admin).OrderBy(u => u.Id).ToPagedList(page ?? 1, 10));
        }

        // GET: /User/Details/5
        public async Task<ActionResult> Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AspNetUser aspnetuser = await db.AspNetUsers.FindAsync(id);
            if (aspnetuser == null)
            {
                return HttpNotFound();
            }
            return View(aspnetuser);
        }

        // GET: /User/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: /User/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include="Id,UserName,PasswordHash,SecurityStamp,Discriminator,Role")] AspNetUser aspnetuser)
        {
            if (ModelState.IsValid)
            {
                db.AspNetUsers.Add(aspnetuser);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            return View(aspnetuser);
        }

        // GET: /User/Edit/5
        public async Task<ActionResult> Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AspNetUser aspnetuser = await db.AspNetUsers.FindAsync(id);
            if (aspnetuser == null)
            {
                return HttpNotFound();
            }
            return View(aspnetuser);
        }

        // POST: /User/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include="Id,UserName,PasswordHash,SecurityStamp,Discriminator,Role")] AspNetUser aspnetuser)
        {
            if (ModelState.IsValid)
            {
                db.Entry(aspnetuser).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            return View(aspnetuser);
        }

        // GET: /User/Delete/5
        //public async Task<ActionResult> Delete(string id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    AspNetUser aspnetuser = await db.AspNetUsers.FindAsync(id);
        //    if (aspnetuser == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(aspnetuser);
        //}

        // POST: /User/Delete/5
        //[HttpPost, ActionName("Delete")]
        //[ValidateAntiForgeryToken]
        //public async Task<ActionResult> DeleteConfirmed(string id)
        //{
        //    AspNetUser aspnetuser = await db.AspNetUsers.FindAsync(id);
        //    db.AspNetUsers.Remove(aspnetuser);
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
