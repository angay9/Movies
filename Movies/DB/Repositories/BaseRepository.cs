using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Validation;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace Movies.DB.Repositories
{
    public class BaseRepository<T> where T : class
    {
        protected DbSet<T> entities { get; set; }

        protected  DbContext context { get; set; }

        public BaseRepository() 
        {
            context = new moviesEntities();
            entities = context.Set<T>();
            
        }

        public List<T> All() 
        {
            return entities.AsEnumerable().ToList();
        }

        public IQueryable<T> AllQueryable() 
        {
            return entities;
        }

        public async Task<T> Find(object primaryKey)
        {
            return await entities.FindAsync(primaryKey);
        }

        public async Task<bool> Insert(T entity)
        {
            try
            {
                context.Set<T>().Add(entity);
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

        public async Task<bool> Update(T entity)
        {
            try
            {
                context.Set<T>().Attach(entity);
                context.Entry<T>(entity).State = EntityState.Modified;
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

        public virtual async Task<bool> Delete(T entity) 
        {
            try
            {
                context.Entry(entity).State = EntityState.Deleted;
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
        
    }
}