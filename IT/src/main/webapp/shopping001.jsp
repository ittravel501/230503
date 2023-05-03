<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTf-8"%>

<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>쇼핑메인</title>

	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

	 <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
	 
	 <link rel="stylesheet" type="text/css" href="css/shopping001.css">
	 
	 <link rel="stylesheet" type="text/css" href="css/shopping001_midbn2.css">
	 	 
	 <link rel="stylesheet" type="text/css" href="css/header_footer.css">
	 	 
	 <!-- 헤더 js -->
	 <script src="js/slick-1.8.1/slick/slick.min.js"></script>
	 <script src="js/flight.js"></script>
	 <script src="js/shopping_bn.js"></script>

</head>


<body>

<!--헤더부분-->

	<header>
	   <jsp:include page="header.jsp" />
	</header> 
	
	<div id="section_wrap">

	<section>
	
		<div id="shopping_quickmenu_wrap" >
			<ul>
			
				<li class="s_quickmenu" >
				<a href="shopping001_basket.jsp" >장바구니</a>
				</li>
				
				<li class="s_quickmenu">
				<a href="" >찜 목록</a>
				</li>
				
				<li class="s_quickmenu">
				<a href="" >결제하기</a>
				</li>
				
			</ul>
		</div>
		
	
		 <div class="slideshow-container"> <!--광고배너 이미지 3개 -->

		     <div class="mySlideDiv fade active">
		        <a href="#"><img src="./shopimg/banner1.jpg" style="width: auto; height: 500px; margin-left: -310px;"></a>
		     </div>
		            
		     <div class="mySlideDiv fade">
		         <a href="#"><img src="./shopimg/banner2.jpg" style="width: auto; height: 500px; margin-left: -310px;"></a>
		     </div>
		            
		     <div class="mySlideDiv fade">
		        <a href="#"><img src="./shopimg/banner3.jpg" style="width: auto; height: 500px; margin-left: -310px;"></a>
		     </div>

		     <a class="prev" onclick="prevSlide()">&#10094;</a>
		     <a class="next" onclick="nextSlide()">&#10095;</a>
            
		</div> <!--광고배너 이미지 3개 -->



		<div id="allmenu"> <!-- 상품 전체 시작 -->

			<div id="hot_item"> <!-- hot item 시작 -->

				<p id="hot_txt">가장 먼저 살펴보세요</p>
			

				<div class="menu1">   <!--한줄-->


					<ul class="img_ul">

						<li>
							<a href="shopping_prod.do"><img style="width: 240px; height: 240px; " src="./shopimg/8333838875811647-0b0324b6-4469-4cb2-afaf-fe18192679ac.jpg"></a>
						</li>

						<li>
							<a href="shopping_prod.do"><img style="width: 240px; height: 240px;" src="./shopimg/캐리어4.jpg"></a>
						</li>
						<li>
							<a href="shopping_prod.do"><img style="width: 240px; height: 240px;" src="./shopimg/캐리어10.jpg"></a>
						</li>

						<li>
							<a href="shopping_prod.do"><img style="width: 240px; height: 240px;" src="./shopimg/db972b0e08c7e2484bff82d75c1469fe.jpg"></a>
						</li>

					</ul>

					<ul class="info_ul">

						<li>에스트라 아토베리어365 크림 80ml 더블 기획</li>
						<li>설명1</li>
						<li>설명2</li>
						<li>설명3</li>

					</ul>

				</div>  <!--한줄끝-->


				<div class="menu1">  <!--한줄-->


					<ul  class="img_ul">

						<li>
							<a href="#"><img style="width: 240px; height: 240px; " src="./shopimg/캐리어6.jpg"></a>
						</li>

						<li>
							<a href="#"><img style="width: 240px; height: 240px;" src="./shopimg/2_afternoon_0823.jpg"></a>
						</li>

						<li>
							<a href="#"><img style="width: 240px; height: 240px;" src="./shopimg/plg561274_TGJZB2110.jpg"></a>
						</li>

						<li>
							<a href="#"><img style="width: 240px; height: 240px;" src="./shopimg/93fcf87ffff120cb79d5d2c448fd3129.jpg"></a>
						</li>

					</ul>

					<ul class="info_ul">

						<li>설명1</li>
						<li>설명</li>
						<li>설명</li>
						<li>설명</li>

					</ul>

				</div> <!--한줄끝-->

			</div> <!-- hot item 끝 -->

			<div id="mid_bn_wrap">  <!-- 중간 배너 -->

				<div id="mid_bn1">
					<a href="#"><img src="./shopimg/bn1.jpg" style="width: 690px; height: 270px;"></a>
				</div>

				<div id="mid_bn2">
					<a href="#"><img src="./shopimg/bn2.jpg" style="width: 690px; height: 270px;"></a>
				</div>
			</div>

			

			<div id="new_item">  <!-- new item 시작-->

				<p id="new_txt">이번 주에 새로 들어왔어요</p>
			
				<div class="menu2">


					<ul class="img_ul2" >
						
						<li>
							<a href="#"><img style="width: 320px; height: 320px;" src="./shopimg/6e34c4cf67116b18a600247a06936540.jpg"></a>
						</li>

						<li>
							<a href="#"><img style="width: 320px; height: 320px;" src="./shopimg/6e57b61d8452ef1466fe69e4e3a02723.jpg"></a>
						</li>
					
						<li>
							<a href="#"><img style="width: 320px; height: 320px;" src="./shopimg/ddc5e8ba1569f41b61eaf9b0093dac65.jpg"></a>
						</li>

						
					</ul>

					<ul class="info_ul2">
						<li>설명</li>
						<li>설명</li>
						<li>설명</li>
					</ul>

				</div>

				<div class="menu2">


					<ul class="img_ul2" >
						
						<li>
							<a href="#"><img style="width: 320px; height: 320px;" src="./shopimg/6640b6e4b4db6a4f47db40865910e61b.jpg"></a>
						</li>

						<li>
							<a href="#"><img style="width: 320px; height: 320px;" src="./shopimg/캐리어2.jpg"></a>
						</li>
					
						<li>
							<a href="#"><img style="width: 320px; height: 320px;" src="./shopimg/2_afternoon_0823.jpg"></a>
						</li>

									
					</ul>

					<ul class="info_ul2">
						<li>설명</li>
						<li>설명</li>
						<li>설명</li>
					</ul>

				</div>

			</div>   <!-- new item 끝-->


			<!-- ////////////////////////////////////////////////////////////////// -->


			<div id="only_item">

				<p id="only_txt">오직 It Travel에서만 만나볼 수 있어요</p>
			
				<div id="menu1_only">


					<ul class="img_ul" >
						
						<li id="only_img_1">
							<a href="#"><img style="width: 600px; height: 690px;" src="./shopimg/84f6fd0af66bffeaa0b919728bdf64f2.jpg"></a>
							<!-- <a href="#"><img style="width: 600px; height: 350px; float: right;" src=".\10d6489541c62552c1e9dc8734adb08a.jpg"></a> -->
						</li>

						<div id="only_img_4"> 
						

							<li class="only_img_4">
								<a href="#"><img id="only_img_4_img1" src="./shopimg/f72275a3291f7513aac763041b072f1c.jpg"></a>
							</li>
						
							<li class="only_img_4">
								<a href="#"><img id="only_img_4_img2" src="./shopimg/1d602e7606901915c60d9efe96fa35d4.jpg"></a>
							</li>
	
							<li>
								<a href="#"><img style="width: 660px; height: 330px; float: right;" src="./shopimg/10d6489541c62552c1e9dc8734adb08a.jpg"></a>
							</li>

						</div>
						
					</ul>

					<!-- <ul class="info_ul" style="margin-top: 600px;">
						<li>설명</li>
						<li>설명</li>
						<li>설명</li>
						<li>설명</li>
					</ul> -->

				</div>
				</div>


				<!-- /////////////////////////////2번째 광고 배너 -->
				
			<div id="banner2">



				  <ul class="slider">
				
				    <li>
				      <a href="#"><img style="width: auto; height: 200px;" src="./shopimg/midbn5.jpg"></a>
				    </li>
				
				    <li>
				      <a href="#"><img style="width: auto; height: 200px;" src="./shopimg/midbn6.jpg"></a>
				    </li>
				
				    <li>
				      <a href="#"><img style="width: auto; height: 200px;" src="./shopimg/midbn7.jpg"></a>
				    </li>
				
				   <!--  <li>
				      <a href="#"><img style="width: 1920px; height: 200px;" src=".\midbn4.jpg"></a>
				    </li> -->
				    
				  </ul>
				
				<!--   <div class="btn">
				
				    <button type="button" id="prev"><</button>
				    <button type="button" id="next">></button>
				  </div> -->


		</div><!-- /////////////////////////////2번째 광고 배너 -->





</div>
<!-- 상품 전체 끝 -->


				

			<div id="curation_item">

				<p id="curation_txt">고객님을 위한 It Travel 추천상품</p>
			
				<div class="menu1">

					<ul class="img_ul" >
						
						<li>
							<a href="#"><img style="width: 240px; height: 240px;" src="./shopimg/캐리어8.jpg"></a>
						</li>

						<li>
							<a href="#"><img style="width: 240px; height: 240px;" src="./shopimg/plg39158_2679.jpg"></a>
						</li>
					
						<li>
							<a href="#"><img style="width: 240px; height: 240px;" src="./shopimg/plg57412_FP1287318_001.jpg"></a>
						</li>

						<li>
							<a href="#"><img style="width: 240px; height: 240px;" src="./shopimg/1f8bb0410cb513db002bcce7a144823d.jpg"></a>
						</li>
						
					</ul>

					<ul class="info_ul">
						<li>설명</li>
						<li>설명</li>
						<li>설명</li>
						<li>설명</li>
					</ul>

				</div>

				<div class="menu1">

					<ul class="img_ul" >
						
						<li>
							<a href="#"><img style="width: 240px; height: 240px;" src="./shopimg/캐리어.jpg"></a>
						</li>

						<li>
							<a href="#"><img style="width: 240px; height: 240px;" src="./shopimg/c8816a2b480b400b932513b53171f9fb.jpg"></a>
						</li>
					
						<li>
							<a href="#"><img style="width: 240px; height: 240px;" src="./shopimg/2525201721870054-d82127cc-889a-420e-9f10-ff02f2a1db7b.jpg"></a>
						</li>

						<li>
							<a href="#"><img style="width: 240px; height: 240px;" src="./shopimg/0a5912463c93468c3a7cfd81825aa8cbff69e1e2ed62bd5265d2948183e7.jpg"></a>
						</li>
						
					</ul>

					<ul class="info_ul">
						<li>설명</li>
						<li>설명</li>
						<li>설명</li>
						<li>설명</li>
					</ul>

				</div>

				<div class="menu1">

					<ul class="img_ul" >
						
						<li>
							<a href="#"><img style="width: 240px; height: 240px;" src="./shopimg/84af9dae741efa18dc18af0b9d8161c3f75b4d7ee99b004cab083c8830d7.jpg"></a>
						</li>

						<li>
							<a href="#"><img style="width: 240px; height: 240px;" src="./shopimg/e47050ea76f343deb83b9e11fbad5b65.jpg"></a>
						</li>
					
						<li>
							<a href="#"><img style="width: 240px; height: 240px;" src="./shopimg/4073653331555488-57fdf6f9-ecd8-4e70-9798-cb7a00ed22dd.jpg"></a>
						</li>

						<li>
							<a href="#"><img style="width: 240px; height: 240px;" src="./shopimg/3184297fff544806b4e83d6ae3d1ab83.jpg"></a>
						</li>
						
					</ul>

					<ul class="info_ul">
						<li>설명</li>
						<li>설명</li>
						<li>설명</li>
						<li>설명</li>
					</ul>

				</div>


			</div> <!-- curaionitem끝 -->



			<!-- ////////////////////////////////////// -->



			
		


		 <!-- allmenu 끝-->

	</section>
	
	</div>



	<footer>
    	<jsp:include page="footer.jsp"/>
	</footer>
</body>

</html>