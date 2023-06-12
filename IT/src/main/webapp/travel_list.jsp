<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@page import="dto.*"%>
<% ArrayList<TravelDTO> travelList = (ArrayList<TravelDTO>) request.getAttribute("travelList"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<H2>내 일정</H2>
<h1>클릭하면 일정관리 페이지로 넘어갑니다.</h1>
<div class="picwrap1">
	
	<%
		if(travelList != null){
			for(int i=0;i<travelList.size();i++){
				int tra_num = travelList.get(i).getTra_num();
				%>			
				<a href="/MngSchList.bo?tra_num=<%=tra_num%>"><div class="pntwrap"><%=travelList.get(i).getTra_num() %>, <%=travelList.get(i).getTra_title()%>, <%=travelList.get(i).getTra_dday() %>, <%=travelList.get(i).getTra_aday()%>, <%=travelList.get(i).getTra_ppl()%>명</div></a>			
			
			<%}
		}%>
</div>


</body>
</html>