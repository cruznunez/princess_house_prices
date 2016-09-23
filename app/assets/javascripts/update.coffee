update = ->
  $('form').on 'input', ->
    price = parseInt cents()
    shipping_cost = shipping price
    tax_cost = tax price, shipping_cost
    total = price + shipping_cost + tax_cost
    $('.shipping span').html toDollars shipping_cost
    $('.tax span').html toDollars tax_cost
    $('.total span').html toDollars total

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

tax = (price, shipping) ->
  (price + shipping) * 75/1000

toDollars = (number) ->
  '$' + (number/100).toFixed 2

$ update
