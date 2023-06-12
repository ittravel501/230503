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

/* 운임비 & 수화물  */
String selectedPrice2 = request.getParameter("selectedPrice2");
int selected_Price2 = Integer.parseInt(selectedPrice2);

String price = request.getParameter("price");
int price1 = Integer.parseInt(price);

/* flight2test 값 */
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

/* flight3_1 값 */
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


/* 운임 & 수화물 값 */
request.setAttribute("selectedPrice2", selected_Price2);
request.setAttribute("price", price1);

/* flight2test 값 */
request.setAttribute("air_deppt1", air_deppt1);
request.setAttribute("air_arrpt1", air_arrpt1);
request.setAttribute("air_dday1", air_dday1);
request.setAttribute("air_aday1", air_aday1);
request.setAttribute("air_model1", air_model1);
request.setAttribute("air_fligname1", air_fligname1);
request.setAttribute("air_dday_time1", air_dday_time1);
request.setAttribute("air_aday_time1", air_aday_time1);
request.setAttribute("air_time_minute1", airtimeminute1);

/* flight3_1 값 */
request.setAttribute("air_deppt", air_deppt);
request.setAttribute("air_arrpt", air_arrpt);
request.setAttribute("air_dday", air_dday);
request.setAttribute("air_aday", air_aday);
request.setAttribute("air_model", air_model);
request.setAttribute("air_fligname", air_fligname);
request.setAttribute("air_dday_time", air_dday_time);
request.setAttribute("air_aday_time", air_aday_time);
request.setAttribute("air_time_minute", airtimeminute);


  String hiddenSelectedPriceParam = request.getParameter("hiddenSelectedPrice");
  int hiddenSelectedPrice = Integer.parseInt(hiddenSelectedPriceParam);
  request.setAttribute("hiddenSelectedPriceValue", hiddenSelectedPrice);
  request.getRequestDispatcher("flight5.jsp").forward(request, response);
%>




