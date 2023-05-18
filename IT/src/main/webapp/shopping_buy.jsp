<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import = "java.util.ArrayList" %>
    
    
    <%@page import="vo.JoinVO" %>
    <%@page import="vo.ProdInfo" %>
    <%@page import="vo.OrderInfo" %>
    <%@page import="vo.CartInfo" %>
    
    <%@page import="dao.OrderDao" %>
    <%@page import="dao.UserDao" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제하기</title>

<link rel="stylesheet" href="css/shopping_buy.css">
</head>

<body>


<header>
	   <jsp:include page="header.jsp" />
</header> 

<%

// 	int prod_num = Integer.parseInt(request.getParameter("prod_num")); //오더 디비 처리하는 곳에다가 넣을 것
// 	String prod_mem_id = request.getParameter("prod_mem_id"); //오더 디비 처리하는 곳에다가 넣을 것

	OrderInfo orderinfo = (OrderInfo) request.getAttribute("order_article"); //이게 회원가입정보 가져오는 받아오는 것. 
	String ord_mem_addr1 = orderinfo.getOrd_mem_addr1();
	String ord_mem_addr2 = orderinfo.getOrd_mem_addr2();
	String ord_mem_addr3 = orderinfo.getOrd_mem_addr3();
	String ord_mem_addr4 = orderinfo.getOrd_mem_addr4();
	
	String ord_mobile1 = orderinfo.getOrd_mobile1();
	String ord_mobile2 = orderinfo.getOrd_mobile2();
	String ord_mobile3 = orderinfo.getOrd_mobile3();
	String ord_mobile4 = orderinfo.getOrd_mobile4();
	
// 	String ord_mem_id = orderinfo.getOrd_mem_id();
// 	String mem_name = orderinfo.getOrd_name();
	

		


%>



<%-- prod_quantity: <%=prod_quantity %><br> --%>
<%-- prod_price: <%=prod_price %> --%>

<section>


	<div id="shopping_buy_wrap" >

		<div id="s_order" >
			<ul>
				<li>01장바구니</li>>
				<li>02주문서작성/결제</li>>
				<li>03주문완료</li>
			</ul>		
		</div>
	
		<div style="margin: 20px 20px;" >
		
		<%
			String mem_id = (String) session.getAttribute("mem_id");
			String mem_name = (String)session.getAttribute("mem_name");
			String mem_mobile = (String)session.getAttribute("mem_mobile");
			
// 			int prod_quantity = Integer.parseInt(request.getParameter("prod_quantity"));
// 			int prod_price = Integer.parseInt(request.getParameter("prod_price"));
			
	 		//String ord_addr = (String)session.getAttribute("mem_addr");
			
			
		%>
		

		
<%-- 		제품번호랑 주문번호: <%=prod_num %><br> --%>
		주문자 아이디 : <%=mem_id %><br>
		
		전화번호 1 통신사 : <%=ord_mobile1 %><br>
		전화번호 2 : <%=ord_mobile2 %><br>
		전화번호 3 : <%=ord_mobile3 %><br>
		전화번호 4 : <%=ord_mobile4 %><br>
		
		주소1:<%=ord_mem_addr1 %><br>
		주소2:<%=ord_mem_addr2 %><br>
		주소3:<%=ord_mem_addr3 %><br>
<%-- 		수량:<%=prod_quantity %><br> --%>	
<%-- 		가격:<%=prod_price %> --%>
		
		
		</div>

			<form action="shopping_complete.do" >

<%-- 				<input type="hidden" name="prod_num" value="<%=prod_num %>" style="width: 100px;">--%>
<%-- 					 <input type="hidden" name="prod_quantity" value="<%=prod_quantity %>"style="width: 100px">  --%>
					 <input type="hidden" name="prod_mem_id" value="<%=mem_id %>" style="width: 100px">
<%-- 					<input type="hidden" name="prod_price" value="<%=prod_price %>" style="width: 100px" > --%>

				<div id="shopping_pay_wrap">

					<div id="order_addr_wrap">

						<div id="order_addr_title">
							<h2>배송지 정보</h2>
						</div>

						<div id="order_addr_con">
							<table class="shopping_addr_info">

								<tr>
									<th>배송지선택</th>
									<td><input type="radio" name="mem_addr" value="기존 배송지">기존
										배송지 <input type="radio" name="mem_addr">신규 배송지</td>
								</tr>

								<tr>
									<th>받는 분</th>

									<td><input type="text" name="mem_name" id="mem_name_input"
										value="<%=mem_name %>"> <input type="checkbox"
										id="same_as_orderer" onchange="toggleInput()">주문자와 동일
									</td>
								</tr>

								<tr>
									<th>연락처</th>
									<td><input type="text" name="mem_mobile1"
										class="ord_mobile_size" value="<%=ord_mobile2 %>"> -
										<input type="text" name="mem_mobile2" class="ord_mobile_size"
										value="<%=ord_mobile3 %>"> - <input type="text"
										name="mem_mobile3" class="ord_mobile_size"
										value="<%=ord_mobile4 %>"></td>
								</tr>

								<tr>
									<th>주소</th>
									<td><input type="text" name="mem_addr1"
										id="sample6_postcode" placeholder="우편번호" size="35" readonly
										value="<%=ord_mem_addr1 %>"> <input type="button"
										onclick="sample6_execDaumPostcode()" name="" value="우편번호 검색"
										style="background-color: #7E7DCB; color: white; padding: 0 20px; border-radius: 5px; margin-left: 5px; height: 30px;
    border-style: none;"><br>

										<input type="text" name="mem_addr2" id="sample6_address"
										placeholder="주소" name="address" size="35"
										style="margin-top: 3px" value="<%=ord_mem_addr2 %>" readonly><br>
										<input type="text" name="mem_addr3" id="sample6_detailAddress"
										placeholder="상세주소" style="margin-top: 3px" size="16"
										value="<%=ord_mem_addr3 %>"> <input type="text"
										name="mem_addr4" id="sample6_extraAddress" placeholder="참고항목"
										size="15" style="margin-top: 3px" value="<%=ord_mem_addr4 %>">
									</td>

									<td></td>
								</tr>

							</table>
						</div>
					</div>

					<script>
			  function toggleInput() {
			    const memNameInput = document.getElementById("mem_name_input");
			    const sameAsOrdererCheckbox = document.getElementById("same_as_orderer");
			    
			    if (sameAsOrdererCheckbox.checked) {
			      memNameInput.value = "<%=mem_name %>";
			    } else {
			      memNameInput.value = "";
			    }
			  }
			</script>


					<div id="order_ask_wrap">

						<div id="order_ask_title">
							<h2>배송 요청사항</h2>
						</div>

						<div id="order_ask_con">

							<table class="shopping_addr_info">

								<tr>
									<th>배송 메시지</th>

									<td>
										<!-- <input type="checkbox" value="" >  --> <select
										name="ord_ask" onchange="showAskDetail()" style="height: 35px; width: 50%;" >
											<option>배송메시지를 선택해주세요.</option>
											<option>부재시 경비실에 맡겨주세요.</option>
											<option>부재시 문앞에 놓아주세요.</option>
											<option>파손의 위험이 있는 상품이오니, 배송시 주의해주세요.</option>
											<option>배송 전에 연락주세요.</option>
											<option>택배함에 넣어주세요.</option>
											<option>직접 입력하기</option>

									</select>

									</td>
								</tr>

								<tr id="askDetailRow" style="display: none">
									<th>기타상세내용</th>
									<td><input type="text" id="ord_ask_detail"
										name="ord_ask_detail" value=""></td>
								</tr>

							</table>

							<script>
							  function showAskDetail() {
							    var askSelect = document.getElementsByName("ord_ask")[0];
							    var askDetailRow = document.getElementById("askDetailRow");
							    if (askSelect.value === "직접 입력하기") {
							      askDetailRow.style.display = "table-row";
							    } else {
							      askDetailRow.style.display = "none";
							    }
							  }
							</script>

						</div>

					</div>

					<div id="order_payway">

						<div id="order_payway_title">
							<h2>결제수단 선택</h2>
						</div>

						<div id="order_payway_wrap">

							<div id="order_radio_wrap">
								<div class="payway_class">
									<input type="radio" name="payway" value="신용카드">신용카드
								</div>
								<div class="payway_class">
									<input type="radio" name="payway" value="무통장입금">무통장입금
								</div>
								<div class="payway_class">
									<input type="radio" name="payway" value="카카오페이">카카오페이
								</div>
								<div class="payway_class">
									<input type="radio" name="payway" value="네이버페이">네이버페이
								</div>
								<div class="payway_class">
									<input type="radio" name="payway" value="휴대폰결제">휴대폰결제
								</div>
								<div class="payway_class">
									<input type="radio" name="payway" value="문화상품권">문화상품권
								</div>
							</div>
							
							<script>
  
							</script>
							
							
							<div class="wrap_all" id="wrap_all" >
							<table id="credit_card_wrap" >
								<tr>
									<th>신용카드</th>

									<td><select id="card_company_select" name="card_select">
											<option>-</option>
											<option value="국민카드">국민카드</option>
											<option value="신한카드">신한카드</option>
											<option value="삼성카드">삼성카드</option>
											<option value="하나카드">하나카드</option>
											<option value="롯데카드">롯데카드</option>
									</select></td>
								</tr>

								<tr>
									<th>할부종류</th>
									<td><select name="card_installment" style="width: 20%; height: 35px;" >
											<option value="-">-</option>
											<option value="일시불">일시불</option>
											<option value="2개월">2개월</option>
											<option value="3개월">3개월</option>
											<option value="4개월">4개월</option>
											<option value="5개월">5개월</option>
											<option value="6개월">6개월</option>
									</select></td>
								</tr>


							</table>

<!-- 							<div id="paymethod2_wrap"> -->
<!-- 								<div> -->
<!-- 									<label for="without_bankbook">은행명</label> <select -->
<!-- 										id="without_bankbook" name="paymethod2"> -->
<!-- 										<option>-</option> -->
<!-- 										<option>기업</option> -->
<!-- 										<option>국민</option> -->
<!-- 										<option>농협</option> -->
<!-- 										<option>수협</option> -->
<!-- 										<option>우리</option> -->
<!-- 										<option>하나</option> -->
<!-- 										<option>신한</option> -->
<!-- 									</select> -->
<!-- 								</div> -->

<!-- 								<div> -->
<!-- 									<label>입금기한</label> -->
<!-- 									<div> -->
<!-- 										<input type="text" id="deposit_deadline"> -->
<!-- 									</div> -->
<!-- 								</div> -->

<!-- 								<script> -->
<!-- // 								  // 현재 시간에서 24시간을 더한 시간 계산 -->
<!-- // 								  const now = new Date(); -->
<!-- // 								  const expiryTime = new Date(now.getTime() + 24 * 60 * 60 * 1000); -->
								
<!-- // 								  // input의 value 속성에 시간 할당 -->
<!-- // 								  const input = document.getElementById('deposit_deadline'); -->
<!-- // 								  input.value = expiryTime.toLocaleString();  // 날짜 포맷을 설정할 수 있습니다. -->
<!-- 								</script> -->

<!-- 								<div> -->
<!-- 									입금자명 -->

<%-- 									<%=ord_name %> --%>

<!-- 								</div> -->

<!-- 							</div> -->

<!-- 							<div id="kakaopay_wrap"> -->
<!-- 								<div id="kakaopay_note"> -->
<!-- 									<span> 무이자할부는 카카오페이 모바일 결제창에서 선택하실 수 있습니다. 휴대폰과 카드명의자가 -->
<!-- 										동일해야 결제 가능합니다. 카카오페이 결제 시, 제휴카드 할인/적립(CJ카드, CJ iD카드, 임직원할인 -->
<!-- 										포함)이 적용되지 않습니다. 카드 영수증 및 현금영수증 확인은 카카오페이 홈페이지에서 확인 -->
<!-- 										가능합니다.(카카오페이 홈 > 설정 > 결제내역) 카카오페이 고객센터 : 1644-7405 </span> -->
<!-- 								</div> -->
<!-- 							</div> -->

						</div>
						
						</div>
					</div>


					<div id="pay_wrap">
						<input type="submit" value="결제하기">
					</div>

				</div>

			</form>

			<!-- /////////////////결제방식 선택/////////////////////-->
		
		<script>
		
		//신용카드 클릭 시 
		    // Get the payment method and credit card company select elements
		    const paywayRadios = document.querySelectorAll('input[name="payway"]');
		    const creditCardWrap = document.getElementById('credit_card_wrap');
		
		    // Add a change event listener to the payment method radio buttons
		    for (let i = 0; i < paywayRadios.length; i++) {
		        paywayRadios[i].addEventListener('change', () => {
		            if (paywayRadios[i].value === '신용카드') {
		                creditCardWrap.style.display = 'block';
		            } else {
		                creditCardWrap.style.display = 'none';
		            }
		        });
		    }

		    //무통장입금 클릭 시 
			$(document).ready(function() {
			  $('input[name="payway"]').change(function() {
			    if ($(this).val() == '무통장입금') {
			      $('#paymethod2_wrap').show();
			    } else {
			      $('#paymethod2_wrap').hide();
			    }
			  });
			});
		    
			//카카오페이 클릭 시 
			$(document).ready(function() {
			  $('input[name="payway"]').change(function() {
			    if ($(this).val() == '카카오페이') {
			      $('#kakaopay_wrap').show();
			    } else {
			      $('#kakaopay_wrap').hide();
			    }
			  });
			});
		
		</script>
	
	</div>
	
</section>



<footer>
	   <jsp:include page="footer.jsp" />
</footer> 

</body>
</html>