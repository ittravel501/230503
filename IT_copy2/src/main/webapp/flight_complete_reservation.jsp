<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
        <%@ page import="dto.Airinfo" %>
     <%@page import="dto.Post"%>
     <%@page import="dto.Reservation_info_DTO"%>
    <%@page import="dao.FlightDao"%>
    <%@page import="java.util.Vector"%>
<%@ page import="java.util.Random" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>여정 정보</title> 
        <link rel="stylesheet" type="text/css"  href="./css/flight_complete_reservation.css">
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
<form action="flight_reservationlist.jsp" method="post" id="flightForm">
<%
/* 운임 & 수화물 값  */
int selectedPrice2 = (Integer)request.getAttribute("selectedPrice2");
int price = (Integer)request.getAttribute("price");
/* 좌석번호 */
int seatNumber = (Integer)request.getAttribute("seatNumber");
int seatNumber2 = Integer.parseInt(request.getParameter("seatNumber2"));
/* 회원정보 */
String lastname = (String)request.getAttribute("lastname");
String firstname = (String)request.getAttribute("firstname");
String memsex = (String)request.getAttribute("memsex");
String membirth = (String)request.getAttribute("membirth");
String mememail = (String)request.getAttribute("mememail");
int memmobile = (Integer)request.getAttribute("memmobile");
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
<input type="hidden" id="lastname" name="lastname" value="<%= lastname %>" />
<input type="hidden" id="firstname" name="firstname" value="<%= firstname %>" />
<input type="hidden" id="memsex" name="memsex" value="<%= memsex %>" />
<input type="hidden" id="membirth" name="membirth" value="<%= membirth %>" />
<input type="hidden" id="mememail" name="mememail" value="<%= mememail %>" />
<input type="hidden" id="memmobile" name="memmobile" value="<%= memmobile %>" />
<!-- 운임 & 수화물  -->
<input type="hidden" id="selectedPrice2" name="selectedPrice2" value="<%= selectedPrice2 %>" />
<input type="hidden" id="price" name="price" value="<%= price %>" />

<input type="hidden" id="seatNumber" name="seatNumber" value="<%= seatNumber %>">
<input type="hidden" id="seatNumber2" name="seatNumber2" value="<%= seatNumber2 %>">
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
<div class="divwrap1"> 
<div class="divwrap2"><!-- 수하물 제목 -->
<div class="divwrap3">
예약 내역 확인
</div>
</div>
<div class="divwrap4">
<div class="divwrap5">
<%
FlightDao fd = new FlightDao();
String sessionLoginId = (String) session.getAttribute("mem_id"); // 세션에 저장된 아이디 가져오기
String reservationNumber = null; // 예약 번호 초기화

// 사용자가 로그인한 상태인 경우에만 실행
if (sessionLoginId != null) {
    // 예약 번호 생성
    int min = 0; // 예약 번호의 최소 값
    int max = 99999999; // 예약 번호의 최대 값

    Random random = new Random();
    int randomNum = random.nextInt(max - min + 1) + min;

    reservationNumber = String.format("%08d", randomNum);

}

%>
<div class="divwrap5_1">
    <% if (sessionLoginId != null && reservationNumber != null) { %>
        <%= lastname+firstname %> 님의 예약 번호는 <%= reservationNumber %> 입니다.
         <input type="hidden" name="reservationNumber" value="<%= reservationNumber %>">
    <% } else { %>
        <script>
            alert("예약 번호가 없습니다.");
            window.location.href = "flight.jsp"; // 페이지 리디렉션
        </script>
    <% } %>
</div>


<div class="divwrap5_2">
<div class="divwrap5_2_1">
<div class="divwrap5_2_1_1">
<div class="divwrap5_2_1_1_1">
<%= air_deppt1%>
</div>
<div class="divwrap5_2_1_1_1">
~
</div>
<div class="divwrap5_2_1_1_1">
<%= air_arrpt1%>
</div>
<div class="divwrap5_2_1_1_1">
<%= air_fligname1%>
</div>
<div class="divwrap5_2_1_1_1">
<div class="divwrap5_2_1_1_2">
<%= air_dday1 %>
</div>
<div class="divwrap5_2_1_1_2">
<%= air_aday1 %>
</div>
</div>
</div>
<div class="divwrap5_2_1_2">
<div class="divwrap5_2_1_2_1">
총결제금액
</div>
<div class="divwrap5_2_1_2_2">
<div class="divwrap5_2_1_2_3">
<%= hiddenSelectedPriceValue %>원
</div>
</div>
</div>
</div>
<div class="divwrap5_2_2">
결제 상태 / 결제 완료 <br>
예약자명 : <%= lastname+firstname %> <br>
이메일 : <%= mememail %> <br>
연락처 : <%= memmobile %>
</div>
</div>
</form>
<!-- <input type="submit" value="예약 목록 조회" onclick="submitFlightForm();">
<script type="text/javascript">
function submitFlightForm() {
    document.getElementById('flightForm').submit();
    
        /* flightForm이라는 id를 가진 요소를 선택
     submit은 선택한 요소를 제출하는 작업을 수행해준다. 
     flightForm이라는 id를 가진 <form>을 제출하여 해당 폼의 내용을 서버로 전송하는 역할
     */
  }
</script> -->
</div>
<!-- <div class="divwrap6">
<div class="divwrap3">
이동 봉사 신청
</div>
<div class="divwrap3">
<button onclick="complete();">봉사 신청</button>
</div>
</div> -->

</div>
</div>
 <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>