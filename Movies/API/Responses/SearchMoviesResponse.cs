using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Movies.API.Responses
{
    public class SearchMoviesResponse
    {
        public List<ShortMovieResponse> Search { get; set; }
    }
}