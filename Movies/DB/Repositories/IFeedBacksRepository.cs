using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Movies.DB.Repositories
{
    public interface IFeedBacksRepository
    {
        Task<bool> SaveFeedback(string userId, int movieId, string comment = "", int? rating = null); 
    }
}
