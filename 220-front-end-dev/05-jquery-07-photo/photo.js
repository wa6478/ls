$(function() {
  var $slideshow = $("#slideshow");
  var $nav = $slideshow.find("ul");

  $nav.on("click", "a", function(e) {
    e.preventDefault();
    var $li = $(e.currentTarget).closest("li");
    var idx = $li.index();

    // end moves back up to the original context rather than the filtered context
    // $slideshow.find("figure").filter(":visible").hide().end().eq(idx).show();


    // using fadeOut() and fadeIn() instead of hide() and show()
    $slideshow.find("figure").filter(":visible").fadeOut(300);
    $slideshow.find("figure").eq(idx).delay(300).fadeIn(300);

    $nav.find(".active").removeClass("active");
    $li.addClass("active");
  });

});