<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.TourInfo" %>
<%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/magnific-popup.min.css">


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
				<li><a href="tour">투어 홈</a></li> 
				<li>여행구분</li> 
				<li><c:out value="${tourlist.tour_city}"/></li> 
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
		
		<div id="review_tab_content" class="prod_detail">
		  <!-- 리뷰 탭의 내용 -->
		  <div class="qna_top">
			<c:set var="reviewCount" value="0" />
			<c:forEach items="${ri}" var="review">
			  <c:if test="${review.rev_tour_num eq tourlist.tour_num}">
			    <c:set var="reviewCount" value="${reviewCount + 1}" />
			  </c:if>
			</c:forEach>
			<div class="span">총<span>${reviewCount}</span>개</div>
					<a href="
					javascript:void(window.open('rev_review?tour_num=${tourlist.tour_num }','tour_review','width=600,height=820,scrollbars=yes'));"
					 class="review_w" >
					<input type="button" value="리뷰작성" ></a>
			</div>
			
			<div class="qna_bottom">
				<div class="text3">리뷰 목록</div>
				<ul class="ul_qna_q" id="qna_content">
				<c:forEach items="${ri }" var="ri">
				<c:if test="${ri.rev_tour_num eq tourlist.tour_num }">
					<li>${ri.rev_img1 }</li>
					<li>
						<span style="font-familly:TheJamsil3Regular;">${ri.rev_num}</span>
						<span class="b">${ri.rev_mem_id}아이디</span>
						<span>${ri.rev_date}</span>
					</li>
					<li>
					<c:choose>
					<c:when test="${ri.rev_avg ne null}">
						<div class="avg_wrap">
							<div class="avg01" name="rev_avg" onclick="changeRating(1)">
								<img src="${ri.rev_avg >= 1 ? 'assets/img/avg_full.png' : 'assets/img/avg_empty.png'}">
							</div>
							<div class="avg02" name="rev_avg" onclick="changeRating(2)">
								<img src="${ri.rev_avg >= 2 ? 'assets/img/avg_full.png' : 'assets/img/avg_empty.png'}">
							</div>
							<div class="avg03" name="rev_avg" onclick="changeRating(3)">
								<img src="${ri.rev_avg >= 3 ? 'assets/img/avg_full.png' : 'assets/img/avg_empty.png'}">
							</div>
							<div class="avg04" name="rev_avg" onclick="changeRating(4)">
								<img src="${ri.rev_avg >= 4 ? 'assets/img/avg_full.png' : 'assets/img/avg_empty.png'}">
							</div>
							<div class="avg05" name="rev_avg" onclick="changeRating(5)">
								<img src="${ri.rev_avg >= 5 ? 'assets/img/avg_full.png' : 'assets/img/avg_empty.png'}">
							</div>
							<input type="hidden" id="rev_avg_input" name="rev_avg" value="${ri.rev_avg}">
						</div>
					</c:when>
					</c:choose>
					</li>
					<li class="a">${ri.rev_content}</li>
					</c:if>
				</c:forEach>
				</ul>
			</div>
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