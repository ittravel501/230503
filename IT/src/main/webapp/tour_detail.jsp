<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.TourInfo" %>
<%@ page import="java.util.*" %> 
<%@ page import="vo.Tour_qnaInfo" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투어 상세페이지</title>
<link rel="stylesheet" href="assets/css/tour_detail.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script> 
<script src="assets/js/tour_detail.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
		<header>
  		<%@include file="header.jsp" %>
	</header>
<%-- 	<% ArrayList<Tour_qnaInfo> arr=(ArrayList)request.getAttribute("qi"); --%>
<%-- 		out.print(arr);%> --%>
	<div id="wrap">
		<div class="wrap01">
		<div class="top_wrap">
			<ul class="ul_wrap">
<%-- 			<%String tour_city = tourlist.getTour_city(); %> --%>
				<li><a href="tour002.jsp">투어 홈</a></li> 
				<li>여행구분</li> 
<%-- 				<li><%=tour_city %></li>  --%>
				<li><c:out value="${tourlist.tour_tour}"/></li>
			</ul>
			<div class="prod_info_wrap">
				<img src="assets/img/<c:out value="${tourlist.tour_img1}"/>">
				
				 <ul class="prod_wrap">
				    
				      <span>000000<c:out value="${tourlist.tour_num}"/></span>
				      <li class="prod_spe">[<c:out value="${tourlist.tour_spe}"/>]</li>
				      <li class="prod_name"><c:out value="${tourlist.tour_name}"/></li>
				      <li class="prod_name01"><c:out value="${tourlist.tour_sub_name}"/></li>
				      <li class="prod_price"><fmt:formatNumber type="number" value="${tourlist.tour_price}" pattern="#,###"/>원</li>
				      <select>
							<option value="selected" selected>옵션선택</option>
							<option value="">첫번째 옵션</option>
							<option value="">두번째 옵션</option>
							<option value="">세번째 옵션</option>
						</select>
						<select class="datepicker">
						  <option value="" selected>날짜선택</option>
						</select>
						<select>
							<option value="selected" selected>성인/소아</option>
							<option value="">성인</option>
							<option value="">소아</option>
							<option value="">청소년</option>
						</select>
				
				<li style="text-align: center;">
					<input type="submit" id="basket_btn" value="장바구니">
					<input type="submit" id="buy_btn" value="구매하기">
				</li>
				
				</ul>
				
			</div>
		</div>
	</div>
	<div class="wrap01">
	<div class="wrap02">
		<ul class="nav_wrap">
			<li><a id="detail_tab" href="tour_detail?tour_num=${tourlist.tour_num }">상세정보</a></li>|
			<li><a id="review_tab" href="rev_select?tour_num=${tourlist.tour_num }">리뷰</a></li>|
			<li><a id="qna_tab" href="qna_select?tour_num=${tourlist.tour_num }">문의</a></li>
		  </ul>
		<div style="width:35%;"></div>
	</div>
	</div>
	<div class="wrap01">
		<div class="bottom_wrap">
		
		<div id="detail_tab_content" class="prod_detail">
		  <!-- 상세정보 탭의 내용 -->
		  <img src="assets/img/<c:out value="${tourlist.tour_detail_img}"/>">
		</div>
		
		<div class="prod_opt">
			<div class="etc">옵션선택</div>
			<div>
				<select>
					<option value="selected" selected>옵션선택</option>
					<option value="">첫번째 옵션</option>
					<option value="">두번째 옵션</option>
					<option value="">세번째 옵션</option>
				</select>
				<select class="datepicker">
				  <option value="" selected>날짜선택</option>
				</select>
				<select>
					<option value="selected" selected>성인/소아</option>
					<option value="">성인</option>
					<option value="">소아</option>
					<option value="">청소년</option>
				</select>
				<div>
				<input type="submit" id="basket_btn" value="장바구니">
				<input type="submit" id="buy_btn" value="구매하기">
				</div>
			</div>
		</div>
		</div>
	</div>
</div>
	<footer>
  		<%@include file="footer.jsp" %>
	</footer>
</body>
</html>