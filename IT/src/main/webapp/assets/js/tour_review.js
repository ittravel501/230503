//function changeRating(rating) {
//    // 모든 이미지를 비어있는 이미지로 초기화
//    var emptyImg = "./assets/img/avg_empty.png";
//    var avgImgs = document.querySelectorAll(".avg_wrap img");
//    for (var i = 0; i < avgImgs.length; i++) {
//      avgImgs[i].src = emptyImg;
//    }
//
//    // 클릭한 평점까지 이미지를 채움
//    var fullImg = "./assets/img/avg_full.png";
//    for (var j = 1; j <= rating; j++) {
//      var avgImg = document.querySelector(".avg" + ("0" + j).slice(-2) + " img");
//      if (avgImg) {
//        avgImg.src = fullImg;
//      }
//    }
//  }
$(document).ready(function() {
  $("#file_input").on("change", function(event) {
    var file = event.target.files[0];
    if (file) {
      var reader = new FileReader();
      reader.onload = function() {
        $("#thumbnail").attr("src", reader.result);
      };
      reader.readAsDataURL(file);
    }
  });
});
//
//function changeRating(rating) {
//    var avgInput = document.getElementById("rev_avg_input");
//    avgInput.value = rating; // 선택한 평점 값을 input 요소에 설정
//    // 이전 코드 생략
//}
//

function changeRating(rating) {
    var avgImgs = document.querySelectorAll(".avg_wrap img");
    var fullImg = "assets/img/avg_full.png";

    for (var i = 0; i < avgImgs.length; i++) {
        if (i < rating) {
            avgImgs[i].src = fullImg;
        } else {
            avgImgs[i].src = "assets/img/avg_empty.png";
        }
    }

    var avgInput = document.getElementById("rev_avg_input");
    avgInput.value = rating;
}
