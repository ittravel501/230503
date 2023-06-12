<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.FlightDao" %> 
<%@ page import="dto.Airinfo" %>
<%@ page import="java.sql.Time" %>
<%@ page import="java.util.Vector" %>
<jsp:useBean id="air" class="dto.Airinfo" scope="page"/>  
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> 

<%
  request.setCharacterEncoding("UTF-8");
  String selected_price = request.getParameter("selected_price");
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
  int selectedPrice = Integer.parseInt(selected_price);
  request.setAttribute("selected_price", selectedPrice);
  request.setAttribute("air_deppt", air_deppt);
  request.setAttribute("air_arrpt", air_arrpt);
  request.setAttribute("air_dday", air_dday);
  request.setAttribute("air_aday", air_aday);
  request.setAttribute("air_model", air_model);
  request.setAttribute("air_fligname", air_fligname);
  request.setAttribute("air_dday_time", air_dday_time);
  request.setAttribute("air_aday_time", air_aday_time);
  request.setAttribute("air_time_minute", airtimeminute);
  request.getRequestDispatcher("flight3_1.jsp").forward(request, response);
%>
 
<!--  
flight2.js에서 서버로 전송된 flightForm의 값을 
 String selected_price = request.getParameter("selected_price"); 로 가져온다.
 그 다음에 request.setAttribute("selected_price", selected_price);를 이용하여 selected_price의 값을 요청의 속성으로 설정한다.
 request.getRequestDispatcher("flight3_1.jsp").forward(request, response);이를 통해  flight3_1.jsp로 요청을 보내 해당 jsp 페이지를 렌더링한다.
 이때, 앞서 설정한 selected_price 속성을 함께 전달한다.
 -->
 
<!--  
 flight3_1.jsp로 포워딩하는 경우, 클라이언트에게는 포워딩된 페이지의 URL이 노출되지 않는다.
 클라이언트는 flightAction3.jsp에 대한 요청을 보냈지만, 서버에서는 이 요청을 flight3_1.jsp로 전달하여 처리하고 응답을 생성한다는 것이다.
 클라이언트는 이 과정을 알 수 없으며, 브라우저의 주소창에는 원래의 요청인 flightAction3.jsp의 URL이 표시되는 구조.
 포워딩을 사용하여 서버 내부에서 페이지 전환을 처리하면, 클라이언트는 포워딩된 페이지의 URL을 직접 알 수 없으므로 보안 및 URL 노출 제어가 가능하다.
 -->