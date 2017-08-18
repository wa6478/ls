$(function() {
  // Starting with the document node, use the lastChild and childNodes properties to change the text color to red on the On the River heading and set its font size 48 pixels.

  document.lastChild.lastChild.childNodes[1].style.color = "red"
  document.lastChild.lastChild.childNodes[1].style.fontSize = "48px"

  // jQuery
  // $("h1").css({ color: "red", fontSize: "48px" });

  // Count and log the paragraphs on the page.

  function walk(node, callback) {
    callback(node);
    node = node.firstChild;
    while (node) {
      walk(node, callback);
      node = node.nextSibling;
    }
  }

  var count = 0;

  walk(document, function(node) {
    if (node.tagName === "P") {
      count++;
    }
  });

  console.log(count);

  // alternatively

  console.log(document.getElementsByTagName("P").length);

  //jQuery

  console.log($("p").length);

  // Retrieve the first word from each paragraph on the page and log the entire list.

  var paragraphs = document.getElementsByTagName("P");
  var firstWords = [];

  for (var i = 0; i < paragraphs.length; i++) {
    firstWords.push(paragraphs[i].textContent.trim().split(" ")[0]);
  }

  console.log(firstWords);

  // walk

  var firstWordsWalk = [];

  walk(document, function(node) {
    if (node.tagName === "P") {
      var text = node.firstChild.data.trim();
      var words = text.split(" ");
      firstWordsWalk.push(words[0]);
    }
  });

  console.log(firstWordsWalk);

  // jQuery

  var firstWordsJQuery = [];
  $("p").each(function(_, paragraph) {
    firstWordsJQuery.push($(paragraph).text().trim().split(" ")[0]);
  });

  console.log(firstWordsJQuery);


  // Add the class stanza to each paragraph except the first.

  var first = true;

  // walk(document, function(node) {
  //   if (node.nodeName === "P") {
  //     if (first) {
  //       first = false;
  //     } else {
  //       node.classList.add("stanza");
  //     }
  //   }
  // });

  // Use getElementsByTagName

  // var paras = document.getElementsByTagName("P");
  // for (var i = 0; i < paras.length; i++) {
  //   if (first) {
  //     first = false;
  //   } else {
  //     paras[i].setAttribute("class", "stanza");
  //   }
  // }

  // jQuery

  $("p").addClass("stanza");
  $("p").first().removeClass("stanza");
});


// Other ways to do document ready:

// document.addEventListener("DOMContentLoaded", function() {
//   console.log(document.body);
// });

// $(document).on("ready", function() {
//   console.log(document.body);
// });


