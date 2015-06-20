using Microsoft.AspNet.Identity.EntityFramework;

namespace Movies.Models
{
    // You can add profile data for the user by adding more properties to your ApplicationUser class, please visit http://go.microsoft.com/fwlink/?LinkID=317594 to learn more.
    public class ApplicationUser : IdentityUser
    {
        public int Role { get; set; }
    }

    public enum UserRoles 
    {
        Admin = 1,
        User = 0
    }

    public class ApplicationDbContext : IdentityDbContext<ApplicationUser>
    {
        public ApplicationDbContext()
            : base("SqlServerConnection")
        {
        }
    }
}