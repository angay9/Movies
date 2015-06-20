using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace Movies.DB.Repositories
{
    public class FeedBacksRepository : BaseRepository<Feedback>, IFeedBacksRepository
    {
        public async Task<bool> SaveFeedback(string userId, int movieId, string comment = "", int? rating = null)
        {
            try
            {
                var feedback = context
                            .Set<Feedback>()
                            .Where(f => f.UserId == userId)
                            .Where(f => f.MovieId == movieId)
                            .FirstOrDefault();
                if (feedback == null)
                {
                    feedback = new Feedback
                    {
                        UserId = userId,
                        MovieId = movieId,
                        Comment = comment,
                        Rating = rating
                    };
                }

                if (feedback.id != null)
                {
                    context.Set<Feedback>().Add(feedback);
                }
                else
                {
                    feedback.UserId = userId;
                    feedback.MovieId = movieId;
                    feedback.Comment = comment;
                    feedback.Rating = rating;

                    context.Entry(feedback).State = EntityState.Modified;
                }
                await context.SaveChangesAsync();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
            

        }
    }
}