
//옵션창, 탭 고정==========================//
$(window).scroll(function() {
      var $wrap01H = $('.wrap01').height();// 고정 되는 가준
      var $wrap = $('#wrap');

      if ($(window).scrollTop() > $wrap01H) {
        $wrap.addClass('fixed');
      } else {
        $wrap.removeClass('fixed');
      }
    });
    $(document).ready(function(){
    });
    
    
//날짜 for문 ====================================//
    $(document).ready(function() {
    var select = $(".datepicker");

    // 5월 1일부터 31일까지 옵션 생성
    for (var day = 1; day <= 31; day++) {
      var option = $("<option></option>").text("5월 " + day + "일").val(day);
      select.append(option);
    }
  });
  
//리뷰작성 팝업 띄우기 ============================//
//  function openReviewPopup() {
//    // 팝업 창 크기와 위치 설정
//    var width = 600;
//    var height = 720;
//    var left = (window.innerWidth - width) / 2;
//    var top = (window.innerHeight - height) / 2;
//
//    // 팝업 창 열기
//    window.open("rev_review", "reviewPopup", "width=" + width + ", height=" + height + ", left=" + left + ", top=" + top);
//}
 //답글 폼 숨기기 ==========================================
$(document).ready(function() {
    // 답글 폼 숨기기
    $('.ul_qna_a').hide();

    // 답글 링크 클릭 시 답글 폼 보이기
    $('.reply-link').click(function(e) {
      e.preventDefault();
      var replyForm = $(this).parent().next('.ul_qna_a');
      if(replyForm.is(':visible')){
		  replyForm.hide();
	  } else {
		  replyForm.show();
	  }
    });
  });
  //tourlist.tour_spe가 눌일 경우
  $(document).ready(function(){
	  var tourSpe = '<c:out value="${tourlist.tour_spe}"/>'
	  if(tourSpe == null && tourSpe =='')
	  $('.prod_spe').hide();
  });
 
