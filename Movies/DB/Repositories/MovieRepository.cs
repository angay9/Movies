using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Validation;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace Movies.DB.Repositories
{
    public class MovieRepository : BaseRepository<Movie>, IMovieRepository
    {

        public List<Movie> Search(string name, string userId = null)
        {
            return SearchEnumerable(name, userId).ToList();
        }

        public IEnumerable<Movie> SearchEnumerable(string name, string userId = null)
        {
             return entities.Where(m => (m as Movie).Title.Contains(name)).OrderBy(m => m.ImdbRating)
                .ToList()
                .Where(m => !m.Orders.Any(o => o.MovieId == m.Id && o.UserId == userId && !o.Returned));
        }

        public async Task<Movie> Find(object primaryKey)
        {
            return await base.Find(primaryKey);
        }


        public async Task<bool> Insert(Movie entity)
        {
            return await base.Insert(entity);
        }

        public async Task<bool> Update(Movie entity)
        {
            return await base.Update(entity);
        }

        public override async Task<bool> Delete(Movie entity)
        {
            try
            {
                for(int i = entity.Feedbacks.Count - 1; i >= 0; i--)
                {
                    context.Set<Feedback>().Remove(entity.Feedbacks.ElementAt(i));
                }

                for (int i = entity.Orders.Count - 1; i >= 0; i--)
                {
                    context.Set<Order>().Remove(entity.Orders.ElementAt(i));
                }


                context.Set<Movie>().Remove(entity);

                await context.SaveChangesAsync();
                return true;
            }
            catch (Exception ex)
            {
                if (ex is DbEntityValidationException)
                    throw ex;
                return false;
            }
        }

        public IQueryable<Movie> AllQueryable()
        {
            return base.AllQueryable().OrderBy(p => p.Id);
        }
    }

}