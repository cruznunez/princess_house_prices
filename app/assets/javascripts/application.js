//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

function amountFormatter() {
  $('.price').on('input', function(){
    var number = $(this).val().replace(/[^\d]/g,'').replace(/^0+/,'');
    if (number.length == 1) {
      number = number.replace(/(\d+)/, "0.0$1");
    } else if (number.length == 2) {
      number = number.replace(/(\d{2})/, "0.$1");
    } else if (number.length > 2) {
      number = number.replace(/(\d+)(\d{2})/, "$1.$2");
    };
    $(this).val(number);
  });
};

function ajaxForm() {
  $('form').on('input', function() {
    var form = $(this);
    $.ajax({
      url: '/preview',
      type: 'GET',
      data: form.serialize()
    });
  });
};

$(amountFormatter);
$(ajaxForm);
