$(function(){
    var $slider = $('.slider'),
        $firstSlide = $slider.find('li').first() // 첫번째 슬라이드
        .stop(true).animate({'opacity':1},200); // 첫번째 슬라이드만 보이게 하기
  
    function PrevSlide(){ // 이전버튼 함수
      stopSlide();startSlide(); //타이머 초기화
      var $lastSlide = $slider.find('li').last() //마지막 슬라이드 
      .prependTo($slider); //마지막 슬라이드를 맨 앞으로 보내기  
      $secondSlide = $slider.find('li').eq(1)//두 번째 슬라이드 구하기
      .stop(true).animate({'opacity':0},400); //밀려난 두 번째 슬라이드는 fadeOut 시키고
      $firstSlide = $slider.find('li').first() //맨 처음 슬라이드 다시 구하기
      .stop(true).animate({'opacity':1},400);//새로 들어온 첫 번째 슬라이드는 fadeIn 시키기
    }
    
    function NextSlide(){ // 다음 버튼 함수
      stopSlide();startSlide(); //타이머 초기화
      $firstSlide = $slider.find('li').first() // 첫 번째 슬라이드
      .appendTo($slider); // 맨 마지막으로 보내기
      var $lastSlide = $slider.find('li').last() // 맨 마지막으로 보낸 슬라이드
      .stop(true).animate({'opacity':0},400); // fadeOut시키기
      $firstSlide = $slider.find('li').first()// 맨 처음 슬라이드
      .stop(true).animate({'opacity':1},400);// fadeIn 시키기
    }
    
    $('#next').on('click', function(){ //다음버튼 클릭
      NextSlide();
    });
    $('#prev').on('click', function(){ //이전 버튼 클릭
      PrevSlide();
    });
  
    startSlide(); // 자동 슬라이드 시작
    
    var theInterval;
  
    function startSlide() {
      theInterval = setInterval(NextSlide, 5000); //자동 슬라이드 설정
    }
  
    function stopSlide() { //자동 멈추기
      clearInterval(theInterval);
    }
    
    $('.slider').hover(function(){ //마우스 오버시 슬라이드 멈춤
      stopSlide();
    }, function (){
      startSlide();
    });
  });

  $( document ).ready( function() {

    $('.center').slick({

       autoplay: true,
       autoplaySpeed: 2000,
        centerMode: true,
        centerPadding: '60px',
        slidesToShow: 3,
        responsive: [
          {
            breakpoint: 768,
            settings: {
              arrows: false,
              centerMode: true,
              centerPadding: '40px',
              slidesToShow: 3
            }
          },
          {
            breakpoint: 480,
            settings: {
              arrows: false,
              centerMode: true,
              centerPadding: '40px',
              slidesToShow: 1
            }
          }
        ]

      
      });


      
     
    } );

    function searchToggle(obj, evt){
      var container = $(obj).closest('.search-wrapper');
          if(!container.hasClass('active')){
              container.addClass('active');
              evt.preventDefault();
          }
          else if(container.hasClass('active') && $(obj).closest('.input-holder').length == 0){
              container.removeClass('active');
              // clear input
              container.find('.search-input').val('');
          }
  };


  $(function(){
    $("div[class=menuwrap2]").hide();
    $("div[class=menuwrap4]").hide();
    $("div[class=menuwrap6]").hide();
    $("div[class=menuwrap8]").hide();
    $("div[class=menuwrap10]").hide();
    $("div[class=menuwrap12]").hide();
    $("div[class=menuwrap14]").hide();
    $("div[class=menuwrap16]").hide();
    $("div[class=mainflightdiv3]").hide();
    $("div[class=mainflightdiv2_1]").hide();
    $("div[class=mainflightdiv2_2]").hide();
    $("div[class=mainflightdiv3_1]").hide();
    $("div[class=mainflightdiv3_2]").hide();
    $("div[class=mainflightdiv4]").hide();
    $("div[class=mainflightdiv4_1]").hide();
    $("div[class=mainflightdiv4_2]").hide();
    $("div[class=mainflightdiv5]").hide();
    $("div[class=mainflightdiv5_1]").hide();
    $("div[class=mainflightdiv5_2]").hide();


    $(".menulist1").click(function(){
      $("div[class=menuwrap4]").hide();
      $("div[class=menuwrap6]").hide();
      $("div[class=menuwrap8]").hide();
      $("div[class=menuwrap10]").hide();
      $("div[class=menuwrap12]").hide();
      $("div[class=menuwrap14]").hide();
      $("div[class=menuwrap16]").hide();
        $("div[class=menuwrap2]").slideDown(500);
       
    });
    
    $(".menulist2").click(function(){
      $("div[class=menuwrap2]").hide();
      $("div[class=menuwrap6]").hide();
      $("div[class=menuwrap8]").hide();
      $("div[class=menuwrap10]").hide();
      $("div[class=menuwrap12]").hide();
      $("div[class=menuwrap14]").hide();
      $("div[class=menuwrap16]").hide();
      $("div[class=menuwrap4]").slideDown(500);
      
  });

  $(".menulist3").click(function(){
    $("div[class=menuwrap2]").hide();
    $("div[class=menuwrap4]").hide();
    $("div[class=menuwrap8]").hide();
    $("div[class=menuwrap10]").hide();
    $("div[class=menuwrap12]").hide();
    $("div[class=menuwrap14]").hide();
    $("div[class=menuwrap16]").hide();
    $("div[class=menuwrap6]").slideDown(500);
    
});

$(".menulist4").click(function(){
  $("div[class=menuwrap2]").hide();
  $("div[class=menuwrap4]").hide();
  $("div[class=menuwrap6]").hide();
  $("div[class=menuwrap10]").hide();
  $("div[class=menuwrap12]").hide();
  $("div[class=menuwrap14]").hide();
  $("div[class=menuwrap16]").hide();
  $("div[class=menuwrap8]").slideDown(500);
  
});

$(".menulist5").click(function(){
  $("div[class=menuwrap2]").hide();
  $("div[class=menuwrap4]").hide();
  $("div[class=menuwrap6]").hide();
  $("div[class=menuwrap8]").hide();
  $("div[class=menuwrap12]").hide();
  $("div[class=menuwrap14]").hide();
  $("div[class=menuwrap16]").hide();
  $("div[class=menuwrap10]").slideDown(500);
  
});

$(".menulist6").click(function(){
  $("div[class=menuwrap2]").hide();
  $("div[class=menuwrap4]").hide();
  $("div[class=menuwrap6]").hide();
  $("div[class=menuwrap8]").hide();
  $("div[class=menuwrap10]").hide();
  $("div[class=menuwrap14]").hide();
  $("div[class=menuwrap16]").hide();
  $("div[class=menuwrap12]").slideDown(500);
  
});

$(".menulist7").click(function(){
  $("div[class=menuwrap2]").hide();
  $("div[class=menuwrap4]").hide();
  $("div[class=menuwrap6]").hide();
  $("div[class=menuwrap8]").hide();
  $("div[class=menuwrap10]").hide();
  $("div[class=menuwrap12]").hide();
  $("div[class=menuwrap16]").hide();
  $("div[class=menuwrap14]").slideDown(500);
  
});

$(".menulist8").click(function(){
  $("div[class=menuwrap2]").hide();
  $("div[class=menuwrap4]").hide();
  $("div[class=menuwrap6]").hide();
  $("div[class=menuwrap8]").hide();
  $("div[class=menuwrap10]").hide();
  $("div[class=menuwrap12]").hide();
  $("div[class=menuwrap14]").hide();
  $("div[class=menuwrap16]").slideDown(500);
  
});

$("input[class=air1]").click(function(){

  $("div[class=mainflightdiv3]").show();
  $("div[class=mainflightdiv3_1]").hide();
  $("div[class=mainflightdiv3_2]").hide();
  $("div[class=mainflightdiv4]").hide();
  $("div[class=mainflightdiv4_1]").hide();
  $("div[class=mainflightdiv4_2]").hide();
  $("div[class=mainflightdiv5]").hide();
  $("div[class=mainflightdiv5_1]").hide();
  $("div[class=mainflightdiv5_2]").hide();
  
});

$("input[class=air4]").click(function(){

  $("div[class=mainflightdiv3]").hide();
  $("div[class=mainflightdiv3_1]").show();
  $("div[class=mainflightdiv3_2]").hide();
  $("div[class=mainflightdiv4]").hide();
  $("div[class=mainflightdiv4_1]").hide();
  $("div[class=mainflightdiv4_2]").hide();
  $("div[class=mainflightdiv5]").hide();
  $("div[class=mainflightdiv5_1]").hide();
  $("div[class=mainflightdiv5_2]").hide();
  
});


$("input[class=air7]").click(function(){

  $("div[class=mainflightdiv3]").hide();
  $("div[class=mainflightdiv3_1]").hide();
  $("div[class=mainflightdiv3_2]").show();
  $("div[class=mainflightdiv4]").hide();
  $("div[class=mainflightdiv4_1]").hide();
  $("div[class=mainflightdiv4_2]").hide();
  $("div[class=mainflightdiv5]").hide();
  $("div[class=mainflightdiv5_1]").hide();
  $("div[class=mainflightdiv5_2]").hide();
  
});

$("input[class=air2]").click(function(){

  $("div[class=mainflightdiv4]").show();
  $("div[class=mainflightdiv3]").hide();
  $("div[class=mainflightdiv3_1]").hide();
  $("div[class=mainflightdiv3_2]").hide();
  $("div[class=mainflightdiv4_1]").hide();
  $("div[class=mainflightdiv4_2]").hide();
  $("div[class=mainflightdiv5]").hide();
  $("div[class=mainflightdiv5_1]").hide();
  $("div[class=mainflightdiv5_2]").hide();
});

$("input[class=air5]").click(function(){

  $("div[class=mainflightdiv4]").hide();
  $("div[class=mainflightdiv3]").hide();
  $("div[class=mainflightdiv3_1]").hide();
  $("div[class=mainflightdiv3_2]").hide();
  $("div[class=mainflightdiv4_1]").show();
  $("div[class=mainflightdiv4_2]").hide();
  $("div[class=mainflightdiv5]").hide();
  $("div[class=mainflightdiv5_1]").hide();
  $("div[class=mainflightdiv5_2]").hide();
});

$("input[class=air8]").click(function(){

  $("div[class=mainflightdiv4]").hide();
  $("div[class=mainflightdiv3]").hide();
  $("div[class=mainflightdiv3_1]").hide();
  $("div[class=mainflightdiv3_2]").hide();
  $("div[class=mainflightdiv4_1]").hide();
  $("div[class=mainflightdiv4_2]").show();
  $("div[class=mainflightdiv5]").hide();
  $("div[class=mainflightdiv5_1]").hide();
  $("div[class=mainflightdiv5_2]").hide();
});

$("input[class=air3]").click(function(){

  $("div[class=mainflightdiv5]").show();
  $("div[class=mainflightdiv3]").hide();
  $("div[class=mainflightdiv3_1]").hide();
  $("div[class=mainflightdiv3_2]").hide();
  $("div[class=mainflightdiv4]").hide();
  $("div[class=mainflightdiv4_1]").hide();
  $("div[class=mainflightdiv4_2]").hide();

  $("div[class=mainflightdiv5_1]").hide();
  $("div[class=mainflightdiv5_2]").hide();
});

$("input[class=air6]").click(function(){

  $("div[class=mainflightdiv5]").hide();
  $("div[class=mainflightdiv3]").hide();
  $("div[class=mainflightdiv3_1]").hide();
  $("div[class=mainflightdiv3_2]").hide();
  $("div[class=mainflightdiv4]").hide();
  $("div[class=mainflightdiv4_1]").hide();
  $("div[class=mainflightdiv4_2]").hide();

  $("div[class=mainflightdiv5_1]").show();
  $("div[class=mainflightdiv5_2]").hide();
});

$("input[class=air9]").click(function(){

  $("div[class=mainflightdiv5]").hide();
  $("div[class=mainflightdiv3]").hide();
  $("div[class=mainflightdiv3_1]").hide();
  $("div[class=mainflightdiv3_2]").hide();
  $("div[class=mainflightdiv4]").hide();
  $("div[class=mainflightdiv4_1]").hide();
  $("div[class=mainflightdiv4_2]").hide();

  $("div[class=mainflightdiv5_1]").hide();
  $("div[class=mainflightdiv5_2]").show();
});


$("img[name=close]").click(function(){

  $("div[class=mainflightdiv3]").hide();
  $("div[class=mainflightdiv3_1]").hide();
  $("div[class=mainflightdiv3_2]").hide();
  $("div[class=mainflightdiv4]").hide();
  $("div[class=mainflightdiv4_1]").hide();
  $("div[class=mainflightdiv4_2]").hide();
  $("div[class=mainflightdiv5]").hide();
  $("div[class=mainflightdiv5_1]").hide();
  $("div[class=mainflightdiv5_2]").hide();
});

// $("div[class=mainflightdiv6]").hide();

$(".cl1").click(function(){

  $("label[class=come3]").show();
    $("input[class=date2]").show();
 
});


$(".cl2").click(function(){

    $("label[class=come3]").hide();
    $("input[class=date2]").hide();
});

// $(".cl3").click(function(){

//   $("div[class=mainflightdiv2]").hide();
//   $("div[class=mainflightdiv2_1]").hide();
//   $("div[class=mainflightdiv2_2]").show();
//   $("div[class=centerdiv1]").css('margin-top','350px');
 
// });

 
    $("div[class=menuwrap2]").mouseleave(function(){
        $("div[class=menuwrap2]").slideUp(800);
    });

    $("div[class=menuwrap4]").mouseleave(function(){
      $("div[class=menuwrap4]").slideUp(800);
  });
  $("div[class=menuwrap6]").mouseleave(function(){
    $("div[class=menuwrap6]").slideUp(800);
});

$("div[class=menuwrap8]").mouseleave(function(){
  $("div[class=menuwrap8]").slideUp(800);
});

$("div[class=menuwrap10]").mouseleave(function(){
  $("div[class=menuwrap10]").slideUp(800);
});

$("div[class=menuwrap12]").mouseleave(function(){
  $("div[class=menuwrap12]").slideUp(800);
});

$("div[class=menuwrap14]").mouseleave(function(){
  $("div[class=menuwrap14]").slideUp(800);
});

$("div[class=menuwrap16]").mouseleave(function(){
  $("div[class=menuwrap16]").slideUp(800);
});

});
  

$(document).on('mouseenter', '.menu', function(e){
  //e.preventDefault();  
$(this).css('border-bottom', '4px solid rgba(188, 219, 254, 0.55)');
$(this).css('color', 'rgb(51, 51, 51)');
 $('.menu').not($(this)).css('border-bottom', 'none');
 $('.menu').not($(this)).css('color', 'black');
});

$(document).on('mouseenter', '.go1, .go2 ,.go3', function(e){
  //e.preventDefault();  
$(this).css('background-color', '#D4F4FA');
$(this).css('color', 'rgb(51, 51, 51)');
 $('.go1 ,.go2 ,.go3').not($(this)).css('background-color', 'white');
 $('.go1 ,.go2 ,.go3').not($(this)).css('color', 'black');
});




// $(document).on('click', 'input[placeholder=김포]', function(e){
//   //e.preventDefault();  

// });


$(document).ready(function(){
						   

	//----------Select the first tab and div by default
	
	$('#vertical_tab_nav > ul > li > a').eq(0).addClass( "selected" );
	$('#vertical_tab_nav > div > article').eq(0).css('display','block');


	//---------- This assigns an onclick event to each tab link("a" tag) and passes a parameter to the showHideTab() function
			
		$('#vertical_tab_nav > ul').click(function(e){
			
      if($(e.target).is("a")){
      
        /*Handle Tab Nav*/
        $('#vertical_tab_nav > ul > li > a').removeClass( "selected");
        $(e.target).addClass( "selected");
        
        /*Handles Tab Content*/
        var clicked_index = $("a",this).index(e.target);
        $('#vertical_tab_nav > div > article').css('display','none');
        $('#vertical_tab_nav > div > article').eq(clicked_index).fadeIn();
        
      }
      
        $(this).blur();
        return false;
      
		});
		
	 
});//end ready.



$(document).ready(function(){
						   

	//----------Select the first tab and div by default
	
	$('#vertical_tab_nav1 > ul > li > a').eq(0).addClass( "selected1" );
	$('#vertical_tab_nav1 > div > article').eq(0).css('display','block');


	//---------- This assigns an onclick event to each tab link("a" tag) and passes a parameter to the showHideTab() function
			
		$('#vertical_tab_nav1 > ul').click(function(e){
			
      if($(e.target).is("a")){
      
        /*Handle Tab Nav*/
        $('#vertical_tab_nav1 > ul > li > a').removeClass( "selected1");
        $(e.target).addClass( "selected1");
        
        /*Handles Tab Content*/
        var clicked_index = $("a",this).index(e.target);
        $('#vertical_tab_nav1 > div > article').css('display','none');
        $('#vertical_tab_nav1 > div > article').eq(clicked_index).fadeIn();
        
      }
      
        $(this).blur();
        return false;
      
		});
		
	 
});//end ready


$(document).ready(function(){
  // 오늘 날짜를 구합니다.
  var today = new Date();
  // 내일 날짜를 계산합니다.
  var tomorrow = new Date(today);
  tomorrow.setDate(tomorrow.getDate() + 1);
  // 내일 날짜를 yyyy-mm-dd 형식의 문자열로 변환합니다.
  var tomorrowStr = tomorrow.toISOString().slice(0, 10);
  
  var after30Days = new Date(tomorrow);
	after30Days.setDate(after30Days.getDate() + 30);
var after30DaysStr = after30Days.toISOString().slice(0, 10);

  $('.country1').click(function() {
    sendData('ICN', 'JFK', tomorrowStr,after30DaysStr);
  });

  $('.country2').click(function() {
    sendData('ICN', 'BKK', tomorrowStr,after30DaysStr);
  });
  
  $('.country3').click(function() {
    sendData('ICN', 'HNL', tomorrowStr,after30DaysStr);
  });
  
  $('.country4').click(function() {
    sendData('ICN', 'CDG', tomorrowStr,after30DaysStr);
  });
  
  $('.country5').click(function() {
    sendData('GMP', 'CJU', tomorrowStr,after30DaysStr);
  });
  
  $('.country6').click(function() {
    sendData('GMP', 'PUS', tomorrowStr,after30DaysStr);
  });
  
  $('.country7').click(function() {
    sendData('YNY', 'CJU', tomorrowStr,after30DaysStr);
  });
  
  $('.country8').click(function() {
    sendData('RSU', 'GMP', tomorrowStr,after30DaysStr);
  });

  function sendData(air_deppt, air_arrpt, air_dday, air_aday) {
    var xhr = new XMLHttpRequest();
    var url = "flightAction2.jsp"; // 전송할 페이지 URL
    var params = "air_deppt=" + air_deppt + "&air_arrpt=" + air_arrpt + "&air_dday=" + air_dday + "&air_aday=" + air_aday; // 전송할 매개변수
    xhr.open("POST", url, true);

    // 헤더 설정
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

    // 전송 완료 시 처리
    xhr.onreadystatechange = function() {
      if (xhr.readyState == 4 && xhr.status == 200) {
        // 전송 완료 후 처리할 내용 작성
      }
    }

    xhr.send(params); // 전송
  }
   
});


function checkForm() {
  var come1 = document.querySelector('.come1').value;
  var come2 = document.querySelector('.come2').value;
  var date1 = document.querySelector('.date1').value;
  var date2 = document.querySelector('.date2').value;
  var adult = document.querySelector('.personwrap1').value;
  var child = document.querySelector('.personwrap2').value;
  
  if (date1 === '' || date2 === '' || come1 === '' || come2 === '' || (child !== '0' && adult === '0')) {
    alert('정보를 모두 선택해주세요.');
    return false;
  }
  
  return true;
}

