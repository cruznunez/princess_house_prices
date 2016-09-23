buttonPress = ->
  $('.button').on 'touchstart mousedown', -> handleStart @

  $('.button').on 'touchend mouseup', -> handleEnd @

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
  condition = number == 0 && val == "0"
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
  $('.shipping span').html '$0.00'
  $('.tax span').html '$0.00'
  $('.total span').html '$0.00'

handleStart = (button) =>
  $(button).css 'background', '#67000f'
  $(button).children('div').css 'margin-top', '5px'

handleEnd = (button) ->
  $(button).css 'background', ''
  $(button).children('div').css 'margin-top', ''

$ buttonPress
