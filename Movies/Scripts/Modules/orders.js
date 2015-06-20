'use strict';
$(function () {
    var commentForm = $('.comment-form');

    commentForm.submit(function (e) {
        e.preventDefault();
        var $form = $(this);
        var data = {
            movieId: $form.find('input[name="movieId"]').val(),
            comment: $form.find('textarea[name="comment"]').val(),
            rating: $form.find('input[name="rating"]').val()
        };

        $.post('/feedbacks/save', data, function (response) {
            alert('Saved. Thanks for the comments.');
            $('.feedback-container').slideUp(300, function () {
                $(this).remove();
            });
        });
        
    });
});