$(function() {
  $("nav a").on("click", function(e) {
    e.preventDefault();
    var $e = $(this);
    var class_name = "active";
    var idx = $e.closest("li").index();

    $e.closest("nav").find("." + class_name).removeClass(class_name);
    $e.addClass(class_name);
    $("#tabs article").hide().eq(idx).show();

    localStorage.setItem("active_nav", idx);
  });

  $(":radio").on("change", function() {
    var color = $(this).val();

    $(document.body).css({ background: color });

    localStorage.setItem("background", color);
  });

  $(window).unload(function() {
    localStorage.setItem("note", $("textarea").val());
  });

  setActiveNav(localStorage.getItem("active_nav"));
  setBackground(localStorage.getItem("background"));
  setNote(localStorage.getItem("note"));
});

function setActiveNav(idx) {
  if (idx === null) { return; }
  $("nav a").eq(idx).click(); 
}

function setBackground(color) {
  if (color === null) { return; }
  $("[value=\"" + color + "\"]").prop("checked", true).change();
}

function setNote(comment) {
  $("textarea").val(comment);
}