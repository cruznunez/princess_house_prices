start = ->
  $('.welcome').on 'mouseup touchend', ->
    $('.container').removeClass 'hidden'
    setTimeout ->
      $('.welcome').remove()
    , 1000

$ start
