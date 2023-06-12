<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="java.sql.Time" %>
    <%@page import="dao.BoardDao"%>
<%@page import="javax.swing.border.Border"%>
<%@page import="dao.FlightDao"%> 
<%@page import="java.util.Vector"%>
<%@page import="dto.Airinfo"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>항공 예약</title>
</head>
<body>
     <section>
        <div class="centerdiv1">
           <div class="wrapdiv1">
          <img src="./flightimgs/배너1100.png" alt="">
      </div>

      <section>
      
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
            <div class="wrap4">
            <h2>해외 특가 항공권 ✈ </h2>
            <div class="imgdiv">
<%
  FlightDao fd = new FlightDao();
  Vector<Airinfo> list1 = fd.getList(pageNumber);
  Vector<Airinfo> filteredList = new Vector<Airinfo>();
  int lowestPrice = Integer.MAX_VALUE;
  Airinfo cheapestFlight = null;

  // 출발지가 인천이면서 도착지가 뉴욕인 항공편 리스트 만들기
  for(int i = 0; i < list1.size(); i++) {
    Airinfo ai = list1.get(i);
    if(ai.getAir_deppt().equals("ICN") && ai.getAir_arrpt().equals("JFK")) {
      filteredList.add(ai);
      int price = ai.getAir_price();
      if (price < lowestPrice) {
        lowestPrice = price; // 최저 가격 갱신
        cheapestFlight = ai; // 가장 싼 항공편 정보 저장
      }
    }
  }

  // 가장 적은 가격의 항공편을 출력
  if(cheapestFlight != null) {
    %>
    <div class="salediv1 country1" onclick="location.href='flightAction2.jsp'">
      <img src="./flightimgs/뉴욕1.jpg" alt="" >
      <div class="fontdiv2"> 자유의 나라로 </div>
      <div class="fontdiv1">
  <%= cheapestFlight.getAir_deppt().equals("ICN") ? "인천" : cheapestFlight.getAir_deppt() %> 
  ↔ 
  <%= cheapestFlight.getAir_arrpt().equals("JFK") ? "뉴욕" : cheapestFlight.getAir_arrpt() %>
</div>
      <div class="fontdiv3"> <%= cheapestFlight.getAir_price() %>원~ </div>
    </div>
    <%
  }
%>

<%
  FlightDao fd2 = new FlightDao();
  Vector<Airinfo> list2 = fd2.getList(pageNumber);
  Vector<Airinfo> filteredList2 = new Vector<Airinfo>();
  int lowestPrice2 = Integer.MAX_VALUE;
  Airinfo cheapestFlight2 = null;

  // 출발지가 인천이면서 도착지가 뉴욕인 항공편 리스트 만들기
  for(int i = 0; i < list2.size(); i++) {
    Airinfo ai = list2.get(i);
    if(ai.getAir_deppt().equals("ICN") && ai.getAir_arrpt().equals("BKK")) {
      filteredList2.add(ai);
      int price = ai.getAir_price();
      if (price < lowestPrice2) {
        lowestPrice2 = price; // 최저 가격 갱신
        cheapestFlight2 = ai; // 가장 싼 항공편 정보 저장
      }
    }
  }

  // 가장 적은 가격의 항공편을 출력
  if(cheapestFlight2 != null) {
    %>
    <div class="salediv1 country2" onclick="location.href='flightAction2.jsp'">
      <img src="./flightimgs/방콕1.jpg" alt="" >
      <div class="fontdiv2"> 지금 가장 뜨는 곳 </div>
      <div class="fontdiv1">
  <%= cheapestFlight2.getAir_deppt().equals("ICN") ? "인천" : cheapestFlight2.getAir_deppt() %> 
  ↔ 
  <%= cheapestFlight2.getAir_arrpt().equals("BKK") ? "방콕" : cheapestFlight2.getAir_arrpt() %>
</div>
      <div class="fontdiv3"> <%= cheapestFlight2.getAir_price() %>원~ </div>
    </div>
    <%
  }
%>

<%
  FlightDao fd3 = new FlightDao();
  Vector<Airinfo> list3 = fd3.getList(pageNumber);
  Vector<Airinfo> filteredList3 = new Vector<Airinfo>();
  int lowestPrice3 = Integer.MAX_VALUE;
  Airinfo cheapestFlight3 = null;

  // 출발지가 인천이면서 도착지가 뉴욕인 항공편 리스트 만들기
  for(int i = 0; i < list3.size(); i++) {
    Airinfo ai = list3.get(i);
    if(ai.getAir_deppt().equals("ICN") && ai.getAir_arrpt().equals("HNL")) {
      filteredList3.add(ai);
      int price = ai.getAir_price();
      if (price < lowestPrice3) {
        lowestPrice3 = price; // 최저 가격 갱신
        cheapestFlight3 = ai; // 가장 싼 항공편 정보 저장
      }
    }
  }

  // 가장 적은 가격의 항공편을 출력
  if(cheapestFlight3 != null) {
    %>
    <div class="salediv2 country3" onclick="location.href='flightAction2.jsp'">
      <img src="./flightimgs/하와이1.jpg" alt="" >
      <div class="fontdiv2"> 지금 가장 뜨는 곳 </div>
      <div class="fontdiv1">
  <%= cheapestFlight3.getAir_deppt().equals("ICN") ? "인천" : cheapestFlight3.getAir_deppt() %> 
  ↔ 
  <%= cheapestFlight3.getAir_arrpt().equals("HNL") ? "하와이" : cheapestFlight3.getAir_arrpt() %>
</div>
      <div class="fontdiv3"> <%= cheapestFlight3.getAir_price() %>원~ </div>
    </div>
    <%
  }
%>

<%
  FlightDao fd4 = new FlightDao();
  Vector<Airinfo> list4 = fd4.getList(pageNumber);
  Vector<Airinfo> filteredList4 = new Vector<Airinfo>();
  int lowestPrice4 = Integer.MAX_VALUE;
  Airinfo cheapestFlight4 = null;

  // 출발지가 인천이면서 도착지가 뉴욕인 항공편 리스트 만들기
  for(int i = 0; i < list4.size(); i++) {
    Airinfo ai = list4.get(i);
    if(ai.getAir_deppt().equals("ICN") && ai.getAir_arrpt().equals("CDG")) {
      filteredList4.add(ai);
      int price = ai.getAir_price();
      if (price < lowestPrice4) {
        lowestPrice4 = price; // 최저 가격 갱신
        cheapestFlight4 = ai; // 가장 싼 항공편 정보 저장
      }
    }
  }

  // 가장 적은 가격의 항공편을 출력
  if(cheapestFlight4 != null) {
    %>
    <div class="salediv3 country4" onclick="location.href='flightAction2.jsp'">
      <img src="./flightimgs/파리1.jpg" alt="" >
      <div class="fontdiv2"> 지금 가장 뜨는 곳 </div>
      <div class="fontdiv1">
  <%= cheapestFlight4.getAir_deppt().equals("ICN") ? "인천" : cheapestFlight4.getAir_deppt() %> 
  ↔ 
  <%= cheapestFlight4.getAir_arrpt().equals("CDG") ? "파리" : cheapestFlight4.getAir_arrpt() %>
</div>
      <div class="fontdiv3"> <%= cheapestFlight4.getAir_price() %>원~ </div>
    </div>
    <%
  }
%>            
            </div>
            
            </div>
        </div>

        <div class="wrap4">
            <h2>국내 특가 항공권 ✈ </h2>
            <div class="imgdiv">
            
<%
  FlightDao fd5 = new FlightDao();
  Vector<Airinfo> list5 = fd5.getList(pageNumber);
  Vector<Airinfo> filteredList5 = new Vector<Airinfo>();
  int lowestPrice5 = Integer.MAX_VALUE;
  Airinfo cheapestFlight5 = null;

  // 출발지가 인천이면서 도착지가 뉴욕인 항공편 리스트 만들기
  for(int i = 0; i < list5.size(); i++) {
    Airinfo ai = list5.get(i);
    if(ai.getAir_deppt().equals("GMP") && ai.getAir_arrpt().equals("CJU")) {
      filteredList5.add(ai);
      int price = ai.getAir_price();
      if (price < lowestPrice5) {
        lowestPrice5 = price; // 최저 가격 갱신
        cheapestFlight5 = ai; // 가장 싼 항공편 정보 저장
      }
    }
  }

  // 가장 적은 가격의 항공편을 출력
  if(cheapestFlight5 != null) {
    %>
    <div class="salediv1 country5" onclick="location.href='flightAction2.jsp'">
      <img src="./flightimgs/제주도.jpg" alt="" >
      <div class="fontdiv2"> 지금 가장 뜨는 곳 </div>
      <div class="fontdiv1">
  <%= cheapestFlight5.getAir_deppt().equals("GMP") ? "김포" : cheapestFlight5.getAir_deppt() %> 
  ↔ 
  <%= cheapestFlight5.getAir_arrpt().equals("CJU") ? "제주" : cheapestFlight5.getAir_arrpt() %>
</div>
      <div class="fontdiv3"> <%= cheapestFlight5.getAir_price() %>원~ </div>
    </div>
    <%
  }
%>      

<%
  FlightDao fd6 = new FlightDao();
  Vector<Airinfo> list6 = fd6.getList(pageNumber);
  Vector<Airinfo> filteredList6 = new Vector<Airinfo>();
  int lowestPrice6 = Integer.MAX_VALUE;
  Airinfo cheapestFlight6 = null;

  // 출발지가 인천이면서 도착지가 뉴욕인 항공편 리스트 만들기
  for(int i = 0; i < list6.size(); i++) {
    Airinfo ai = list6.get(i);
    if(ai.getAir_deppt().equals("GMP") && ai.getAir_arrpt().equals("PUS")) {
      filteredList6.add(ai);
      int price = ai.getAir_price();
      if (price < lowestPrice6) {
        lowestPrice6 = price; // 최저 가격 갱신
        cheapestFlight6 = ai; // 가장 싼 항공편 정보 저장
      }
    }
  }

  // 가장 적은 가격의 항공편을 출력
  if(cheapestFlight6 != null) {
    %>
    <div class="salediv1 country6" onclick="location.href='flightAction2.jsp'">
      <img src="./flightimgs/부산.jpg" alt="" >
      <div class="fontdiv2"> 지금 가장 뜨는 곳 </div>
      <div class="fontdiv1">
  <%= cheapestFlight6.getAir_deppt().equals("GMP") ? "김포" : cheapestFlight6.getAir_deppt() %> 
  ↔ 
  <%= cheapestFlight6.getAir_arrpt().equals("PUS") ? "부산" : cheapestFlight6.getAir_arrpt() %>
</div>
      <div class="fontdiv3"> <%= cheapestFlight6.getAir_price() %>원~ </div>
    </div>
    <%
  }
%>      

<%
  FlightDao fd7 = new FlightDao();
  Vector<Airinfo> list7 = fd7.getList(pageNumber);
  Vector<Airinfo> filteredList7 = new Vector<Airinfo>();
  int lowestPrice7 = Integer.MAX_VALUE;
  Airinfo cheapestFlight7 = null;

  // 출발지가 인천이면서 도착지가 뉴욕인 항공편 리스트 만들기
  for(int i = 0; i < list7.size(); i++) {
    Airinfo ai = list7.get(i);
    if(ai.getAir_deppt().equals("YNY") && ai.getAir_arrpt().equals("CJU")) {
      filteredList7.add(ai);
      int price = ai.getAir_price();
      if (price < lowestPrice7) {
        lowestPrice7 = price; // 최저 가격 갱신
        cheapestFlight7 = ai; // 가장 싼 항공편 정보 저장
      }
    }
  }

  // 가장 적은 가격의 항공편을 출력
  if(cheapestFlight7 != null) {
    %>
    <div class="salediv2 country7" onclick="location.href='flightAction2.jsp'">
      <img src="./flightimgs/양양제주.jpg" alt="" >
      <div class="fontdiv2"> 지금 가장 뜨는 곳 </div>
      <div class="fontdiv1">
  <%= cheapestFlight7.getAir_deppt().equals("YNY") ? "양양" : cheapestFlight7.getAir_deppt() %> 
  ↔ 
  <%= cheapestFlight7.getAir_arrpt().equals("CJU") ? "제주" : cheapestFlight7.getAir_arrpt() %>
</div>
      <div class="fontdiv3"> <%= cheapestFlight7.getAir_price() %>원~ </div>
    </div>
    <%
  }
%>      

<%
  FlightDao fd8 = new FlightDao();
  Vector<Airinfo> list8 = fd8.getList(pageNumber);
  Vector<Airinfo> filteredList8 = new Vector<Airinfo>();
  int lowestPrice8 = Integer.MAX_VALUE;
  Airinfo cheapestFlight8 = null;

  // 출발지가 인천이면서 도착지가 뉴욕인 항공편 리스트 만들기
  for(int i = 0; i < list8.size(); i++) {
    Airinfo ai = list8.get(i);
    if(ai.getAir_deppt().equals("RSU") && ai.getAir_arrpt().equals("GMP")) {
      filteredList8.add(ai);
      int price = ai.getAir_price();
      if (price < lowestPrice8) {
        lowestPrice8 = price; // 최저 가격 갱신
        cheapestFlight8 = ai; // 가장 싼 항공편 정보 저장
      }
    }
  }

  // 가장 적은 가격의 항공편을 출력
  if(cheapestFlight8 != null) {
    %>
    <div class="salediv3 country8" onclick="location.href='flightAction2.jsp'">
      <img src="./flightimgs/서울서울.jpg" alt="" >
      <div class="fontdiv2"> 지금 가장 뜨는 곳 </div>
      <div class="fontdiv1">
  <%= cheapestFlight8.getAir_deppt().equals("RSU") ? "여수" : cheapestFlight8.getAir_deppt() %> 
  ↔ 
  <%= cheapestFlight8.getAir_arrpt().equals("GMP") ? "김포" : cheapestFlight8.getAir_arrpt() %>
</div>
      <div class="fontdiv3"> <%= cheapestFlight8.getAir_price() %>원~ </div>
    </div>
    <%
  }
%>      

            </div>
            
            </div>
        </div>

<!-- 
           <div class="wrapdiv1_1">
        <img src="./flightimgs/이동봉사1.png" alt="">
    </div> -->

     </section>
</body>
</html>