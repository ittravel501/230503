<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@page import = "java.util.ArrayList" %>
    <%@page import= "vo.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑 상품 전체보기</title>

<link rel="stylesheet" type="text/css" href="css/shopping_prod_all.css">

<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>	
<script src="js/shopping_prod_all.js"></script>

</head>

<jsp:include page="header.jsp" />
<body>



<section>
<div class="shopping_prod_all_wrap" >


		<!-- ////////////////////// 퀵메뉴 시작 ////////////////// -->
		<div id="shopping_quickmenu_wrap" >
				<div class="s_quickmenu" >
<!-- 					<a href="shopping_cart_direct.do" ><img alt="cartimg" src="shopimg/cart.png" style="width: 50px; height: 50px;" >장바구니</a> -->
					<a href="shopping_cart.do" ><img alt="cartimg" src="shopimg/cart.png" style="width: 50px; height: 50px;" >장바구니</a>
				</div>
				
				<div class="s_quickmenu">
					<a href="" ><img alt="hartimg" src="shopimg/jim.png" style="width: 50px; height: 50px;" >찜 목록</a>
				</div>
				
				<div class="s_quickmenu">
					<a href="shopping_prod_all.do" >전체보기</a>
				</div>
		</div>
		
		<script>
		var shoppingQuickmenu = document.getElementById("shopping_quickmenu_wrap");
		var originalPosition = shoppingQuickmenu.offsetTop;

		window.addEventListener("scroll", function() {
		  var scrollPosition = window.scrollY;
		  
		  if (scrollPosition >= originalPosition) {
			  shoppingQuickmenu.classList.add("sticky");
			  shoppingQuickmenu.style.top = "150px";

		  } else {
		    shoppingQuickmenu.classList.remove("sticky");
		    shoppingQuickmenu.style.top = originalPosition + "px";
		  }
		});
		
		</script>
		<!-- ////////////////////// 퀵메뉴 끝 //////////////////// -->
		
		
		<!-- 	///////////////////////  탑메뉴 시작  ////////////////////////// -->
		<div id="shopping_topmenu_wrap"  >
			<div id="shopping_topmenu" >
				<ul>
					<li id="luggage" >캐리어</li>
					<li id="bags" >가방</li>
					<li id="goods" >여행용품</li>
					<li id="outlet" >아울렛</li>
				</ul>				
			</div>
		</div>
			
			<script>
			var shoppingTopmenu = document.getElementById("shopping_topmenu_wrap");
			var originalPositionTop = shoppingTopmenu.offsetTop;
	
			window.addEventListener("scroll", function() {
			  var scrollPosition = window.scrollY;
			  
			  if (scrollPosition >= originalPositionTop) {
				  shoppingTopmenu.classList.add("sticky");
				  shoppingTopmenu.style.top = "0px";
	
			  } else {
				  shoppingTopmenu.classList.remove("sticky");
				  shoppingTopmenu.style.top = originalPositionTop + "px";
			  }
			});
			
			</script>
			
			<!-- 	///////////////////////  탑메뉴 끝  ////////////////////////// -->
			
			<div>
				<select>
					<option>추천순</option>
					<option>인기순</option>
					<option>구매순</option>
					<option>리뷰순</option>
				</select>
			</div>
			
		<!-- ///////////////////// 전체메뉴 시작 /////////////////// -->
		
		<div class="shopping_prod_all_wrap" >
			<div id="shopping_prod_all" >
	
				<%
				// 	ArrayList<ProdInfo> prod_all = (ArrayList<ProdInfo>) request.getAttribute("prod_all");
				ArrayList<ProdInfo> prod_all = (ArrayList<ProdInfo>)session.getAttribute("articlemain");
				
				for(int i =0; i<prod_all.size() ; i++ ) {
					
					String prodImgPath = "shopimg/" + prod_all.get(i).getProd_img();
				
					//int prod_num = prodinfo.get(i).getProd_num();
					//String prod_name = prodinfo.get(i).getProd_name();
					//String prod_img = prodinfo.get(i).getProd_img();
							
				%> 
		
				<div id="prod_wrap" >
				
					<ul class="img_ul">
						<li>
							<a href="shopping_prod.do?prod_num=<%=prod_all.get(i).getProd_num() %>">
								<img style="width: 240px; height: 240px; " src=<%=prodImgPath %>>
							</a>
						</li>
					</ul>
					
					<ul class="info_ul">
						<li><%=prod_all.get(i).getProd_name() %></li>
					</ul>
				
				</div>
				
				<%
				}
				%>
			
			</div>
		</div>
		<!-- ///////////////////// 전체메뉴 끝 /////////////////// -->
		
		

</div>
</section>

<footer>
<jsp:include page="footer.jsp"/>
</footer>

</body>
</html>