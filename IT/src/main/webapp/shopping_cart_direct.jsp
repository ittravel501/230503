<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTf-8"%>

<%@ page import = "java.util.ArrayList" %>
    
    <%@page import="dto.N_MD" %>
    <%@page import="dto.QNA_MD" %>
    <%@page import="dto.PROD_MD" %>
    
    <%@page import="vo.ProdInfo" %>
    <%@page import="vo.CartInfo" %>
    <%@page import="dao.N_controller" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>쇼핑 장바구니</title>

	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

	 <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
	 
	 <link rel="stylesheet" type="text/css" href="css/header_footer.css">
	 <link rel="stylesheet" type="text/css" href="css/shopping_cart.css">
	 
	 <!-- 헤더 js -->
	 <script src="js/slick-1.8.1/slick/slick.min.js"></script>

	 <script src="js/shopping_bn.js"></script>

</head>


<body>

<!--헤더부분-->

	<header>
	   <jsp:include page="header.jsp" />
	</header> 
	
	
	<section>
	

		<div id="s_order" >
			<ul>
				<li>01장바구니</li>>
				<li>02주문서작성/결제</li>>
				<li>03주문완료</li>
			</ul>		
		</div>
		
		<div id="s_basketwrap" >
			<div id="s_basket" >
				<ul>
					<li><input type="checkbox" name="cart_checkbox_all" onchange="allupdateCount()" ></li>
					<li>상품</li>
					<li>옵션</li>
					<li>상품금액</li>
					<li>수량</li>
					<li>할인/적립</li>
					<li>합계금액</li>
					<li></li>
				</ul>
			
			</div>
			
			<!-- ======================  구매할 제품 선택하는 체크박스 .js 시작	======================  -->
			
			<script>
			
				//전체 체크박스 선택/선택취소
				function allupdateCount() {
					
					var allChecked = document.getElementsByName("cart_checkbox_all")[0].checked; // "cart_checkbox_all" 체크박스 요소의 체크 상태를 가져옴
					var checkboxes = document.getElementsByName("cart_checkbox"); // "cart_checkbox" 체크박스 요소들의 상태를 변경
					 
					for (var i = 0; i < checkboxes.length; i++) {
						
						checkboxes[i].checked = allChecked;
						updateCount(); // 각 체크박스 요소의 상태를 변경할 때마다 updateCount() 함수 호출
					 }
				}
				
				//////////////////////////////////////////////////////////////////////
				
				//각 제품 체크박스 선택/취소
				function updateCount() {
				    
				    var checkedCount = document.querySelectorAll('input[name="cart_checkbox"]:checked').length;	// 체크된 체크박스 요소의 개수를 가져옴
				    var countElement = document.getElementById('checked_count'); // 카운트를 표시할 요소를 가져와서 업데이트
				    
				    countElement.textContent = checkedCount;
				  }
			
			</script>
			
			<!-- ======================  구매할 제품 선택하는 체크박스 .js 끝	======================  -->
			
		<%
		
			ArrayList<CartInfo> cartinfo = (ArrayList<CartInfo>) request.getAttribute("cartdirect_arr");

			for(int i=0; i<cartinfo.size(); i++) {
				
				int shop_bas_prod_num = cartinfo.get(i).getShop_bas_prod_num();
				String prod_name = cartinfo.get(i).getShop_bas_prod_name();
				int prod_quantity= cartinfo.get(i).getShop_bas_prod_quantity();
				int prod_price = cartinfo.get(i).getShop_bas_prod_price();
				String prod_mem_id = cartinfo.get(i).getShop_bas_prod_name();
				
				int prod_total_price = prod_price * prod_quantity ;		
		%>
			
			<div class="s_basket_prod">
					
				<ul>
					<li><input type="checkbox" name="cart_checkbox" onchange="updateCount()"  ></li>
					<li><%=prod_name %></li>
					<li>옵션</li>
					<li><%=prod_price %></li>
					<li><%=prod_quantity %></li>
			        
					<li>할인/적립</li>
					
					<!-- 			///////////////////////////          -->
					
        			<% if(prod_total_price >= 2000000) { %>
						<li><%=prod_total_price %></li>
					<% } else { %>
						<li><%= 3000 + prod_total_price %></li>
					<% } %>
					
					<!-- 			///////////////////////////           -->
					
<%-- 					<% if(prod_total_price >= 2000000) { %> --%>
<!-- 			            <li>무료</li> -->
<%-- 			        <% } else { %> --%>
<!-- 			            <li>3000</li> -->
<%-- 			        <% } %> --%>

					<li>
						<a href="shopping_cart_delete.do?shop_bas_prod_num=<%=shop_bas_prod_num %>"
						   onclick="return confirm('해당 제품을 삭제하시겠습니까?')">삭제</a>
					</li>
			        
				</ul>
			
			</div>
			
<!-- 			<div> -->
<%-- 				<a href="shopping_cart_delete.do?shop_bas_prod_num=<%=shop_bas_prod_num %>">삭제</a> --%>
<!-- 			</div> -->
			
			
			
<!-- 			<div> -->
<%-- 				<a href="shopping_buy.do?shop_bas_prod_num=<%=shop_bas_prod_num %>" ><input type="button" value="삭제" ></a> --%>
<!-- 			</div> -->
			
		<%} %>
		</div>
		
		
		<div id="shopping_total_price_info_wrap" >
			<div class="shopping_total_price_info" >
				<div class="total_price_info" >총 판매가</div>
				<div class="total_price_info" >총 할인금액</div>
				<div class="total_price_info" >배송비</div>
				
				<div class="sum_price" >
					<span>배송비는 쿠폰할인금액에 따라 변경될 수 있습니다.</span>
					
					<span>총 결제예상금액 </span> 
					
				</div>
				
			</div>
		</div>
		
		
		
		<div id="order_btn_wrap" >
		
			<div class="order_btn" >
				<button>선택주문(<span id="checked_count">0</span>)</button>
				<button>전체주문</button>
			</div>
			
		</div>
	
	</section>
	


	<footer>
    	<jsp:include page="footer.jsp"/>
	</footer>

</body>

</html>