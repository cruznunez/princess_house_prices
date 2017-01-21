buttonPress = ->
  # Desktops and android devices recognize a mouseup and click real fast, but not touchend
  # On IOS devices, mouseup & click lag, but touchend registers real fast
  # so if the screen is large, we should use mouseup or click to listen to clicks
  # && if the screen is small, we only use touchend to listen to clicks

  $('td').on 'mousedown', -> handleStart @ if screen.width > 768
  $('td').on 'touchstart', -> handleStart @ if screen.width <= 768

  $('body').on 'mouseup', handleEnd if screen.width > 768
  $('body').on 'touchend', handleEnd if screen.width <= 768

  $('td').on 'mousedown', -> buttonClick @ if screen.width > 768
  $('td').on 'touchend', -> buttonClick @ if screen.width <= 768

buttonClick = (button) ->
  text = $(button).text()
  if text.match /\d/
    numberClick button
  else if text == '<'
    back()
  else if text == '<<'
    clear()

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
  $('#shipping').html '$0.00'
  $('#tax').html '$0.00'
  $('#total').html '$0.00'

handleStart = (button) =>
  handleEnd()
  $(button).addClass 'pressed'

handleEnd = ->
  $('td').removeClass 'pressed'

$ buttonPress
