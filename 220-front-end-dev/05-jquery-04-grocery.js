$(function () {
  $('form').submit(function(e) {
    e.preventDefault();

    var item = $('#item').val();
    var quantity = $('#quantity').val() || 1;
    var $list = $('ul');

    $list.append('<li>');
    $list.find('li').eq(-1).text(quantity + ' ' + item);
    $('form')[0].reset();
    $('#item').focus();
  });
});