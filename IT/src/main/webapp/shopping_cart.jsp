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
		
		<!-- 		결제순서 끝	  -->
		
		
		<form action="shopping_buy.do">
		
		<table>
		
			<tr id="s_basket" >
					<th><input type="hidden" >  </th>
					<th><input type="checkbox" id="cart_checkbox_all" onchange="selectAllCheckboxes()" ></th>
					<th>상품</th>
					<th>옵션</th>
					<th>상품금액</th>
					<th>수량</th>
					<th>할인/적립</th>
					<th>합계금액</th>
					<th>
			
			</tr>
			
			<!-- ======================  구매할 제품 선택하는 체크박스 .js 시작	======================  -->
			
			<script>
			// 체크된 체크박스 개수를 저장할 변수
			let checkedCount = 0;
			
			// 장바구니 페이지가 로드될 때 실행되는 이벤트 핸들러 함수
			window.onload = function() {
  			// 각 체크박스의 초기 상태를 설정합니다.
				const checkboxes = document.querySelectorAll('#cart_checkbox');
				checkboxes.forEach(checkbox => checkbox.checked = true);

				const checkboxAll = document.querySelector('#cart_checkbox_all');
				checkboxAll.checked = true;

				// 체크된 체크박스 개수를 업데이트합니다.
				const checkedCheckboxes = document.querySelectorAll('#cart_checkbox:checked');
				let checkedCount = checkedCheckboxes.length;
				document.getElementById("checked_count").innerText = checkedCount;
				
				// 전체 선택/해제 체크박스의 이벤트 핸들러를 등록합니다.
				checkboxAll.addEventListener("click", selectAllCheckboxes);

				// 각각의 cart_checkbox가 클릭되었을 때 이벤트 핸들러를 등록합니다.
				checkboxes.forEach(checkbox => {
					checkbox.addEventListener("click", function() {
						// 체크된 체크박스 개수를 업데이트합니다.
						checkedCount = document.querySelectorAll('#cart_checkbox:checked').length;
						document.getElementById("checked_count").innerText = checkedCount;
						
						// 모든 cart_checkbox가 선택되었을 때만 cart_checkbox_all이 선택되어 있도록 설정합니다.
						checkboxAll.checked = checkedCount === checkboxes.length;
						
						// 하나라도 cart_checkbox의 체크가 해제되면, cart_checkbox_all도 체크가 해제되게 합니다.
						if (checkedCount < checkboxes.length) {
						  checkboxAll.checked = false;
						}
					});
				});
			}
			
			// 전체 선택/해제 체크박스에 대한 이벤트 핸들러 함수
			function selectAllCheckboxes() {
				// 전체 선택/해제 체크박스가 체크되면 모든 체크박스를 선택하고,
				// 체크 해제되면 모든 체크박스를 해제합니다.
				const checkboxes = document.querySelectorAll("#cart_checkbox");
				for (let i = 0; i < checkboxes.length; i++) {
					checkboxes[i].checked = document.getElementById("cart_checkbox_all").checked;
				}
				
				// 모든 체크박스를 해제하는 경우, checkedCount 값도 0으로 업데이트합니다.
				if (!document.getElementById("cart_checkbox_all").checked) {
	  				checkedCount = 0;
	  				document.getElementById("checked_count").innerText = checkedCount;
				} else {
	  				checkedCount = checkboxes.length;
	  				document.getElementById("checked_count").innerText = checkedCount;
				}
			}
			</script>
			
			<!-- ======================  구매할 제품 선택하는 체크박스 .js 끝	======================  -->
			
			<%
		    ArrayList<CartInfo> cartinfo = (ArrayList<CartInfo>) request.getAttribute("cartdirect_arr");
		
		    int shop_bas_prod_num;
		    String prod_name;
		    int prod_quantity;
		    int prod_price;
		    String prod_mem_id;
		
		    int total_price=0;
		    int prod_total_price=0;
		
		    for(int i=0; i<cartinfo.size(); i++) {
		
		        shop_bas_prod_num = cartinfo.get(i).getShop_bas_prod_num();
		        prod_name = cartinfo.get(i).getShop_bas_prod_name();
		        prod_quantity= cartinfo.get(i).getShop_bas_prod_quantity();
		        prod_price = cartinfo.get(i).getShop_bas_prod_price();
		        prod_mem_id = cartinfo.get(i).getShop_bas_prod_name();
		
		        prod_total_price = prod_price * prod_quantity ;   
		        total_price += prod_total_price; // 전체 상품 가격 누적
		%>
			
        <tr class="s_basket_prod">
                <td><input type="text" name="shop_bas_num" value="<%=shop_bas_prod_num %>" > </td>
                <td><input type="text" name="prod_quantity" value="<%=prod_quantity %>" > </td>
                <td><input type="text" name="prod_price" value="<%=prod_price %>" > </td>
                <td><input type="checkbox" id="cart_checkbox" onchange="updateCheckedCount(this)" "  ></td>
                <td><%=prod_name %></td>
                <td>옵션</td>
                <td><%=prod_price %></td>
                <td><%=prod_quantity %></td>
                
                <td>할인/적립</td>
                <td><%=prod_total_price %></td>
                
                
                <td>
                    <a href="shopping_cart_delete.do?shop_bas_prod_num=<%=shop_bas_prod_num %>"
                       onclick="return confirm('해당 제품을 삭제하시겠습니까?')">삭제</a>
                </td>
                
        
        </tr>
        
    <%} %>
	</table>
    
    <div id="shopping_total_price_info_wrap" >
    
        <div class="shopping_total_price_info" >
	            <div class="total_price_info" ><span>총 판매가:   </span><%=total_price %>원</div>
	            
	            <div class="total_price_info" >총 할인금액</div>
	            
	            <div class="total_price_info" ><span>배송비</span><%
	            	if(total_price >= 2000000) { %>
	            		<span>무료</span>
	            <% 	} else { %>
	            		<span>3000원</span>
	            <% }     %></div>
        </div>
            
        <div class="sum_price" >
            <span style="font-size: 20px;" >배송비는 쿠폰할인금액에 따라 변경될 수 있습니다.</span>
            
            <span id="total_price" style="font-size: 18px;" >총 결제예상금액 : <%=total_price %>원
            
<%--             <% if(total_price >= 2000000) { %> --%>
<%--                 배송비무료:  <%=total_price %> --%>
<%--             <% } else { %> --%>
<%--                 배송비추가:  <%= 3000 + total_price %> --%>
<%--             <% } %> --%>
            
             </span> 
        </div>
            
		<div id="order_btn_wrap" >
			<button type="submit" >선택주문(<span id="checked_count">0</span>)</button>
			<button>전체주문</button>
		</div>
		
	</div>
	
</form>
	
</section>
	


	<footer>
    	<jsp:include page="footer.jsp"/>
	</footer>
	
	<script>
	// 모든 체크박스의 변경 이벤트를 감지
	$('input[id="cart_checkbox" ]').on('change', function() {

	  // 선택된 모든 체크박스의 값을 합산하여 변수에 저장
	  var sum = 0;
	  $('input[id="cart_checkbox"]:checked').each(function() {
	    sum += parseFloat($(this).data('price'));
	  });

	  // 총합을 표시하는 요소에 값을 반영
	  $('#total_price').text(sum.toFixed(2));

	});
	


// 	// 선택된 상품의 가격 총합을 업데이트하는 함수
// 	  function updateTotalPrice() {
// 	    document.getElementById("checked_count").innerText = checkedCount;
// 	    document.getElementById("total_price").innerText = totalPrice;
// 	  }
	
// 총 상품 가격 계산 함수
// function updateCount() {
//     var checkboxes = document.getElementsByName("cart_checkbox");
//     var totalPrice = 0;
    
//     for (var i = 0; i < checkboxes.length; i++) {
//         if (checkboxes[i].checked) {
//             var prod_price = checkboxes[i].parentNode.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.innerHTML;
//             var prod_quantity = checkboxes[i].parentNode.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.innerHTML;
//             var prod_total_price = prod_price * prod_quantity;
//             totalPrice += prod_total_price;
//         }
//     }
    
//     document.querySelector(".sum_price span:last-of-type").innerHTML = "총 결제예상금액 " + totalPrice + "원";
// }


</script>

</body>

</html>