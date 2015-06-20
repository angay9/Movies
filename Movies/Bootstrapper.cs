using System.Web.Mvc;
using Microsoft.Practices.Unity;
using Unity.Mvc4;
using Microsoft.AspNet.Identity;
using Movies.Models;
using Microsoft.AspNet.Identity.EntityFramework;
using System.Data.Entity;
using Movies.Controllers;
using Movies.DB.Repositories;
using Movies.DB;
using Movies.API;

namespace Movies
{
  public static class Bootstrapper
  {
    public static IUnityContainer Initialise()
    {
      var container = BuildUnityContainer();

      DependencyResolver.SetResolver(new UnityDependencyResolver(container));

      return container;
    }

    private static IUnityContainer BuildUnityContainer()
    {
      var container = new UnityContainer();

      // register all your components with the container here
      // it is NOT necessary to register your controllers

      // e.g. container.RegisterType<ITestService, TestService>();
      container.RegisterType<IUserStore<ApplicationUser>, UserStore<ApplicationUser>>();
      container.RegisterType<UserManager<ApplicationUser>>();
      container.RegisterType<DbContext, ApplicationDbContext>();
      container.RegisterType<ApplicationUserManager>();
      container.RegisterType<AccountController>(new InjectionConstructor());
      container.RegisterType<IUserRepository, UserRepository>();
      container.RegisterType<IMovieRepository, MovieRepository>();
      container.RegisterType<IFeedBacksRepository, FeedBacksRepository>();
      container.RegisterType<APIHelper, APIHelper>();

      RegisterTypes(container);

      return container;
    }

    public static void RegisterTypes(IUnityContainer container)
    {
    
    }
  }
}