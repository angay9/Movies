//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Movies.DB
{
    using System;
    using System.Collections.Generic;
    
    public partial class Movie
    {
        public Movie()
        {
            this.Feedbacks = new HashSet<Feedback>();
            this.Orders = new HashSet<Order>();
        }
    
        public int Id { get; set; }
        public string Title { get; set; }
        public Nullable<int> Year { get; set; }
        public Nullable<System.DateTime> Released { get; set; }
        public Nullable<int> Runtime { get; set; }
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
    
        public virtual ICollection<Feedback> Feedbacks { get; set; }
        public virtual ICollection<Order> Orders { get; set; }
    }
}
