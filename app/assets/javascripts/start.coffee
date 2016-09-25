start = ->
  $('a').on 'mouseup', unhide if screen.width > 768
  $('a').on 'touchend', unhide if screen.width <= 768

unhide = ->
  $('.container').removeClass 'hidden'

$ start
