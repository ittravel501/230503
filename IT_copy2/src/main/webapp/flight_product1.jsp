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
        <link rel="stylesheet" href="./css/flight2.css">
        <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"> </script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
        <script src="//code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="//code.jquery.com/ui/1.13.0/jquery-ui.min.js"></script>
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/smoothness/jquery-ui.css">
        <script src="./slick-1.8.1/slick/slick.min.js">
        </script>
        <script src="./js/flight2.js">

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
	
	int air_price = 0; // 기본 페이지, 기본적으로 페이지는 1부터 시작
	if(request.getParameter("air_price") != null){
		// 정수형으로 타입 변경
		air_price = Integer.parseInt(request.getParameter("air_price"));
	}
	int air_time_minute; // 기본 페이지, 기본적으로 페이지는 1부터 시작
	if(request.getParameter("air_time_minute") != null){
		// 정수형으로 타입 변경
		air_time_minute = Integer.parseInt(request.getParameter("air_time_minute"));
	
	}
%>
<!-- 헤더 -->
<jsp:include page="header.jsp"></jsp:include>
<div class="divwrap2" style="background-image:url('./flightimgs/flight101.png'); background-position: center top;"> <!-- 상단 배너 -->
<div class="divwrap2_1">
<div class="divwrap2_2">
<!-- 출발지 / 도착지 -->
<div class="divwrap2_2_1">
<div class="divwrap2_2_2">
<%= air_deppt %>
</div>
<div class="divwrap2_2_2">
->
</div>
<div class="divwrap2_2_2">
<%= air_arrpt %>
</div>
</div>
<div>
</div>
</div>
<div class="divwrap2_3">
<!-- 기간 / 인원 -->
<div class="divwrap2_3_1">
<div class="divwrap2_3_2">
<%= air_dday %>
</div>
<div class="divwrap2_3_2">
~
</div>
<div class="divwrap2_3_2">
<%= air_aday %>
</div>
<div class="divwrap2_3_2">
성인1
</div>
</div>
<div class="divwrap2_3_3" onClick="javascript:popOpen();">
변경
</div>

</div>
<!-- 항공편 -->
        <!-- modal 영역 -->
  <div class="modal-bg" onClick="javascript:popClose();"></div>
  <div class="modal-wrap">
   <div class="divwrap6">
<form action="flightAction.jsp"  method="post">
<div class="divwrap7">
<!-- 출발지 / 도착지 선택  -->
         			<div class="select_area2">
         					<label class="come1"> 출발지 </label>
                            <select class="select1" name="air_deppt">
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
                              
                              <label class="come2" > 도착지 </label>
                              <select class="select2" name="air_arrpt">
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
                              <div class="select_area2">
                              <label class="come1"> 가는날</label>
                              <input type="date" class="date1" name="air_dday">
              
                               <label class="come3"> 오는날</label>
                              <input type="date" class="date2" name="air_aday">
                           
                            </div> 
 
                            <!-- 인원선택  -->
                             <div class="select_area2">
                              <label > 탑승 인원 </label>
                              <select class="personwrap1">
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
                              <select class="personwrap2">
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
                              <select class="personwrap2">
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
<div class="divwrap1"> <!-- 가장 큰 틀 -->
<h2 class="goflight1">가는 항공편 ✈ </h2>
<!-- 상단 배너 끝  / 항공 조회표? 시작-->
 <%
 
  	
  FlightDao fd = new FlightDao();
	  Vector<Airinfo> list1 = fd.getList(pageNumber);    
for(int i = 0; i < list1.size(); i++){
	Airinfo ai = list1.get(i);
	
	if(ai.getAir_deppt().equals(air_deppt) && ai.getAir_arrpt().equals(air_arrpt)) {
	   /*    if(air_dday == null || air_dday.isEmpty() || ai.getAir_dday().equals(air_dday)) { */  // air_deppt로 설정한 값만 가져옴 김포 선택하면 출발지가 김포인 것만 */
		 /* 날짜까지 포함하면 값이 안나오지만 출발지 도착지 모두 맞으면 검색이 되긴 함. */ 
  %>
<div class="divwrap3">
<div class="divwrap4">
<div class="divwrap4all">
<div class="divwrap4_1">
<%= ai.getAir_dday_time() %>
</div>
<div class="divwrap4_2">
<div class="divtimewrap2_1">
<div class="divtimewrap2">
<%
//ai.getAir_duration()는 분 단위로 저장된 소요시간 값입니다.
int duration = ai.getAir_time_minute();
int hours = duration / 60; // 시간 계산
int minutes = duration % 60; // 분 계산
%>
<%= hours %>
</div>
<div class="divtimewrap2">
시간
</div>
<div class="divtimewrap2">
<%= minutes %>
</div>
<div class="divtimewrap2">
분
</div>
</div>
<img src="./flightimgs/예약조회화살표.svg" >
</div>
<div class="divwrap4_3">
<%= ai.getAir_aday_time() %>
</div>
</div>
<div class="divwrap4all2">
<div class="divwrap4_4">
<%= ai.getAir_model() %> / <%=ai.getAir_fligname() %>
</div>

</div>
</div>
<div class="divwrap5" tabindex="0">
<div class="divwrap5_1"  onclick="updateAirPrice('<%= ai.getAir_price() %>')">
<%= ai.getAir_price() %> <!-- 나중에 값 받아서 처리 -->
</div>
<div class="divwrap5_2">
원
</div>
</div>
</div>
  <% 
/*  	    }   */
	 }
	 } %>

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
 <!-- 나중에 값 받아서 처리 -->
</div>
<div class="divbottom2_2_2">
원
</div>
</div>
<div class="divbottom2_3" onclick="location.href='flight_product2.jsp'">
<div class="divbottom2_3_1">
다음 여정 <!-- 왕복이면 오는날 비행기 조회 페이지로 보냄 -->
</div>
</div>
</div>
</div>
<%-- <!-- 푸터 -->
<jsp:include page="footer.jsp"></jsp:include> --%>
</body>
</html>