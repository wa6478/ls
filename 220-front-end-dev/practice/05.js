document.addEventListener("DOMContentLoaded", function() {
  // Count the number of images on the page using recursive walk function to traverse the DOM

  function walk(node, callback) {
    callback(node);
    node = node.firstChild;
    while (node) {
      walk(node, callback);
      node = node.nextSibling;
    }
  }

  var imgCounter = 0;

  walk(document, function(node) {
    if (node.tagName === "IMG") {
      imgCounter++;
    }
  });

  console.log(imgCounter);

  // Count the number of images on the page using CSS selector

  console.log(document.querySelectorAll("img").length);

  // Count the number of PNG images on the page using recursive walk

  function walk2(node, callback) {
    callback(node);
    for (var i = 0; i < node.childNodes.length; i++) {
      walk2(node.childNodes[i], callback);
    }
  }

  var pngList = [];

  walk2(document, function(node) {
    if (node.tagName === "IMG") {
      if (node.getAttribute("src").slice(-3) === "png") {
        pngList.push(node);
      }
    }
  });

  console.log(pngList.length);

  // Count PNG images by stepping through an HTML collection

  var imagesOnPage = document.getElementsByTagName("IMG");
  var pngCounter = 0;

  for (var i = 0; i < imagesOnPage.length; i++) {
    if (imagesOnPage[i].getAttribute("src").match(/png$/i)) {
      pngCounter++;
    }
  }

  console.log(pngCounter);

  // Count PNG images by using forEach on the HTML collection

  pngCounter = 0

  console.log(Array.isArray(imagesOnPage)); // false
  imagesOnPage = Array.prototype.slice.call(imagesOnPage);
  console.log(Array.isArray(imagesOnPage)); // true

  imagesOnPage.forEach(function(node) {
    var extension = node.getAttribute("src").slice(-3).toLowerCase();
    if (extension === "png") {
      pngCounter++;
    }
  });

  console.log(pngCounter);

  // Change the color of every link to red

  walk(document, function(node) {
    if (node.nodeName === "A") {
      node.style.color = "red";
    }
  });


});