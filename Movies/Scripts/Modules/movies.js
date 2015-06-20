'use strict';
$(function () {
    var searchMoviesForm = $('#search-movies');
    var table = $('#movies-table');
    var movies = [];
    searchMoviesForm.submit(function (e) {
        e.preventDefault();
        
        $.get(this.getAttribute('action'), $(this).serialize(), function (response) {
            if (response.Search == null || response.Search.length === 0) {
                alert('No items found');
                table.addClass('hide');
                return;
            }
            movies = response.Search;
            
            var tmpl = "";
            var singleTmpl = "<tr><td>@num</td><td>@imdbId</td><td>@title</td><td>@year</td><td><a href='/movies/getmovie?id=@imdbId' class='btn btn-primary import-btn'>Import</a></td></tr>";

            movies.forEach(function (el, i) {
                tmpl += singleTmpl.replace("@num", i).replace(/@imdbId/g, el.ImdbID).replace("@title", el.Title).replace("@year", el.Year);
            });
            table.removeClass('hide').find('tbody').html(tmpl);
        });

    });

    $(document).on('click', '.import-btn', function (e) {
        e.preventDefault();
        $.get(this.getAttribute('href'), function (response) {
            var form = $('#create-form-container form');
            if (response.status == "Error") {
                alert('Server error!');
                return;
            }
            var obj = new ViewModel(response);

            for (var prop in obj) {
                if (obj.hasOwnProperty(prop)) {
                    form.find('input[name="' + prop + '"]').val(obj[prop]);
                }
            }
        });
        
    });
});

var ViewModel = function (data) {

    this.Id = data.Id;
    this.Title = data.Title;
    this.Year = data.Year;
    this.Released = data.Released;
    this.Runtime = parseInt(data.Runtime, 10);
    this.Director = data.Director;
    this.Writer = data.Writer;
    this.Actors = data.Actors;
    this.Language = data.Language;
    this.Country = data.Country;
    this.Awards = data.Awards;
    this.Poster = data.Poster;
    this.ImdbRating = data.ImdbRating;
    this.ImdbVotes = data.ImdbVotes;
    this.ImdbId = data.ImdbId;
}