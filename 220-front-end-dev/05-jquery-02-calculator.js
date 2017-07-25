// $(function() {
//   var $first = $('#first')[0];
//   var $second = $('#second')[0];
//   var $output = $('#output')[0];
//   var $operator = $('#operator')[0];
//   $('form').on('submit', (function(e) {
//     e.preventDefault();
//     var result;
//     var first = Number($first.value);
//     var second = Number($second.value);
//     var operator = $operator.value;
//     if (operator === "+") {
//       result = first + second;
//     } else if (operator === '-') {
//       result = first - second;
//     } else if (operator === '*') {
//       result = first * second;
//     } else if (operator === '/') {
//       result = first / second;
//     }

//     $output.textContent = result;
//   }));
// });

// rewrite after reviewing solution

$(function() {
  // var $first = $('#first')[0];
  // var $second = $('#second')[0];
  // var $output = $('#output')[0];
  // var $operator = $('#operator')[0];
  $('form').on('submit', (function(e) {
    e.preventDefault();
    var result;
    var $form = $(this);
    var first = Number($form.find('#first').val());
    var second = Number($form.find('#second').val());
    var operator = $form.find('#operator').val();
    if (operator === "+") {
      result = first + second;
    } else if (operator === '-') {
      result = first - second;
    } else if (operator === '*') {
      result = first * second;
    } else if (operator === '/') {
      result = first / second;
    }

    $('#output').text(result);
  }));
});
