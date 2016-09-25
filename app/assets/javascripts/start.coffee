start = ->
  $('a').on 'mousedown', -> unhide if screen.width > 768
  $('a').on 'touchstart', -> unhide if screen.width <= 768

unhide = ->
  $('.container').removeClass 'hidden'

$ start
