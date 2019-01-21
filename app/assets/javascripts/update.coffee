update = ->
  $('input').on 'input', ->
    price = parseInt cents()
    shipping_cost = shipping price
    tax_cost = tax price, shipping_cost
    total = price + shipping_cost + tax_cost
    $('#shipping').html toDollars shipping_cost
    $('#tax').html toDollars tax_cost
    $('#total').html toDollars total

shipping = (x) ->
  switch
    when 0 <= x <= 5000
      350
    when 5001 <= x <= 10000
      550
    when 10001 <= x <= 20000
      1050
    when 20001 <= x <= 30000
      1500
    when 30001 <= x <= 50000
      2600
    when 50001 <= x <= 75000
      3600
    when 75001 <= x <= 100000
      4600
    when 100001 <= x <= 150000
      5600
    else 6600

tax = (price, shipping) ->
  (price + shipping) * 75/1000

toDollars = (number) ->
  '$' + (number/100).toFixed 2

$ update
