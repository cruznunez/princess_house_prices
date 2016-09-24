buttonPress = ->
  $('.button').on 'touchstart mousedown', -> handleStart @

  $('.button').on 'touchend mouseup', -> handleEnd @

  # Desktops and android devices recognize a mouseup and click real fast, but not touchend
  # On IOS devices, mouseup & click lag, but touchend registers real fast
  # so if the screen is large, we should use mouseup or click to listen to clicks
  # && if the screen is small, we only use touchend to listen to clicks
  $('.number').on 'mouseup', ->
    numberClick @ if screen.width > 768

  $('.number').on 'touchend', ->
    numberClick @ if screen.width < 768

  $('.back').on 'mouseup', back

  $('.clear').on 'mouseup', clear

numberClick = (button) ->
  input = $ '.price'
  val = input.val()
  number = parseInt $(button).html()
  new_number = val + number
  condition = number == 0 && val == '0'
  unless condition
    input.val(new_number).trigger 'input'

back = ->
  input = $ '.price'
  str = input.val()
  number = cents() # defined in application.js
  new_number = if number.length > 1 then str.slice 0, -1 else 0
  input.val new_number
  if number.length > 1 then input.trigger 'input' else clear()

clear = ->
  input = $('.price').val 0
  $('.shipping').html '$0.00'
  $('.tax').html '$0.00'
  $('.total').html '$0.00'

handleStart = (button) =>
  $(button).addClass 'pressed'

handleEnd = (button) ->
  $(button).removeClass 'pressed'

$ buttonPress
