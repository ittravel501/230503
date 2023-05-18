<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.TourInfo" %>
<%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰</title>
<link rel="stylesheet" href="assets/css/tour_review.css">
<script src="assets/js/tour_review.js"></script>
</head>
<body>
<div id="wrap">
	<ul class="ul_wrap">
		<li class="text3">리뷰쓰기</li>
		<li class="text1">이 상품에 리뷰를 쓰시면 <span>소정의 적립금</span>을 드립니다</li>
		<li>
		<div class="a"><img src="assets/img/${tourlist.tour_img1}"> ${tourlist.tour_name}</div> </li>
	</ul>
	<form action="rev_insert" method="post" >
	<div class="review_wrap">
		<div class="text3">상품만족도</div>
		<div class="avg_wrap">
			<div class="avg01" name="rev_avg" onclick="changeRating(1)"><img src="assets/img/avg_empty.png"></div>
			<div class="avg02" name="rev_avg" onclick="changeRating(2)"><img src="assets/img/avg_empty.png"></div>
			<div class="avg03" name="rev_avg" onclick="changeRating(3)"><img src="assets/img/avg_empty.png"></div>
			<div class="avg04" name="rev_avg" onclick="changeRating(4)"><img src="assets/img/avg_empty.png"></div>
			<div class="avg05" name="rev_avg" onclick="changeRating(5)"><img src="assets/img/avg_empty.png"></div>
			<input type="hidden" id="rev_avg_input" name="rev_avg" value="">
			<input type="hidden" name="rev_tour_num" value="${tourlist.tour_num }">
		</div>
	</div>
	<div class="text_wrap">
		<div class="text3">리뷰 작성하기</div>
		<div><textarea placeholder="내용을 입력하세요." name="rev_content"></textarea></div>
		<a href="#" class="img_file">
			<label for="file_input">
				<img id="thumbnail" src="assets/img/img_file.png">
			</label>
			<input id="file_input" type="file" name="rev_img1"style="display:none;"></a>
	</div>
	</div>
	<div class="btn"><input type="submit" value="작성완료" ></div>
	</form>
</div>

</body>
</html>