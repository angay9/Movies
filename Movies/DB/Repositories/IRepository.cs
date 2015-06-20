using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Movies.DB.Repositories
{
    public interface IRepository <T> where T : class
    {
        List<T> All();

        Task<T> Find(object primaryKey);

        Task<bool> Save(T entity);

        Task<bool> Delete(T entity);
    }
}
