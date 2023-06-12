$(function() {
  $("div[class=select_area2_1]").hide();
  $("div[class=select_area2_2]").hide();

  $(".plusbutton2").click(function() {
    if ($("div[class=select_area2_1]").is(":visible")) {
      $("div[class=select_area2_2]").show();
    } else {
      $("div[class=select_area2_1]").show();
    }
  });
});
