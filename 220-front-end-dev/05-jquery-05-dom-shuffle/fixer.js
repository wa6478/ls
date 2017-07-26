// $(function() {
//   var $pageHeader = $("body").children("header");
//   var $title = $("main").children("h1");
//   $pageHeader.find("nav").before($title);
//   $("main").before($pageHeader);

//   var $images = $("img");
//   var $figures = $("figure");
//   $figures.eq(0).prepend($images.eq(1));
//   $figures.eq(1).prepend($images.eq(0));
//   $("article").append($figures);
// });

// second attempt after viewing solution

$(function() {
  var $header = $("body > header");
  var $figures = $("figure");
  var $img1 = $figures.eq(0).find("img");
  var $img2 = $figures.eq(1).find("img");

  $header.prependTo("body");
  $("main > h1").prependTo($header);

  $figures.appendTo("article");
  $img1.prependTo($figures.eq(1));
  $img2.prependTo($figures.eq(0));

  console.log($header);
});