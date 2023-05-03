<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ page import="dao.FlightDao" %>
    <%@ page import="dto.Airinfo" %>
    <% 
    request.setCharacterEncoding("UTF-8");
    %>
    <%@ page import="java.util.Vector" %>
   <jsp:useBean id="air" class="dto.Airinfo" scope="page"/>
	<jsp:setProperty property="*" name="air"/>   
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
    request.setCharacterEncoding("UTF-8");
	String air_num = request.getParameter("air_num");
    String air_deppt = request.getParameter("air_deppt");
    String air_dday = request.getParameter("air_dday");
    String air_arrpt = request.getParameter("air_arrpt");
    String air_aday = request.getParameter("air_aday");
    String air_model = request.getParameter("air_model");
    String air_fligname = request.getParameter("air_fligname");

    FlightDao fd = new FlightDao();
    Vector<Airinfo> result = fd.pt(air);

        session.setAttribute("air_deppt", air_deppt);
        session.setAttribute("air_arrpt", air_arrpt);
        response.sendRedirect("check.jsp");
   
%>
 		
</body>
</html>