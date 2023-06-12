<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
    <%@ page import="dto.Airinfo" %>
     <%@page import="dto.Post"%>
    <%@page import="dao.FlightDao"%>
    <%@page import="java.util.Vector"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>여정 정보</title> 
        <link rel="stylesheet" type="text/css"  href="./css/flight_confirm1.css">
        <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script> 
        <script src="./js/flight_confirm1.js">

        </script>
    </head>
    <style type="text/css">
    </style>
<body>
<!-- 헤더 -->

<jsp:include page="header.jsp"></jsp:include>

<form action="flightConfirm1Action.jsp" method="post" id="flightForm">
<%
int selectedPrice2 = (Integer)request.getAttribute("selectedPrice2");
int price = (Integer)request.getAttribute("price");

int seatNumber = (Integer)request.getAttribute("seatNumber");

int seatNumber2 = Integer.parseInt(request.getParameter("seatNumber2"));


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
String mem_name = (String)request.getAttribute("mem_name");
%>
<!-- 운임 & 수화물  -->
<input type="hidden" id="selectedPrice2" name="selectedPrice2" value="<%= selectedPrice2 %>" />
<input type="hidden" id="price" name="price" value="<%= price %>" />

<input type="hidden" id="seatNumber" name="seatNumber" value="<%= seatNumber %>">
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
<input type="hidden" id="seatNumber2" name="seatNumber2" value="<%= seatNumber2 %>">
<div class="divwrap1"> 
<div class="divwrap2"><!-- 수하물 제목 -->
<div class="divwrap3">
여정 정보
</div>
</div>
<div class="divwrap5">
<div class="divwrap6">
<div class="divwrap7">
<div class="divwrap7_1">
<div class="divwrap7_1_1">
가는편
</div>
<div class="divwrap7_1_2">
<div class="divwrap7_1_2_1">
출발지 <%= air_deppt1 %> -> 도착지 <%= air_arrpt1 %> 
</div>
<div class="divwrap7_1_2_2">
<%= seatNumber %>,<%= air_dday1 %> , <%= air_dday_time1 %> ~ <%= air_aday_time1 %> , <%= air_model1 %>/<%= air_fligname1 %>
</div>
</div>
</div>
<div class="divwrap7_2">
<div class="divwrap7_1_1">
오는편
</div>
<div class="divwrap7_1_2">
<div class="divwrap7_1_2_1">
출발지 <%= air_arrpt %>  -> 도착지 <%= air_deppt %>
</div>
<div class="divwrap7_1_2_2">
<%= seatNumber2 %>,<%= air_aday1 %> , <%= air_dday_time %> ~ <%= air_aday_time %> , <%= air_model %>/<%= air_fligname %>
</div>
</div>
</div>
<div class="divwrap9"><!-- 승객정보 -->
<h2 class="divwrap9_1"> 승객 정보</h2>
<div class="divwrap9_2">
<!-- <div class="divwrap9_2_1">국적
<h4 class="divwrap9_2_1_1"> 국적 </h4>
<input type="text" class="divwrap9_2_1_2"  placeholder="국적을 입력해주세요.">  
 </select>
</div> -->
<%
FlightDao fd = new FlightDao();
Vector<Post> memlist = fd.meminfo(); // mem_account 테이블에서 값을 select

String mem_id = (String) session.getAttribute("mem_id"); // 세션에서 아이디 가져오기

for (Post post : memlist) {
    String accountId = post.getMem_id(); // 컬럼에서 아이디 가져오기
    
    if (mem_id != null && mem_id.equals(accountId)) {
        // 세션에 저장된 아이디와 일치하는 아이디를 찾았을 때 해당 정보를 사용
        String accountInfo = post.getMem_id();
        // 사용할 코드 작성
        String memname = post.getMem_name();
	    String lastname = memname.substring(0, 1); // 이름에서 성만 가져오도록
	    String firstname = memname.substring(1, 3); // 이름에서 이름 부분만 가져오도록
        
%>
<div class="divwrap9_2_2"><!-- 승객 성 / 이름 -->
<div class="divwrap9_2_1"><!-- 승객성 -->
<h4 class="divwrap9_2_1_1"> 승객 성 </h4>
<input type="text" class="divwrap9_2_1_2" id="lastname" name="lastname" value="<%= lastname %>">
</div>
<div class="divwrap9_2_1"><!-- 승객이름 -->
<h4 class="divwrap9_2_1_1"> 승객 이름 </h4>
<input type="text" class="divwrap9_2_1_2" id="firstname" name="firstname" value="<%= firstname %>">
</div>
</div>
<div class="divwrap9_2_2"><!-- 승객 성 / 이름 -->
<div class="divwrap9_2_1"><!-- 승객성 -->
<h4 class="divwrap9_2_1_1"> 성별 </h4>
<input type="text" class="divwrap9_2_1_2" id="memsex" name="memsex" value="<%= post.getMem_sex() %>">
</div>
<div class="divwrap9_2_1"><!-- 승객이름 -->
<h4 class="divwrap9_2_1_1"> 연락처 </h4>
<input type="text" class="divwrap9_2_1_2"  id="memmobile" name="memmobile" value="<%= post.getMem_mobile() %>">
</div>
</div>
<div class="divwrap9_2_2"><!-- 승객 성 / 이름 -->
<div class="divwrap9_2_1"><!-- 승객성 -->
<h4 class="divwrap9_2_1_1"> 생년월일 </h4>
<input type="text" class="divwrap9_2_1_2" id="membirth" name="membirth" value="<%= post.getMem_birth() %>">
</div>
<div class="divwrap9_2_1"><!-- 승객이름 -->
<h4 class="divwrap9_2_1_1"> 이메일 </h4>
<input type="text" class="divwrap9_2_1_2" id="mememail" name="mememail" value="<%= post.getMem_email()%>">
</div>
</div>
</div>
</div>
<%
break; // 일치하는 아이디를 찾았으므로 루프 종료
    }
}
%>

<script type="text/javascript">
$(document).ready(function() {
	console.log("회원정보");
	  console.log($('#lastname').val());
	  console.log($('#firstname').val());
	  console.log($('#memsex').val());
	  console.log($('#memmobile').val());
	  console.log($('#membirth').val());
	  console.log($('#mememail').val());
	  console.log("가는 좌석");
	  console.log($('#seatNumber').val());
	  console.log("오는 좌석");
	  console.log($('#seatNumber2').val());
	  console.log("수화물 / 운임");
	  console.log($('#price').val());
	  console.log($('#selectedPrice2').val());
	  console.log("가는편 선택 항목");
	  console.log($('#air_deppt1').val());
	  console.log($('#air_arrpt1').val());
	  console.log($('#air_dday1').val());
	  console.log($('#air_aday1').val());
	  console.log($('#air_model1').val());
	  console.log($('#air_fligname1').val());
	  console.log($('#air_dday_time1').val());
	  console.log($('#air_aday_time1').val());
	  console.log($('#air_time_minute1').val());
	  console.log("오는편 선택 항목");
	  console.log($('#air_deppt').val());
	  console.log($('#air_arrpt').val());
	  console.log($('#air_dday').val());
	  console.log($('#air_aday').val());
	  console.log($('#air_model').val());
	  console.log($('#air_fligname').val());
	  console.log($('#air_dday_time').val());
	  console.log($('#air_aday_time').val());
	  console.log($('#air_time_minute').val());
	  console.log("총액");
	  console.log($('#hiddenSelectedPrice').val());
	});

</script>
<div class="divwrap10"><!-- 결제 -->
<h2 class="divwrap9_1"> 결제 </h2>
<div class="divwrap10_1">
<div class="divwrap11_1">
<input type="checkbox" id="myCheckbox" class="divwrap11_1_1 checkboxall">
<label for="myCheckbox"> 신용/체크카드 </label>
</div>
<!-- <div class="divwrap10_1_1">
<div class="divwrap10_1_1_1">
신용 / 체크 카드
</div>
<div class="divwrap10_1_1_1">
휴대폰 결제
</div>
</div>
<div class="divwrap10_1_1">
<div class="divwrap10_1_1_1">
네이버 페이
</div>
<div class="divwrap10_1_1_1">
카카오 페이
</div>
</div> -->
</div>
</div>

<div class="divwrap10"><!-- 동의 -->
<h2 class="divwrap9_1"> 확인 및 동의 </h2>
<div class="divwrap11">
<div class="divwrap11_1">
<input type="checkbox" id="myCheckbox" class="divwrap11_1_1 checkboxall">
<label for="myCheckbox">[필수] 운송약관 새 창 열림, 운임 규정, 수하물 규정 새 창 열림을 확인하였으며 이에 동의합니다.<br>
대한항공 항공권을 구매하시는 것은 본 항공사와 운송계약 체결에 동의하는 것으로 운임규정은 항공권 변경, 취소 등에 따른 수수료와 사전좌석배정, 좌석승급 등 구매하는 항공권 운임에 적용되는 세부 조건을 기재하고 있으며, 운송 약관은 운송 계약 체결에 따른 계약조건을 명시합니다.<br>
대한항공은 '항공교통이용자 보호기준'에 따라 항공교통이용자 서비스 계획 새 창 열림을 게시합니다. </label>
</div>
<div class="divwrap11_2">
<input type="checkbox" id="myCheckbox2" class="divwrap11_1_1 checkboxall">
<label for="myCheckbox2">
[필수] 위험품 안내를 확인하였습니다.<br>
고객 안전을 위하여 항공기 내부로 반입이 금지된 폭발성, 인화성, 유독성 물질 및 무기로 사용될 수 있는 품목에 대한 안내 사항 입니다.</label>
</div>
</div>
</div>



</div>
<div class="divwrap8">

<div class="divwrap8_1">
<div class="divwrap8_1_1">
<h2 class="divwrap8_1_2"> 항공 운송료</h2>
<div class="divwrap8_1_3">
<h3 class="divwrap8_1_6"> 운임 </h3>
<div class="divwrap8_1_6_1">
<div class="divwrap8_1_6_2">
<%= selectedPrice2 %>
</div>
<div class="divwrap8_1_6_2">
원
</div>
</div>
</div>
<div class="divwrap8_1_4">
<h3 class="divwrap8_1_6"> 수하물 </h3>
<div class="divwrap8_1_6_1">
<div class="divwrap8_1_6_2">
<%= price %>
</div>
<div class="divwrap8_1_6_2">
원
</div>
</div>
</div>
<div class="divwrap8_1_5">
<h2 class="divwrap8_1_7"> 총액 </h2>
<div class="divwrap8_1_8_1">
<div class="divwrap8_1_8">
<%= hiddenSelectedPriceValue %>
</div>
<div class="divwrap8_1_8">
원
</div>
</div>
</div>
</div>
</div>

</div>
</div>
</div> 
</div> 
</div>
</div>
</form>
<div class="divbottom1">
<div class="divbottom2">
<div class="divbottom2_1">
<div class="divbottom2_1_1">
예상 결제 금액 
</div>
</div>
<div class="divbottom2_2">
<div>
</div>
<div class="divbottom2_2_1">
<%= hiddenSelectedPriceValue %> <!-- 나중에 값 받아서 처리 -->
</div>
<div class="divbottom2_2_2">
원
</div>
</div>
<div class="divbottom2_3">
<div class="divbottom2_3_1">
결제 <!-- 왕복이면 오는날 비행기 조회 페이지로 보냄 -->
</div>
<script type="text/javascript">
document.querySelector(".divbottom2_3").addEventListener("click", function(event) {
	  var checkbox = document.querySelector(".checkboxall");
	  
	  if (!checkbox.checked) {
	    event.preventDefault();
	    alert("체크박스를 체크해주세요.");
	  } else {
	    submitFlightForm(); // 체크박스가 체크되었을 때에만 submitFlightForm() 함수 실행
	  }
	});

	function submitFlightForm() {
	  document.getElementById('flightForm').submit();
	}

</script>
</div>
</div>
</div>
</body>
</html>