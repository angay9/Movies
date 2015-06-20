using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Movies.DB.Repositories
{
    public interface IUserRepository
    {
        bool SaveOrder(string userId, int movieId);
        List<Order> GetOrderedMovies(string userId, bool notReturned = false);
        AspNetUser GetUser(string Id);

        bool ReturnMovie(string userId, int movieId);
    }
}
