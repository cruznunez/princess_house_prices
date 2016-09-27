start = ->
  $('a').on 'mouseup touchend', ->
    $('.container').removeClass 'hidden'
    setTimeout ->
      $('.button').remove()
    , 1000

$ start
