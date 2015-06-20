using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Movies.DB.Repositories
{
    public interface IMovieRepository
    {
        Task<Movie> Find(object primaryKey);
        List<Movie> All();
        Task<bool> Insert(Movie entity);
        Task<bool> Update(Movie entity);
        Task<bool> Delete(Movie entity);
        List<Movie> Search(string name, string userId = null);
        IEnumerable<Movie> SearchEnumerable(string name, string userId = null);

        IQueryable<Movie> AllQueryable();
    }
}
