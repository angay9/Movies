using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace Movies.DB.Repositories
{
    public class UserRepository : BaseRepository<AspNetUser>, IUserRepository
    {
        public bool SaveOrder(string userId, int movieId)
        {
            try
            {
                var movie = context.Set<Movie>().Find(movieId);
                var user = GetUser(userId);
                context.Set<Order>().Add(new Order
                {
                    AspNetUser = user,
                    Movie = movie
                });
                context.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public AspNetUser GetUser(string Id)
        {
            return entities.Find(Id);
        }

        public List<Order> GetOrderedMovies(string userId, bool notReturned = true)
        {
            return context.Set<Order>().Include("Movie").Include("AspNetUser").Where(o => o.UserId == userId).Where(o => o.Returned == !!notReturned).ToList();
        }


        public bool ReturnMovie(string userId, int movieId)
        {
            try
            {
                var order = context.Set<Order>().Where(o => o.UserId == userId && o.MovieId == movieId).FirstOrDefault();
                order.Returned = true;
                context.Entry<Order>(order).State = EntityState.Modified;
                context.SaveChanges();

                return true;
            }
            catch (Exception ex)
            {

                return false;
            }
            
        }
    }
}