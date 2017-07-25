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

// $(function() {
//   $('form').on('submit', (function(e) {
//     e.preventDefault();
//     var result;
//     var $form = $(this);
//     var first = Number($form.find('#first').val());
//     var second = Number($form.find('#second').val());
//     var operator = $form.find('#operator').val();
//     if (operator === "+") {
//       result = first + second;
//     } else if (operator === '-') {
//       result = first - second;
//     } else if (operator === '*') {
//       result = first * second;
//     } else if (operator === '/') {
//       result = first / second;
//     }

//     $('#output').text(result);
//   }));
// });

// without jQuery

function $(id_selector) {
  return document.getElementById(id_selector);
}

document.addEventListener('DOMContentLoaded', function() {
  var form = $('inputs');
  // form.addEventListener('submit', function(e) {
  form.onsubmit = function(e) { // Using GlobalEventHandler property instead of addEventListener to register callback
    e.preventDefault();

    var result;
    var first = Number($('first').value);
    var second = Number($('second').value);
    var operator = $('operator').value;
    
    if (operator === "+") {
      result = first + second;
    }
    if (operator === "-") {
      result = first - second;
    }
    if (operator === "*") {
      result = first * second;
    }
    if (operator === "/") {
      result = first / second;
    }

    $('output').textContent = result;
  };

});
