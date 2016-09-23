buttonPress = ->
  $('.button').on 'touchstart mousedown', -> handleStart @

  $('.button').on 'touchend mouseup', -> handleEnd @

  $('.number').click -> numberClick @

  $('.back').click back

  $('.clear').click clear

ajaxForm = ->
  $('form').on 'input', ->
    price = parseInt cents()
    shipping_cost = shipping price
    tax_cost = tax price, shipping_cost
    total = price + shipping_cost + tax_cost
    $('.shipping span').html toDollars shipping_cost
    $('.tax span').html toDollars tax_cost
    $('.total span').html toDollars total

tax = (price, shipping) ->
  (price + shipping) * 75/1000

shipping = (x) ->
  switch
    when 0 <= x <= 1500
      150
    when 1501 <= x <= 4000
      350
    when 4001 <= x <= 8000
      550
    when 8001 <= x <= 12000
      750
    when 12001 <= x <= 20000
      950
    when 20001 <= x <= 40000
      1500
    else 3000

toDollars = (number) ->
  '$' + (number/100).toFixed 2

cents = ->
  $('.price').val().replace(/[^\d]/g,'').replace(/^0+/,'')

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
  number = cents()
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
$ ajaxForm
