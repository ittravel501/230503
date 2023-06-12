<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
    <%@page import="dto.Fli_seat_DTO"%>
    <%@page import="dao.FlightDao"%>
    <%@page import="java.util.Vector"%>
<!DOCTYPE html>
<html>
    <head> 
        <meta charset="utf-8">
        <title>가는 편 좌석 선택창</title>
        <link rel="stylesheet" href="./css/flight5.css">
        <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js">
        <link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
        <script src="//code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="//code.jquery.com/ui/1.13.0/jquery-ui.min.js"></script>
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/smoothness/jquery-ui.css">
        </script> 
          <script src="./js/flight5.js"></script>
    </head>
    <style type="text/css">
    </style>
<body>

<!-- 헤더 -->

<%
int selectedPrice2 = (Integer)request.getAttribute("selectedPrice2");
int price = (Integer)request.getAttribute("price");

int fli_seat_num = (Integer)request.getAttribute("fli_seat_num");
/* flight2test 값  */
String air_deppt1 = (String)request.getAttribute("air_deppt1");
String air_arrpt1 = (String)request.getAttribute("air_arrpt1");
String air_dday1 = (String)request.getAttribute("air_dday1");
String air_aday1 = (String)request.getAttribute("air_aday1");
String air_model1 = (String)request.getAttribute("air_model1");
String air_fligname1 = (String)request.getAttribute("air_fligname1");
String air_dday_time1 = (String)request.getAttribute("air_dday_time1");
String air_aday_time1 = (String)request.getAttribute("air_aday_time1");
int air_time_minute1 = (Integer)request.getAttribute("air_time_minute1");
/* flight3_1 값 */
String air_deppt = (String)request.getAttribute("air_deppt");
String air_arrpt = (String)request.getAttribute("air_arrpt");
String air_dday = (String)request.getAttribute("air_dday");
String air_aday = (String)request.getAttribute("air_aday");
String air_model = (String)request.getAttribute("air_model");
String air_fligname = (String)request.getAttribute("air_fligname");
String air_dday_time = (String)request.getAttribute("air_dday_time");
String air_aday_time = (String)request.getAttribute("air_aday_time");
int air_time_minute = (Integer)request.getAttribute("air_time_minute");

int hiddenSelectedPriceValue = (Integer) request.getAttribute("hiddenSelectedPriceValue");
%>

<jsp:include page="header.jsp"></jsp:include>
<form action="flightAction5_1.jsp" method="post" id="flightForm">
<!-- 운임 & 수화물  -->
<input type="hidden" id="selectedPrice2" name="selectedPrice2" value="<%= selectedPrice2 %>" />
<input type="hidden" id="price" name="price" value="<%= price %>" />
<!-- flight2test에서 가져온 값 -->
<input type="hidden" id="air_deppt1" name="air_deppt1" value="<%= air_deppt1 %>" />
<input type="hidden" id="air_arrpt1" name="air_arrpt1" value="<%= air_arrpt1 %>" />
<input type="hidden" id="air_dday1" name="air_dday1" value="<%= air_dday1 %>" />
<input type="hidden" id="air_aday1" name="air_aday1" value="<%= air_aday1 %>" />
<input type="hidden" id="air_model1" name="air_model1" value="<%= air_model1 %>" />
<input type="hidden" id="air_fligname1" name="air_fligname1" value="<%= air_fligname1 %>" />
<input type="hidden" id="air_dday_time1" name="air_dday_time1" value="<%= air_dday_time1 %>" />
<input type="hidden" id="air_aday_time1" name="air_aday_time1" value="<%= air_aday_time1 %>" />
<input type="hidden" id="air_time_minute1" name="air_time_minute1" value="<%= air_time_minute1 %>" />

<!-- flight3_1에서 가져온 값 -->
<input type="hidden" id="air_deppt" name="air_deppt" value="<%= air_deppt %>" />
<input type="hidden" id="air_arrpt" name="air_arrpt" value="<%= air_arrpt %>" />
<input type="hidden" id="air_dday" name="air_dday" value="<%= air_dday %>" />
<input type="hidden" id="air_aday" name="air_aday" value="<%= air_aday %>" />
<input type="hidden" id="air_model" name="air_model" value="<%= air_model %>" />
<input type="hidden" id="air_fligname" name="air_fligname" value="<%= air_fligname %>" />
<input type="hidden" id="air_dday_time" name="air_dday_time" value="<%= air_dday_time %>" />
<input type="hidden" id="air_aday_time" name="air_aday_time" value="<%= air_aday_time %>" />
<input type="hidden" id="air_time_minute" name="air_time_minute" value="<%= air_time_minute %>" />

<input type="hidden" id="hiddenSelectedPrice" name="hiddenSelectedPrice" value="<%= hiddenSelectedPriceValue%>">


<div class="divwrap1"> <!-- 좌석 선택 전체 배경?  -->
<div class="divwrap2"> <!-- 비행기 창과 같이 만든 부분 -->
<div class="divwrap3"> <!-- 좌석 배치  -->
<div class="divwrap4">

<%
    FlightDao fd = new FlightDao();
    Vector<Fli_seat_DTO> listseat = fd.seat();
    int columnCount = 0; // 열 카운터 변수 추가
    for (int i = 0; i < listseat.size(); i++) {
        Fli_seat_DTO fs = listseat.get(i);
        %>
        <div class="divwrap4_1">
            <div class="divwrap4_2 clicked1" onclick="handleClick(
            '<%= selectedPrice2 %>',
            '<%= price %>',
    '<%= fs.getFli_seat_num() %>',
    '<%= air_deppt1 %>',
    '<%= air_arrpt1 %>',
    '<%= air_dday1 %>',
    '<%= air_aday1 %>',
    '<%= air_model1 %>',
    '<%= air_fligname1 %>',
    '<%= air_dday_time1 %>',
    '<%= air_aday_time1 %>',
    '<%= air_time_minute1 %>',
    '<%= air_deppt %>',
    '<%= air_arrpt %>',
    '<%= air_dday %>',
    '<%= air_aday %>',
    '<%= air_model %>',
    '<%= air_fligname %>',
    '<%= air_dday_time %>',
    '<%= air_aday_time %>',
    '<%= air_time_minute %>',
    '<%= hiddenSelectedPriceValue %>'
)">
<input type="hidden" id="seatNumber" name="seatNumber" value="<%= fs.getFli_seat_num() %>">
<script type="text/javascript">
function handleClick(selectedPrice2,price,seatNumber, air_deppt1, air_arrpt1, air_dday1, air_aday1, air_model1, air_fligname1, air_dday_time1, air_aday_time1, air_time_minute1, air_deppt, air_arrpt, air_dday, air_aday, air_model, air_fligname, air_dday_time, air_aday_time, air_time_minute, sum) {
	  const resultElement = document.querySelector('.divcode');

	  // 토글 처리
	  this.classList.toggle('clicked1');
	  if (this.classList.contains('clicked1')) {
	    this.style.color = 'white';
	    this.style.backgroundColor = '#00256c';
	    var seatNumber = this.innerText.trim();
	    resultElement.innerText = seatNumber;
		
	    var hiddenInput = document.getElementById('seatNumber');
	    hiddenInput.value = seatNumber;
	    console.log("운임값");
	    console.log(selectedPrice2);
	    console.log("수화물값");
	    console.log(price);
	    
	    console.log("좌석 번호");
	    console.log(seatNumber);
	    var lugweiinput = document.getElementById('price');
	    lugweiinput.value = price;
		  var selectedPrice2input = document.getElementById('selectedPrice2').value;
		  selectedPrice2input.value = selectedPrice2;
		  
	    // flight2test 값 설정
	    var hiddenInput2_1 = document.getElementById('air_deppt1');
	    hiddenInput2_1.value = air_deppt1;

	    var hiddenInput3_1 = document.getElementById('air_arrpt1');
	    hiddenInput3_1.value = air_arrpt1;

	    var hiddenInput4_1 = document.getElementById('air_dday1');
	    hiddenInput4_1.value = air_dday1;

	    var hiddenInput5_1 = document.getElementById('air_aday1');
	    hiddenInput5_1.value = air_aday1;

	    var hiddenInput6_1 = document.getElementById('air_model1');
	    hiddenInput6_1.value = air_model1;

	    var hiddenInput7_1 = document.getElementById('air_fligname1');
	    hiddenInput7_1.value = air_fligname1;

	    var hiddenInput8_1 = document.getElementById('air_dday_time1');
	    hiddenInput8_1.value = air_dday_time1;

	    var hiddenInput9_1 = document.getElementById('air_aday_time1');
	    hiddenInput9_1.value = air_aday_time1;

	    var hiddenInput10_1 = document.getElementById('air_time_minute1');
	    hiddenInput10_1.value = air_time_minute1;

	    console.log("flight2test");
	    console.log(air_deppt1);
	    console.log(air_arrpt1);
	    console.log(air_dday1);
	    console.log(air_aday1);
	    console.log(air_model1);
	    console.log(air_fligname1);
	    console.log(air_dday_time1);
	    console.log(air_aday_time1);
	    console.log(air_time_minute1);

	    // flight3_1 값 설정
	    var hiddenInput2_2 = document.getElementById('air_deppt');
	    hiddenInput2_2.value = air_deppt;

	    var hiddenInput3_2 = document.getElementById('air_arrpt');
	    hiddenInput3_2.value = air_arrpt;

	    var hiddenInput4_2 = document.getElementById('air_dday');
	    hiddenInput4_2.value = air_dday;

	    var hiddenInput5_2 = document.getElementById('air_aday');
	    hiddenInput5_2.value = air_aday;

	    var hiddenInput6_2 = document.getElementById('air_model');
	    hiddenInput6_2.value = air_model;

	    var hiddenInput7_2 = document.getElementById('air_fligname');
	    hiddenInput7_2.value = air_fligname;

	    var hiddenInput8_2 = document.getElementById('air_dday_time');
	    hiddenInput8_2.value = air_dday_time;

	    var hiddenInput9_2 = document.getElementById('air_aday_time');
	    hiddenInput9_2.value = air_aday_time;

	    var hiddenInput10_2 = document.getElementById('air_time_minute');
	    hiddenInput10_2.value = air_time_minute;

	    console.log("flight3_1");
	    console.log(air_deppt);
	    console.log(air_arrpt);
	    console.log(air_dday);
	    console.log(air_aday);
	    console.log(air_model);
	    console.log(air_fligname);
	    console.log(air_dday_time);
	    console.log(air_aday_time);
	    console.log(air_time_minute);

	    // hiddenSelectedPrice 값 설정
	    var hiddenInput = document.getElementById('hiddenSelectedPrice');
	    hiddenInput.value = sum;
	    console.log("수화물 더한 값");
	    console.log(sum);

	  } else {
	    this.style.color = '';
	    this.style.backgroundColor = '';
	    resultElement.innerText = '';
	  }
	}

	document.addEventListener('DOMContentLoaded', function() {
	  const divwrap4_2s = document.querySelectorAll('.divwrap4_2');
	  const resultElement = document.querySelector('.divcode'); // result element

	  divwrap4_2s.forEach(function(divwrap4_2) {
	    divwrap4_2.addEventListener('click', function() {
	    	 const selectedPrice2 = '<%= selectedPrice2%>';
		      const price = '<%= price%>';
	      const seatNumber = '<%= fs.getFli_seat_num() %>';
	      const air_deppt1 = '<%= air_deppt1 %>';
	      const air_arrpt1 = '<%= air_arrpt1 %>';
	      const air_dday1 = '<%= air_dday1 %>';
	      const air_aday1 = '<%= air_aday1 %>';
	      const air_model1 = '<%= air_model1 %>';
	      const air_fligname1 = '<%= air_fligname1 %>';
	      const air_dday_time1 = '<%= air_dday_time1 %>';
	      const air_aday_time1 = '<%= air_aday_time1 %>';
	      const air_time_minute1 = '<%= air_time_minute1 %>';
	      const air_deppt = '<%= air_deppt %>';
	      const air_arrpt = '<%= air_arrpt %>';
	      const air_dday = '<%= air_dday %>';
	      const air_aday = '<%= air_aday %>';
	      const air_model = '<%= air_model %>';
	      const air_fligname = '<%= air_fligname %>';
	      const air_dday_time = '<%= air_dday_time %>';
	      const air_aday_time = '<%= air_aday_time %>';
	      const air_time_minute = '<%= air_time_minute %>';
	      const sum = '<%= hiddenSelectedPriceValue %>';

	      handleClick.call(this,selectedPrice2,price, seatNumber, air_deppt1, air_arrpt1, air_dday1, air_aday1, air_model1, air_fligname1, air_dday_time1, air_aday_time1, air_time_minute1, air_deppt, air_arrpt, air_dday, air_aday, air_model, air_fligname, air_dday_time, air_aday_time, air_time_minute, sum);
	    });
	  });
	});

	
	
</script>
                <%= fs.getFli_seat_num() %>  
            </div>
        </div>
        <% 
        columnCount++;
        if (columnCount == 4) { // 열 카운터가 4일 때 줄 바꾸기
            columnCount = 0;
            %>
            </div>
            <div class="divwrap4"> <!-- 새로운 줄 시작 -->
            <% 
        }
    }
%>

</div>
</div>
</div>
</div>
</form>
<!-- 항공창 예약 진행 하단 배너 -->
<div class="divbottom1">
<div class="divbottom2">
<div class="divbottom2_1">
<div class="divbottom2_1_1">
가는 편 좌석 코드 / 예상 결제 금액 
</div>
</div>
<div class="divbottom2_2">
<div class="divbottom2_2_1">
<div class="divcode">
</div>
 / <%= hiddenSelectedPriceValue %><!-- 나중에 값 받아서 처리 -->
</div>
<div class="divbottom2_2_2">
원
</div>
</div>
<div class="divbottom2_3" onclick="submitFlightForm();">
<script type="text/javascript">
function submitFlightForm() {
    document.getElementById('flightForm').submit();
    
        /* flightForm이라는 id를 가진 요소를 선택
     submit은 선택한 요소를 제출하는 작업을 수행해준다. 
     flightForm이라는 id를 가진 <form>을 제출하여 해당 폼의 내용을 서버로 전송하는 역할
     */
  }
</script>
<div class="divbottom2_3_1">
다음<!-- 왕복이면 오는날 비행기 조회 페이지로 보냄 -->
</div>
</div>
</div>
</div>
</body>
</html>