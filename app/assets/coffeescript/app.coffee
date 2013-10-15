$ ->

  window.LP = (->

    # When picking identifiers, I normally prefer underscores to camelCase, but
    # that's kind of arbitrary.  As long as we all use the same thing, it
    # doesn't really matter.  So I'll go with what I find already here.

    initialHeight   = 400
    maxHeight       = 1600
    readmoreDelay   = 500

    $('.read-more-container').height(initialHeight)

    return {

      open : $('.button').on 'click', ->

        collapsed = $('.read-more-container').height() > initialHeight

        $('.read-more-container').animate(
            height: if collapsed then initialHeight else maxHeight
          , readmoreDelay)
          $(this).text(if collapsed then 'Read more' else 'Read less')

        false

      lightbox : $('.images-container').on 'click', 'img', ->
        image = $('<img/>').addClass('lightboxImage').attr('src', $(this).attr('src'))
        lightboxContainer = $('<div/>').addClass('lightbox').append(image)

        $('body').append(lightboxContainer).on 'keyup', (e) ->
          if e.keyCode is 13 or e.keyCode is 27
            $('.lightbox').remove()
        
        $('body').on 'click', (e) ->
            if $(e.target).hasClass('lightbox') then $('.lightbox').remove()

    }

  )()
