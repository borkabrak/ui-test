(function() {
  $(function() {
    var initialHeight, lightbox, open;

    initialHeight = 400;
    open = $('.button').on('click', function() {
      if ($('.read-more-container').height() > 400) {
        $('.read-more-container').animate({
          height: initialHeight
        }, 500);
        $(this).text('Read more');
      } else {
        $('.read-more-container').animate({
          height: 1600
        }, 500);
        $(this).text('Read less');
      }
      return false;
    });
    return lightbox = $('.images-container').on('click', 'img', function() {
      var image, lightboxContainer;

      image = $('<img/>').addClass('lightboxImage').attr('src', $(this).attr('src'));
      lightboxContainer = $('<div/>').addClass('lightbox').append(image);
      return $('body').append(lightboxContainer).on('keyup', function(e) {
        if (e.keyCode === 13 || e.keyCode === 27) {
          return $('.lightbox').remove();
        }
      });
    });
  });

}).call(this);