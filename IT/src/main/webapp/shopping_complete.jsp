<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@page import="vo.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제완료</title>
<link rel="stylesheet" href="css/shopping_complete.css">
</head>
<body>
<jsp:include page="header.jsp" />

<section>
<div id="shopping_complete_wrap" >

<%
	OrderInfo orderinfo = (OrderInfo) request.getAttribute("orderinfo_select");
	String ord_date = orderinfo.getOrd_date();
	String ord_name = orderinfo.getOrd_name();
	
	String ord_mem_addr1 = orderinfo.getOrd_mem_addr1();
	String ord_mem_addr2 = orderinfo.getOrd_mem_addr2();
	String ord_mem_addr3 = orderinfo.getOrd_mem_addr3();
	String ord_mem_addr4 = orderinfo.getOrd_mem_addr4();

	String ord_mobile1 = orderinfo.getOrd_mobile1();
	String ord_mobile2 = orderinfo.getOrd_mobile2();
	String ord_mobile3 = orderinfo.getOrd_mobile3();
	
	int prod_quantity = Integer.parseInt(request.getParameter("prod_quantity"));
	int prod_price = Integer.parseInt(request.getParameter("prod_price"));
%>

	<input type="hidden" name="prod_quantity" value="<%=prod_quantity %>"	style="width: 100px">
	<input type="hidden" name="prod_price" value="<%=prod_price %>" style="width: 100px" >

	<div id="s_order" >
		<ul>
			<li>01장바구니</li>>
			<li>02주문서작성/결제</li>>
			<li>03주문완료</li>
		</ul>		
	</div>
	
	<div id="complete_txt" >
		<p id="complete_txt1" >주문이 완료되었습니다. </p>
<!-- 		<p id="complete_txt2" >주문번호: <input name="order_num"  id="order_num" value="" ></p> -->
	</div>
	
	<script>
	  // 6자리 랜덤 주문번호 생성
	  const orderNum = Math.floor(Math.random() * 900000) + 100000;
	  document.getElementById("order_num").value = orderNum;
	</script>
	
	<div>
	
		<h1 id="payment_table_title" >결제정보</h1>
		
		<table id="payment_table" >
			
			<tr>
				<th>총 상품금액</th>
				<td><%=prod_price * prod_quantity %>원</td>
			</tr>
			
			<tr>
				<th>총 할인금액</th>
				<td>-</td>
			</tr>
			
			<tr>
				<th>총 배송비</th>
				<td><%
	            	if( prod_price * prod_quantity >= 2000000) { %>
	            		<span>무료</span>
	            <% 	} else { %>
	            		<span>3000원</span>
	            <% }     %></td>
			</tr>
			
			<tr>
				<th style="font-size: 45px;" >최종 결제금액</th>
				<td style="font-size: 45px" ><%=prod_price * prod_quantity + ((prod_price * prod_quantity >= 2000000) ? 0 : 3000)  %>원</td>
			</tr>
			
		</table>
	</div>
	
<%-- 	주문일?<input type="text" size="50" value="<%=ord_date %>" > --%>
<%-- 	주소? <input type="text" size="50" value="<%=ord_mem_addr1 %>" > --%>
<%-- 	이름? <input type="text" size="50" value="<%=ord_name %>" ><br> --%>
<%-- 	번호? <input type="text" size="10" value="<%=ord_mobile1 %>" ><input type="text" size="10" value="<%=ord_mobile2 %>" ><input type="text" size="10" value="<%=ord_mobile3 %>" > --%>
	
	<div>
	
		<h1 id="payment_table_title" style="    padding-top: 30px;
    border-top: solid 1px;" >배송정보</h1>
		
		<table id="payment_table"  >
			
			<tr>
				<th>받는분</th>
				<td><%=ord_name %></td>
			</tr>
			
			<tr>
				<th>연락처</th>
				<td><%=ord_mobile1 %> - <%=ord_mobile2 %> - <%=ord_mobile3 %> </td>
			</tr>
			
			<tr>
				<th>주소</th>
				<td><%=ord_mem_addr2 %><br><%=ord_mem_addr3 %> &nbsp; <%=ord_mem_addr4 %></td>
			</tr>
			
			<tr>
				<th>공동현관출입방법</th>
				<td></td>
			</tr>
			
		</table>
	</div>
	
	<div id="button_wrap" >
		<button onclick="goToMain()" >확인</button>
	</div>
	
	<script>
		function goToMain() {
		  alert('메인 화면으로 이동합니다.');
		  window.location.href = 'shoppingmain.do';
		}
	</script>

</div>

</section>


<jsp:include page="footer.jsp" />
</body>
</html>