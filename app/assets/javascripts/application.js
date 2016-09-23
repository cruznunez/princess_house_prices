//= require jquery
//= require jquery_ujs
//= require_tree .

function cents() {
  return $('.price').val().replace(/[^\d]/g, '').replace(/^0+/, '');
};
