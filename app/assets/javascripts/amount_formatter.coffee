amountFormatter = ->
  $('.price').on 'input', ->
    number = $(@).val().replace(/[^\d]/g,'').replace /^0+/, ''

    number = switch number.length
      when 1 then number.replace /(\d+)/, '0.0$1'
      when 2 then number.replace /(\d{2})/, '0.$1'
      else number.replace /(\d+)(\d{2})/, '$1.$2'

    $(@).val number

$ amountFormatter
