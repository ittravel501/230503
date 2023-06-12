// 클라이언트 측 코드
$(".divwrap5_1").click(function() {
  $.ajax({
    url: "flight2test.jsp", // 실제 서버의 URL로 변경해야 합니다
    method: "GET",
    success: function(data) {
      // 서버로부터 받은 데이터를 처리하여 div 요소에 반영
      $(".divbottom2_2_1").html(data);
    },
    error: function() {
      console.log("오류 발생"); // 오류 처리 로직 추가
    }
  });
});


function popOpen() {

    var modalPop = $('.modal-wrap');
    var modalBg = $('.modal-bg'); 

    $(modalPop).show();
    $(modalBg).show();

}

 function popClose() {
   var modalPop = $('.modal-wrap');
   var modalBg = $('.modal-bg');

   $(modalPop).hide();
   $(modalBg).hide();

}
   
/*  function updateAirPrice(price) {
    var divbottom2_2_1 = document.querySelector('.divbottom2_2_1');
    divbottom2_2_1.textContent = price;
    
  }
*/

 /*hidden 값 가져오기*/

function updateAirPrice(price,air_deppt,air_arrpt,air_dday,air_aday,air_model,air_fligname,air_dday_time,air_aday_time,air_time_minute) {

  var divbottom2_2_1 = document.querySelector('.divbottom2_2_1');
  divbottom2_2_1.textContent = price;
	
  var hiddenInput1 = document.getElementById('selected_price');
  hiddenInput1.value = price;
  
  var hiddenInput2 = document.getElementById('air_deppt');
  hiddenInput2.value = air_deppt;
  
  var hiddenInput3 = document.getElementById('air_arrpt');
  hiddenInput3.value = air_arrpt;
  
  var hiddenInput4 = document.getElementById('air_dday');
  hiddenInput4.value = air_dday;
  
  var hiddenInput5 = document.getElementById('air_aday');
  hiddenInput5.value = air_aday;
  
  var hiddenInput6 = document.getElementById('air_model');
  hiddenInput6.value = air_model;
  
  var hiddenInput7 = document.getElementById('air_fligname');
  hiddenInput7.value = air_fligname;
  
  var hiddenInput8 = document.getElementById('air_dday_time');
  hiddenInput8.value = air_dday_time;
  
  var hiddenInput9 = document.getElementById('air_aday_time');
  hiddenInput9.value = air_aday_time;
  
   var hiddenInput10 = document.getElementById('air_time_minute');
  hiddenInput10.value = air_time_minute;

  console.log(price);
  console.log(air_deppt);
  console.log(air_arrpt);
  console.log(air_dday);
  console.log(air_aday);
  console.log(air_model);
  console.log(air_fligname);
  console.log(air_dday_time);
  console.log(air_aday_time);
  console.log(air_time_minute);
}

  


  function submitFlightForm() {
    document.getElementById('flightForm').submit();
    
        /* flightForm이라는 id를 가진 요소를 선택
     submit은 선택한 요소를 제출하는 작업을 수행해준다. 
     flightForm이라는 id를 가진 <form>을 제출하여 해당 폼의 내용을 서버로 전송하는 역할
     */
  }
  
  
 

  
  