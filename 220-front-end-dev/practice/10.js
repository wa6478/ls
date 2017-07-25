document.addEventListener("DOMContentLoaded", function() {
  // Return array of word counts for every H2 element

  var subHeadings = document.querySelectorAll("h2");
  var wordCounts = [];

  for(var i = 0; i < subHeadings.length; i++) {
    var wordCount = subHeadings[i].textContent.split(" ").length;
    wordCounts.push(wordCount);
  }

  console.log(wordCounts);

  // Demonstrate 3 different ways to return a reference to the table of content div element

  var method1 = document.getElementById("toc");
  var method2 = document.querySelector("#toc");
  var method3 = document.getElementsByClassName("toc")[0];
  var method4 = document.querySelectorAll(".toc")[0];

  console.log(method1);
  console.log(method2);
  console.log(method3);
  console.log(method4);

  // Change every other link in the table of contents to green

  // var tocLinks = method1.querySelectorAll("a");
  var tocLinks = document.querySelectorAll(".toc a");

  for(var i = 0; i < tocLinks.length; i++) {
    if (i % 2 === 1) {
      tocLinks[i].style.color = "green";
    }
  }

  // Retrieve text of every thumbnail caption on the page

  var thumbCaptions = document.querySelectorAll("div .thumbcaption");
  var captionText = [];

  for (var i = 0; i < thumbCaptions.length; i++) {
    captionText.push(thumbCaptions[i].textContent.trim());
  }

  console.log(captionText);

  // You can think of the scientific classification of an animal as a series of key-value pairs. Here, the keys are taxonomic ranks (Domain, Kingdom, Phylum, etc.). The values are the specific groups to which the animal belongs.

  // Write a JavaScript function to extract this information from the web page and return an Object that uses the ranks as keys and the groups as values.

  var classifications = ["Kingdom", "Phylum", "Class", "Order", "Suborder", "Family", "Genus", "Species"];
  var rankGroup = {};
  var infoboxValues = document.querySelectorAll(".infobox td");

  console.log(infoboxValues);

  classifications.forEach(function(rank) {
    for (var i = 0; i < infoboxValues.length; i++) {
      if (infoboxValues[i].textContent.match(rank)) {
        rankGroup[rank] = infoboxValues[i + 1].textContent;
      }
    }
  });

  console.log(rankGroup);
});

