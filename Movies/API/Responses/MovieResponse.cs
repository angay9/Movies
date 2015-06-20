using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Movies.API.Responses
{
    public class MovieResponse
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public Nullable<int> Year { get; set; }
        public string Released { get; set; }
        public string Runtime { get; set; }
        public string Director { get; set; }
        public string Writer { get; set; }
        public string Actors { get; set; }
        public string Language { get; set; }
        public string Country { get; set; }
        public string Awards { get; set; }
        public string Poster { get; set; }
        public Nullable<decimal> ImdbRating { get; set; }
        public Nullable<int> ImdbVotes { get; set; }
        public string ImdbId { get; set; }
    }
}