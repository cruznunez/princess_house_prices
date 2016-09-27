start = ->
  setTimeout ->
    window.scrollTo 0, 1
  , 0
  $('a').on 'mouseup touchend', ->
    $('.container').removeClass 'hidden'
    setTimeout ->
      $('.welcome').remove()
    , 1000

$ start
