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
<jsp:include page="header.jsp"></jsp:include><div class="divwrap1">
<div class="divwrap1">
    <div class="divwrap2"><!-- 수하물 제목 -->
        <div class="divwrap3">
            예약 내역 확인
        </div>
    </div>
    <div class="divwrap4">
    		<table>
				<tr>
				<td>목록 번호</td>
				<td>고객 이름</td>
				<td>예약 번호 </td>
				</tr>
        <% 
        request.setCharacterEncoding("UTF-8");
        // 로그인한 아이디와 세션에 저장된 값 비교
            int listNumber = 1;
        FlightDao fd = new FlightDao();
        Vector<Post> memlist = fd.meminfo(); // mem_account 테이블에서 값을 select
        String sessionLoginId = (String) session.getAttribute("mem_id");

        for (Post post : memlist) {
            String accountId = post.getMem_id(); // 컬럼에서 아이디 가져오기

            if (accountId != null && accountId.equals(sessionLoginId)) {
                // mem_name 가져오기
                String memName = (String) session.getAttribute("mem_name");

                // 앞 페이지에서 저장된 값 가져오기
                String selectedPrice2 = request.getParameter("selectedPrice2");
                int selected_Price2 = Integer.parseInt(selectedPrice2);

                String randomnum = request.getParameter("reservationNumber");
                
                
                String price = request.getParameter("price");
                int price1 = Integer.parseInt(price);

                String seatNumber = request.getParameter("seatNumber");
                int seatNumber1 = Integer.parseInt(seatNumber);
                String seatNumber_2 = request.getParameter("seatNumber2");
                int seatNumber2 = Integer.parseInt(seatNumber_2);

                String lastname = request.getParameter("lastname");
                String firstname = request.getParameter("firstname");
                String memsex = request.getParameter("memsex");
                String memmobile1 = request.getParameter("memmobile");
                int memmobile = Integer.parseInt(memmobile1);
                String membirth = request.getParameter("membirth");
                String mememail = request.getParameter("mememail");

                String air_deppt1 = request.getParameter("air_deppt1");
                String air_arrpt1 = request.getParameter("air_arrpt1");
                String air_dday1 = request.getParameter("air_dday1");
                String air_aday1 = request.getParameter("air_aday1");
                String air_model1 = request.getParameter("air_model1");
                String air_fligname1 = request.getParameter("air_fligname1");
                String air_dday_time1 = request.getParameter("air_dday_time1");
                String air_aday_time1 = request.getParameter("air_aday_time1");
                String air_time_minute1 = request.getParameter("air_time_minute1");
                int airtimeminute1 = Integer.parseInt(air_time_minute1);

                String air_deppt = request.getParameter("air_deppt");
                String air_arrpt = request.getParameter("air_arrpt");
                String air_dday = request.getParameter("air_dday");
                String air_aday = request.getParameter("air_aday");
                String air_model = request.getParameter("air_model");
                String air_fligname = request.getParameter("air_fligname");
                String air_dday_time = request.getParameter("air_dday_time");
                String air_aday_time = request.getParameter("air_aday_time");
                String air_time_minute = request.getParameter("air_time_minute");
                int airtimeminute = Integer.parseInt(air_time_minute);

                String hiddenSelectedPriceParam = request.getParameter("hiddenSelectedPrice");
                int hiddenSelectedPrice = Integer.parseInt(hiddenSelectedPriceParam);
%>

       <tr>
                <td><%= listNumber %></td>
                <td><%= lastname + firstname %></td>
                <td><%= randomnum %></td>
            </tr>
            <% 
            // 목록 번호 증가
            listNumber++;
        }
    }
    %>
</table>
        <input type="submit" value="홈">
    </div>
</div>


 <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>