buttonPress = ->
  $('.button').on 'touchstart mousedown', -> handleStart @

  $('.button').on 'touchend mouseup', -> handleEnd @

  $('.number').click -> numberClick @

  $('.back').click back

  $('.clear').click clear

numberClick = (button) ->
  input = $ '.price'
  val = input.val()
  number = $(button).children('div').html()
  new_number = val + number
  input.val new_number
  input.trigger 'input'

back = ->
  input = $ '.price'
  str = input.val()
  number = str.replace(/[^\d]/g,'').replace(/^0+/,'')
  new_number = if number.length > 1 then str.slice 0, -1 else 0
  input.val new_number
  input.trigger 'input' if number.length > 1

clear = ->
  input = $('.price').val 0

handleStart = (button) =>
  $(button).css 'background', '#67000f'
  $(button).children('div').css 'margin-top', '5px'

handleEnd = (button) ->
  $(button).css 'background', ''
  $(button).children('div').css 'margin-top', ''

$ buttonPress
