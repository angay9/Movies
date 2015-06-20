using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Movies.API.Responses
{
    public class ShortMovieResponse
    {
        public string Title { get; set; }
        public string ImdbID { get; set; }
        public string Year { get; set; }
        public string Type { get; set; }
    }
}