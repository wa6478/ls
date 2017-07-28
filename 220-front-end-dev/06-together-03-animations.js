// $(function() {
//   $("form").on("submit", function(e) {
//     e.preventDefault();
//     $formValues = $(this).serializeArray();

//     var properties = {
//       type: $formValues[0].value,
//       startX: $formValues[1].value,
//       startY: $formValues[2].value,
//       endX: $formValues[3].value,
//       endY: $formValues[4].value,
//       duration: Number($formValues[5].value) || 1000
//     }

//     // append new object and set variable to the new object
//     $("#canvas").append("<div>")
//     $new = $("#canvas div").eq(-1);
//     // set type
//     $new.addClass(properties.type);
//     // set starting position
//     $new.css("top", properties.startY + "px").css("left", properties.startX + "px");
//     // add properties to data attribute
//     $new.data("properties", properties);
//   });

//   $("#start").on("click", function(e) {
//     e.preventDefault();
//     $objects = $("#canvas div");
//     // finish previous animations
//     $objects.stop();
//     for (var i = 0; i < $objects.length; i++) {
//       var $object = $($objects[i]);
//       // reset position
//       $object.css("top", $object.data("properties").startY + "px").css("left", $object.data("properties").startX + "px");
//       // animate objects
//       $($object).animate({
//         left: $object.data("properties").endX,
//         top: $object.data("properties").endY
//       }, $object.data("properties").duration);
//     };
//   });

//   $("#stop").on("click", function(e) {
//     e.preventDefault();
//     $("#canvas div").stop();
//   });


// });

// refactor after reviewing solution:

$(function() {
  var $canvas = $("#canvas");

  function getFormObject($f) {
    var object = {};

    $f.serializeArray().forEach(function(property) {
      object[property.name] = property.value;
    });

    return object;
  }

  function createElement(data) {
    var $div = $("<div />", {
      "class": data.type,
      data: data,
    });

    resetElement($div);

    return $div;
  }

  function animateElement() {
    var $e = $(this);
    var data = $e.data();
    
    resetElement($e);

    $e.animate({
      top: +data.end_y,
      left: +data.end_x
    }, +data.duration);
  }

  function resetElement($e) {
    var data = $e.data();

    $e.css({
      top: +data.start_y,
      left: +data.start_x
    });
  }

  function stopAnimations() {
    $canvas.find("div").stop();
  }

  $("form").on("submit", function(e) {
    e.preventDefault();

    var $form = $(this);
    var data = getFormObject($form);

    $canvas.append(createElement(data));
  });

  $("#start").on("click", function(e) {
    e.preventDefault();

    $canvas.find("div").each(animateElement);
  });

  $("#stop").on("click", function(e) {
    e.preventDefault();

    stopAnimations();
  });

});