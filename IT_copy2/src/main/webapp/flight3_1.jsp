 <%@page import="dao.BoardDao"%>
<%@page import="javax.swing.border.Border"%>
<%@page import="dao.FlightDao"%>
<%@page import="java.util.Vector"%>
<%@page import="dto.Airinfo"%>
<%@page import="java.sql.Time" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
    <head> 
        <meta charset="utf-8">
        <title>왕복 (가는날)</title>
        <link rel="stylesheet" href="./css/flight3.css">
        <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"> </script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
        <script src="//code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="//code.jquery.com/ui/1.13.0/jquery-ui.min.js"></script>
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/smoothness/jquery-ui.css">
        <script src="./js/flight3.js">
   
        </script>
		
    </head>
    <style type="text/css">
    </style>
<body>
<% 
int pageNumber = 1; // 기본 페이지, 기본적으로 페이지는 1부터 시작
if(request.getParameter("pageNumber") != null){
	// 정수형으로 타입 변경
	pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
}

	String air_arrpt = null;
	if(session.getAttribute("air_arrpt") != null){
		air_arrpt = (String)session.getAttribute("air_arrpt");
	}
	String air_deppt = null;
	if(session.getAttribute("air_deppt") != null){
		air_deppt = (String)session.getAttribute("air_deppt");
	}
	
	String air_dday = null;
	if(session.getAttribute("air_dday") != null){
		air_dday = (String)session.getAttribute("air_dday");
	}
	
	String air_aday = null;
	if(session.getAttribute("air_aday") != null){
		air_aday = (String)session.getAttribute("air_aday");
	}
	
	Time air_dday_time = null;
	if(session.getAttribute("air_dday_time") != null){
	    // 문자열로부터 Time으로 변환
	    air_dday_time = Time.valueOf((String)session.getAttribute("air_dday_time"));
	}
	
	Time air_aday_time = null;
	if(session.getAttribute("air_aday_time") != null){
	    // 문자열로부터 Time으로 변환
	    air_aday_time = Time.valueOf((String)session.getAttribute("air_aday_time"));
	}
	
	String air_model = null;
	if(session.getAttribute("air_model") != null){
		air_model = (String)session.getAttribute("air_model");
	}
	
	String air_fligname = null;
	if(session.getAttribute("air_fligname") != null){
		air_fligname = (String)session.getAttribute("air_fligname");
	}
	
/* 	int air_price = 0; // 기본 페이지, 기본적으로 페이지는 1부터 시작
	if(request.getParameter("air_price") != null){
		// 정수형으로 타입 변경
		air_price = Integer.parseInt(request.getParameter("air_price"));
	} */
	int air_time_minute; // 기본 페이지, 기본적으로 페이지는 1부터 시작
	if(request.getParameter("air_time_minute") != null){
		// 정수형으로 타입 변경
		air_time_minute = Integer.parseInt(request.getParameter("air_time_minute"));
	
	}
	
	/* 가져오는 값은 object 타입으로 반환되므로 필요에 따라 적절한 데이터 타입으로 형변환 하여 사용해야한다.   */
	int selectedPrice = (Integer) request.getAttribute("selected_price");
	String air_deppt1 = (String)request.getAttribute("air_deppt");
	String air_arrpt1 = (String)request.getAttribute("air_arrpt");
	String air_dday1 = (String)request.getAttribute("air_dday");
	String air_aday1 = (String)request.getAttribute("air_aday");
	String air_model1 = (String)request.getAttribute("air_model");
	String air_fligname1 = (String)request.getAttribute("air_fligname");
	String air_dday_time1 = (String)request.getAttribute("air_dday_time");
	String air_aday_time1 = (String)request.getAttribute("air_aday_time");
	int air_time_minute1 = (Integer)request.getAttribute("air_time_minute");
	
	
	  // 로그인 확인용 세션값
	  String mem_nick = (String)session.getAttribute("mem_nick");
      String mem_id = (String)session.getAttribute("mem_id");
%>

<!-- 헤더 -->
<jsp:include page="header.jsp"></jsp:include>
<div class="fdivwrap2" style="background-image:url('./flightimgs/flight101.png'); background-position: center top;"> <!-- 상단 배너 -->
<div class="fdivwrap2_1">
<div class="fdivwrap2_2">
<!-- 출발지 / 도착지 -->
<div class="fdivwrap2_2_1">
<div class="fdivwrap2_2_2">
<%= air_arrpt %> 
</div>
<div class="fdivwrap2_2_2">
->
</div>
<div class="fdivwrap2_2_2">
<%= air_deppt %>
</div>
</div>
<div>
</div>
</div>
<div class="fdivwrap2_3">
<!-- 기간 / 인원 -->
<div class="fdivwrap2_3_1">
<div class="fdivwrap2_3_2">
<%= air_dday %>
</div>
<div class="fdivwrap2_3_2">
~
</div>
<div class="fdivwrap2_3_2">
<%= air_aday %>
</div>
<div class="fdivwrap2_3_2">
성인1
</div>
</div>
<div class="fdivwrap2_3_3" onClick="javascript:popOpen();">
변경
</div>
</div>
       <!-- modal 영역 -->
  <div class="fmodal-bg" onClick="javascript:popClose();"></div>
  <div class="fmodal-wrap">
   <div class="fdivwrap6">
<form action="flightAction.jsp"  method="post">
<div class="fdivwrap7">
<!-- 출발지 / 도착지 선택  -->
         			<div class="fselect_area2">
         					<label class="fcome1"> 출발지 </label>
                            <select class="fselect1" name="air_deppt">
                              <option value="0" selected> 선택 </option>
                              <option value="CJU">제주</option>
                              <option value="PUS">김해/부산</option>
                              <option value="GMP">김포</option>
                              <option value="ICN">인천</option>
                              <option value="KWJ">광주</option>
                              <option value="RSU">여수</option>
                              <option value="USN">울산</option>
                              <option value="YNY">양양</option>
                              <option value="OSA">오사카</option>
                              <option value="NRT">도쿄(나리타)</option>
                              <option value="HND">도쿄(하네다)</option>
                              <option value="FUK">후쿠오카</option>
                              <option value="OKA">오키나와</option>
                              <option value="SPK">삿포로</option>
                              <option value="DAD">다낭</option>
                              <option value="BKK">방콕</option>
                              <option value="HKG">홍콩</option>
                              <option value="TPE">타이베이</option>
                              <option value="SGN">호치민시</option>
                              <option value="MNL">마닐라</option>
                              <option value="CEB">세부</option>
                              <option value="HAN">하노이</option>
                              <option value="SIN">싱가포르</option>
                              <option value="BKI">코타키나발루</option>
                              <option value="NHA">나트랑</option>
                              <option value="KUL">쿠알라룸푸르</option>
                              <option value="SHA">상하이</option>
                              <option value="TAO">청도</option>
                              <option value="CAN">광저우</option>
                              <option value="PEK">베이징</option>
                              <option value="LAX">로스앤젤레스</option>
                              <option value="HNL">하와이(호놀룰루)</option>
                              <option value="JFK">뉴욕</option>
                              <option value="YVR">밴쿠버</option>
                              <option value="SFO">샌프란시스코</option>
                              <option value="YYZ">토론토</option>
                              <option value="CDG">파리</option>
                              <option value="LHR">런던</option>
                              <option value="VVO">블라디보스토크</option>
                              <option value="FCO">로마</option>
                              <option value="PRG">프라하</option>
                              <option value="BCN">바르셀로나</option>
                              <option value="GUM">괌</option>
                              <option value="SYD">시드니</option>
                              <option value="MEL">멜버른</option>
                              <option value="BNE">브리즈번</option>
                              <option value="SPN">사이판</option>
                              <option value="AKL">오클랜드</option>
                              </select>
                              
                              <label class="fcome2" > 도착지 </label>
                              <select class="fselect2" name="air_arrpt">
                              <option value="0" selected> 선택 </option>
                              <option value="CJU">제주</option>
                              <option value="PUS">김해/부산</option>
                              <option value="GMP">김포</option>
                              <option value="ICN">인천</option>
                              <option value="KWJ">광주</option>
                              <option value="RSU">여수</option>
                              <option value="USN">울산</option>
                              <option value="YNY">양양</option>
                              <option value="OSA">오사카</option>
                              <option value="NRT">도쿄(나리타)</option>
                              <option value="HND">도쿄(하네다)</option>
                              <option value="FUK">후쿠오카</option>
                              <option value="OKA">오키나와</option>
                              <option value="SPK">삿포로</option>
                              <option value="DAD">다낭</option>
                              <option value="BKK">방콕</option>
                              <option value="HKG">홍콩</option>
                              <option value="TPE">타이베이</option>
                              <option value="SGN">호치민시</option>
                              <option value="MNL">마닐라</option>
                              <option value="CEB">세부</option>
                              <option value="HAN">하노이</option>
                              <option value="SIN">싱가포르</option>
                              <option value="BKI">코타키나발루</option>
                              <option value="NHA">나트랑</option>
                              <option value="KUL">쿠알라룸푸르</option>
                              <option value="SHA">상하이</option>
                              <option value="TAO">청도</option>
                              <option value="CAN">광저우</option>
                              <option value="PEK">베이징</option>
                              <option value="LAX">로스앤젤레스</option>
                              <option value="HNL">하와이(호놀룰루)</option>
                              <option value="JFK">뉴욕</option>
                              <option value="YVR">밴쿠버</option>
                              <option value="SFO">샌프란시스코</option>
                              <option value="YYZ">토론토</option>
                              <option value="CDG">파리</option>
                              <option value="LHR">런던</option>
                              <option value="VVO">블라디보스토크</option>
                              <option value="FCO">로마</option>
                              <option value="PRG">프라하</option>
                              <option value="BCN">바르셀로나</option>
                              <option value="GUM">괌</option>
                              <option value="SYD">시드니</option>
                              <option value="MEL">멜버른</option>
                              <option value="BNE">브리즈번</option>
                              <option value="SPN">사이판</option>
                              <option value="AKL">오클랜드</option>
                              </select>
                              
                          
                            </div>
                              <div class="fselect_area2">
                              <label class="fcome1"> 가는날</label>
                              <input type="date" class="fdate1" name="air_dday">
              
                               <label class="come3"> 오는날</label>
                              <input type="date" class="fdate2" name="air_aday">
                           
                            </div> 
 
                            <!-- 인원선택  -->
                             <div class="fselect_area2">
                              <label > 탑승 인원 </label>
                              <select class="fpersonwrap1">
                              <option value="0" selected> 성인</option>
                              <option value="성인1"> 성인 1명</option>
                              <option value="성인2"> 성인 2명 </option>
                              <option value="성인3"> 성인 3명 </option>
                              <option value="성인4"> 성인 4명</option>
                              <option value="성인5"> 성인 5명 </option>
                              <option value="성인6"> 성인 6명 </option>
                              <option value="성인7"> 성인 7명</option>
                              <option value="성인8"> 성인 8명 </option>
                              <option value="성인9"> 성인 9명 </option>
                      
                              </select>
                              <select class="fpersonwrap2">
                              <option value="0" selected> 소아 </option>
                              <option value="소아1"> 소아 1명</option>
                              <option value="소아2"> 소아 2명 </option>
                              <option value="소아3"> 소아 3명 </option>
                              <option value="소아4"> 소아 4명</option>
                              <option value="소아5"> 소아 5명 </option>
                              <option value="소아6"> 소아 6명 </option>
                              <option value="소아7"> 소아 7명</option>
                              <option value="소아8"> 소아 8명 </option>
                              <option value="소아9"> 소아 9명 </option>
                        
                              </select>
                              <select class="fpersonwrap2">
                              <option value="none" selected> 유아 </option>
                             <option value="유아1"> 유아 1명</option>
                              <option value="유아2"> 유아 2명 </option>
                              <option value="유아3"> 유아 3명 </option>
                              <option value="유아4"> 유아 4명</option>
                              <option value="유아5"> 유아 5명 </option>
                              <option value="유아6"> 유아 6명 </option>
                              <option value="유아7"> 유아 7명</option>
                              <option value="유아8"> 유아 8명 </option>
                              <option value="유아9"> 유아 9명 </option>
                          
                              </select>
                              <input type="submit" value="항공권 검색" >
                            </div>
</div>
</form>
</div>
        </div>
        <!-- //modal 영역 -->
</div>

</div>
<div class="fdivwrap1"> <!-- 가장 큰 틀 -->
<h2 class="fgoflight1">오는 항공편 ✈ </h2>
<form action="flightAction4.jsp" method="post" id="flightForm">
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

<!-- 상단 배너 끝  / 항공 조회표? 시작-->
 <%
 
  	
  FlightDao fd = new FlightDao();
 Vector<Airinfo> list2 = fd.getList(pageNumber); 
 int totalPrice = 0; 
 for(int i = 0; i < list2.size(); i++) {
	    Airinfo ai = list2.get(i);
	    if(ai.getAir_deppt().equals(air_arrpt) && ai.getAir_arrpt().equals(air_deppt)) {
	/*     if(air_dday == null || air_dday.isEmpty() || ai.getAir_dday().equals(air_dday)) { // air_deppt로 설정한 값만 가져옴 김포 선택하면 출발지가 김포인 것만 */
		 /* 날짜까지 포함하면 값이 안나오지만 출발지 도착지 모두 맞으면 검색이 되긴 함. */ 
		 
		 
  %>
<div class="fdivwrap3" onclick="addPrices('<%= ai.getAir_price() %>'
, '<%= air_deppt1 %>', 
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
'<%= ai.getAir_model() %>',
'<%= ai.getAir_fligname() %>',
'<%= ai.getAir_dday_time() %>',
'<%= ai.getAir_aday_time() %>',
'<%= ai.getAir_time_minute() %>')">

<div class="fdivwrap4">
<div class="fdivwrap4all">
<div class="fdivwrap4_1">
<%= ai.getAir_dday_time() %>
</div>
<div class="fdivwrap4_2">
<div class="fdivtimewrap2_1">
<div class="fdivtimewrap2">
<%
//ai.getAir_duration()는 분 단위로 저장된 소요시간 값입니다.
int duration = ai.getAir_time_minute();
int hours = duration / 60; // 시간 계산
int minutes = duration % 60; // 분 계산
%>
<%= hours %>
</div>
<div class="fdivtimewrap2">
시간
</div>
<div class="fdivtimewrap2">
<%= minutes %>
</div>
<div class="fdivtimewrap2">
분
</div>
</div>
<img src="./flightimgs/예약조회화살표.svg" >
</div>
<div class="fdivwrap4_3">
<%= ai.getAir_aday_time() %>
</div>
</div>
<div class="fdivwrap4all2">
<div class="fdivwrap4_4">
<%= ai.getAir_model() %> / <%=ai.getAir_fligname() %>

</div>

</div>
</div>
<div class="fdivwrap5" tabindex="0">
<div class="fdivwrap5_1">
<%= ai.getAir_price() %> <!-- 나중에 값 받아서 처리 -->

<%-- <input type="hidden" id="flight2_price" name="flight2_price" value="<%= ai.getAir_price() %>" /> --%>
</div>

<div class="fdivwrap5_2">
원
</div>
</div>
</div>
<!-- flight3_1에서 다음 페이지로 보낼 값  -->
 <input type="hidden" name="totalPrice" id="totalPriceInput">
 <input type="hidden" id="air_model" name="air_model" value="<%= ai.getAir_model() %>" />
<input type="hidden" id="air_fligname" name="air_fligname" value="<%= ai.getAir_fligname() %>" />
<input type="hidden" id="air_aday_time" name="air_aday_time" value="<%= ai.getAir_aday_time() %>" />
<input type="hidden" id="air_time_minute" name="air_time_minute" value="<%= ai.getAir_time_minute() %>" />
<input type="hidden" id="air_dday_time" name="air_dday_time" value="<%= ai.getAir_dday_time() %>" />
<input type="hidden" id="air_deppt" name="air_deppt" value="<%= air_deppt %>" />
<input type="hidden" id="air_arrpt" name="air_arrpt" value="<%= air_arrpt %>" />
<input type="hidden" id="air_dday" name="air_dday" value="<%= air_dday %>" />
<input type="hidden" id="air_aday" name="air_aday" value="<%= air_aday %>" />

<script>
function addPrices
(flightPrice,air_deppt1,air_arrpt1,air_dday1,air_aday1,air_model1,air_fligname1,air_dday_time1,air_aday_time1,air_time_minute1,totalPrice,
		air_deppt2,air_arrpt2,air_dday2,air_aday2,air_model2,air_fligname2,air_dday_time2,air_aday_time2,air_time_minute2) {
	  var flight2Price = parseInt(flightPrice);
	  console.log(flight2Price);
	  var selectedPrice = <%= request.getAttribute("selected_price") %>;
	  console.log(selectedPrice);
	  var totalPrice = flight2Price + selectedPrice;
	  document.getElementById('totalPrice').textContent = totalPrice;
	  document.getElementById('totalPriceInput').value = totalPrice;
	  
	  /* flight2test 값 */
	  
	  var hiddenInput2_1 = document.getElementById('air_deppt1').value;
	  hiddenInput2_1.value = air_deppt1;
	  
	  var hiddenInput3_1 = document.getElementById('air_arrpt1').value;
	  hiddenInput3_1.value = air_arrpt1;
	  
	  var hiddenInput4_1 = document.getElementById('air_dday1').value;
	  hiddenInput4_1.value = air_dday1;
	  
	  var hiddenInput5_1 = document.getElementById('air_aday1').value;
	  hiddenInput5_1.value = air_aday1;
	  
	  var hiddenInput6_1 = document.getElementById('air_model1').value;
	  hiddenInput6_1.value = air_model1;
	  
	  var hiddenInput7_1 = document.getElementById('air_fligname1').value;
	  hiddenInput7_1.value = air_fligname1;
	  
	  var hiddenInput8_1 = document.getElementById('air_dday_time1').value;
	  hiddenInput8_1.value = air_dday_time1;
	  
	  var hiddenInput9_1 = document.getElementById('air_aday_time1').value;
	  hiddenInput9_1.value = air_aday_time1;
	  
	   var hiddenInput10_1 = document.getElementById('air_time_minute1').value;
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
	  
	  
	  /* flight3_1 값 */
	  var hiddenInput1_2 = document.getElementById('totalPriceInput').value;
	  hiddenInput1_2.value = totalPrice;
	  
	  var hiddenInput2_2 = document.getElementById('air_deppt').value;
	  hiddenInput2_2.value = air_deppt2;
	  
	  var hiddenInput3_2 = document.getElementById('air_arrpt').value;
	  hiddenInput3_2.value = air_arrpt2;
	  
	  var hiddenInput4_2 = document.getElementById('air_dday').value;
	  hiddenInput4_2.value = air_dday2;
	  
	  var hiddenInput5_2 = document.getElementById('air_aday').value;
	  hiddenInput5_2.value = air_aday2;
	  
	  var hiddenInput6_2 = document.getElementById('air_model').value;
	  hiddenInput6_2.value = air_model2;
	  
	  var hiddenInput7_2 = document.getElementById('air_fligname').value;
	  hiddenInput7_2.value = air_fligname2;
	  
	  var hiddenInput8_2 = document.getElementById('air_dday_time').value;
	  hiddenInput8_2.value = air_dday_time2;
	  
	  var hiddenInput9_2 = document.getElementById('air_aday_time').value;
	  hiddenInput9_2.value = air_aday_time2;
	  
	   var hiddenInput10_2 = document.getElementById('air_time_minute').value;
	   hiddenInput10_2.value = air_time_minute2;
	   
	   console.log("flight3_1");
	  console.log(totalPrice);
	  console.log(air_deppt2);
	  console.log(air_arrpt2);
	  console.log(air_dday2);
	  console.log(air_aday2);
	  console.log(air_model2);
	  console.log(air_fligname2);
	  console.log(air_dday_time2);
	  console.log(air_aday_time2);
	  console.log(air_time_minute2);
	  
	  
	}


<%-- 
클릭된 부분의 <%= ai.getAir_price() %> 값을 onclick 이벤트 핸들러인 addPrices 함수로 전달 
function addPrices(flightPrice) 에서 flightPrice 라는 매개변수로 받아줌
그리고 해당 값을 var flight2Price = parseInt(flightPrice);에서 인식하여 처리
<%= ai.getAir_price() %> -> addPrices(<%= ai.getAir_price() %>) -> 
function addPrices(flightPrice) -> var flight2Price = parseInt(flightPrice); 이런 구조로 
값이 전달된다고 보면 된다 .

 document.getElementById('totalPriceInput').value = totalPrice;
 : totalPrice 값을 가진 변수를 totalPriceInput이라는 ID를 가진 input hidden 요소에 할당하여 값을 전달하는 역할
--%>

</script>
  <% 

/* 	    }  */
	 }
	 } %>
<div class="fdivbottom1">
<div class="fdivbottom2">
<div class="fdivbottom2_1">
<div class="fdivbottom2_1_1">
예상 결제 금액 
</div>
</div>
<div class="fdivbottom2_2">
<div>
</div>
<div class="fdivbottom2_2_1" id="totalPrice">
<%--  <%= selectedPrice%> --%>
</div>

<div class="fdivbottom2_2_2">
원
</div>
</div>

<div class="fdivbottom2_3" >
<% if(mem_nick != null){%>
<input type="submit" class="fdivbottom2_3_1" value="다음 여정" onclick="submitFlightForm();">
<%}else{%>
<input type="button" class="fdivbottom2_3_1" value="다음 여정" onclick="alert('로그인이 필요합니다.'); location.href='./login001.jsp';">
<%} %>
<!-- 다음 여정 왕복이면 오는날 비행기 조회 페이지로 보냄 -->
</div>
</div>
</div>
</form>
<%-- <!-- 푸터 -->
<jsp:include page="footer.jsp"></jsp:include> --%>
</body>
</html>