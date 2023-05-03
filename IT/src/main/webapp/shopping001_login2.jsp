<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTf-8"%>

<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>쇼핑메인</title>
	
	<%@page import="dao.N_controller" %>
	
	<%@page import ="dto.N_MD" %>
	<%@page import="dto.Join_MD" %>
	<%@page import="dto.Login_MD" %>

	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

	 <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
	 
	 
	 <!-- css -->
	 <link rel="stylesheet" type="text/css" href="css/shopping001.css">	 
	 <link rel="stylesheet" type="text/css" href="css/shopping001_midbn2.css">
	 <link rel="stylesheet" type="text/css" href="css/header_footer.css">
	 
	 
	 <!-- 헤더 js -->
	 <script src="js/slick-1.8.1/slick/slick.min.js"></script>
	 <script src="js/flight.js"></script>
	 
	 <!-- js -->
	 <script src="js/shopping_bn.js"></script>
	 

</head>


	 <jsp:useBean id="user" class="dao.N_controller"/>

<%


String mem_id = request.getParameter("mem_id");  //로그인 창에서 입력받은 아이디
String mem_pw = request.getParameter("mem_pw"); //로그인 창에서 입력받은 비밀번호

//user.login(mem_id,mem_pw); //회원가입에 입력받은 데이터들 있는 곳 
//어떡해어떡해 어떡해 어떡해ArrayList<Join_md> joinmd = new ArrayList<> ();
//Login_MD loginmd = new Login_MD();
//loginmd = user.login(mem_id, mem_pw);

//user.login(request.getParameter("mem_id"),request.getParameter("mem_pw")); 


      session.setAttribute("IDa",mem_id);
      session.setAttribute("PASSWORDa",mem_pw);
      //String으로 설정한 id를 다시 "IDa"로 설정한거. 이해 잘되게 일부러 다르게 설정해놓았음

      // 뒤파일 login3.jsp 에서 가져올 때는 session.getAttribute("key값") 으로 하면 된다.   ??
      %>


<body>

<!--헤더부분-->

	 <header style="border-bottom: 1px solid rgb(224, 224, 224);">
            
            <div class="hdwrap1">
                <div class="ftwrap1"><a href="mainindex.jsp"><img src="./mainindeximgs/logo.png" height="90px"style="padding-left: 20px"  ></a>
                    <div class="ftwrap2"></div>
                    <div class="search-wrapper active">
                      <div class="input-holder">
                          <input type="text" class="search-input" placeholder="검색어를 입력해주세요." />
                          <button class="search-icon" onclick="searchToggle(this, event);"><span></span></button>
                      </div>
                      <!-- <span class="close" onclick="searchToggle(this, event);"></span> -->
                  </div>
                    <div class="topwrap1">
                      <ul>
                        <li><a href="N_list.jsp">고객센터</a></li>
                        <li><%=mem_id %>님 환영합니다 </li>
                       
                      </ul>
                    </div>
                  </div> 
          </div>
          <div class="hdwrap2">
          <div class="menuwrap1">
            <ul>
              <li class="menulist1"> <a href="#" class="menu"><img src="./mainindeximgs/ico-hamburgermenu.png" alt=""> &nbsp&nbsp&nbsp&nbsp전체 메뉴 </a></li>
              <li class="menulist2"> <a href="./travelplan.html" class="menu"> 여행지추가</a> </li>
              <li class="menulist3"> <a href="./trave_scg_mng.html" class="menu"> 일정짜기 </a> </li>
              <li class="menulist4"> <a  class="menu" href="./flight.html"> 항공예약 </a></li>
              <li class="menulist5"><a  class="menu" href="./tour002.html"> 투어예약 </a></li>
              <li class="menulist6"> <a href="#" class="menu"> 소셜 </a></li>
              <li class="menulist7"><a class="menu" href="shopping001.jsp" > 쇼핑 </a></li>
              <li class="menulist8"><a href="#" class="menu"> 커뮤니티 </a></li>
              </ul>
        </div>
      </div>
   
             <div class="menuwrap2">
      <div class="menuwrap3">
       <ul class="s_menu">
         <li>
             <a>여행지 추가</a>
         </li>
         <!-- <li>
             <a>여행지 목록</a>
         </li>
         <li>
             <a>할리치노 · 빙수</a>
         </li>
         <li>
             <a>스파클링</a>
         </li>
         <li>
             <a>푸드</a>
         </li>
         <li>
             <a>MD상품</a>
         </li>
         <li>
             <a>MD식품</a>
         </li> -->
     </ul>

     <ul class="s_hollysmall">
         <li>
             <a>일정짜기</a>
         </li>
         <!-- <li>
             <a>할리스카드</a>
         </li>
         <li>
             <a>E-Store</a>
         </li>
         <li>
             <a>구매내역</a>
         </li> -->
     </ul>

     
     <ul class="s_membership">
      <li>
          <a>항공 홈</a>
      </li>
      <li>
          <a> 항공권 예매</a>
      </li>
      <li>
         <a>내 항공권 조회</a>
     </li>
  </ul>
  
  <ul class="s_hollysnews">
      <li>
          <a>투어 홈</a>
      </li>
      <li>
          <a>국내</a>
      </li>
      <li>
         <a>해외</a>
     </li>
  </ul>

  <ul class="s_store">
      <li>
          <a>소셜 홈</a>
      </li>
      <li>
         <a>글 작성</a>
     </li>
     <li>
         <a>내 피드</a>
     </li>
  </ul>

  
  <ul class="s_hollysis">
      <li>
          <a href="#">쇼핑 홈</a>
      </li>
      <li>
          <a>캐리어</a>
      </li>
      <li>
          <a>여행용품</a>
      </li>
      <li>
          <a>잡화</a>
      </li>
   </ul>



      <ul class="s_community">
        <!-- <li>
          <a>중고장터</a>
      </li> -->
      <li>
          <a>커뮤니티</a>
      </li>
     </ul>


      </div>
     
   </div>

   <!-- <div class="menuwrap4">
    <div class="menuwrap5">
      <ul>
        <li> 여행지 홈 </li>
        <li>여행지 추천</li>
        <li>인기별 여행지</li>
        <li>특색 여행지</li>
      </ul>
    </div>
   </div>

   <div class="menuwrap6">
    <div class="menuwrap7">
      <ul>
        <li>일정짜기 홈</li>
        <li> 새 일정 짜기</li>
      </ul>
    </div>
   </div> -->

   <div class="menuwrap8">
    <div class="menuwrap9">
      <ul>
        <li> <a href="./flight.html"> 항공 홈 </a></li>
        <li>항공권 예매</li>
        <li> 내 항공권 조회</li>
      </ul>
    </div>
   </div>
   
   <div class="menuwrap10">
    <div class="menuwrap11">
      <ul>
        <li></li>
        <li> <a href="./tour002.html">투어 홈 </a></li>
        <li> 국내 </li>
        <li> 해외 </li>
      </ul>
    </div>
   </div>

   <div class="menuwrap12">
    <div class="menuwrap13">
      <ul>
        <li>소셜 홈</li>
        <li>글 작성</li>
        <li>내 피드</li>
      </ul>
    </div>
   </div>

   <div class="menuwrap14">
    <div class="menuwrap15">
      <ul>
        <li>쇼핑 홈</li>
        <li>배낭</li>
        <li>잡화</li>
        <li>캐리어</li>
      </ul>
    </div>
   </div>
<!-- 
   <div class="menuwrap16">
    <div class="menuwrap17">
      <ul>
        <li>커뮤니티 홈</li>
        <li>중고장터</li>
        <li>커뮤니티</li>
       
      </ul>
    </div>  -->
          
    </header>
    

	

	<section>

		

		 <div class="slideshow-container"> <!--광고배너 이미지 3개 -->

		     <div class="mySlideDiv fade active">
		        <a href="#"><img src="./shopimg/banner1.jpg" style="width: 1920px; height: 500px; margin-left: -320px;"></a>
		     </div>
		            
		     <div class="mySlideDiv fade">
		         <a href="#"><img src="./shopimg/banner2.jpg" style="width: 1920px; height: 500px; margin-left: -320px;"></a>
		     </div>
		            
		     <div class="mySlideDiv fade">
		        <a href="#"><img src="./shopimg/banner3.jpg" style="width: 1920px; height: 500px; margin-left: -320px;"></a>
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
							<a href="#"><img style="width: 300px; height: 300px; " src="./shopimg/8333838875811647-0b0324b6-4469-4cb2-afaf-fe18192679ac.jpg"></a>
						</li>

						<li>
							<a href="#"><img style="width: 300px; height: 300px;" src="./shopimg/캐리어4.jpg"></a>
						</li>
						<li>
							<a href="#"><img style="width: 300px; height: 300px;" src="./shopimg/캐리어10.jpg"></a>
						</li>

						<li>
							<a href="#"><img style="width: 300px; height: 300px;" src="./shopimg/db972b0e08c7e2484bff82d75c1469fe.jpg"></a>
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
							<a href="#"><img style="width: 300px; height: 300px; " src="./shopimg/캐리어6.jpg"></a>
						</li>

						<li>
							<a href="#"><img style="width: 300px; height: 300px;" src="./shopimg/2_afternoon_0823.jpg"></a>
						</li>

						<li>
							<a href="#"><img style="width: 300px; height: 300px;" src="./shopimg/plg561274_TGJZB2110.jpg"></a>
						</li>

						<li>
							<a href="#"><img style="width: 300px; height: 300px;" src="./shopimg/93fcf87ffff120cb79d5d2c448fd3129.jpg"></a>
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
							<a href="#"><img style="width: 400px; height: 400px;" src="./shopimg/6e34c4cf67116b18a600247a06936540.jpg"></a>
						</li>

						<li>
							<a href="#"><img style="width: 400px; height: 400px;" src="./shopimg/6e57b61d8452ef1466fe69e4e3a02723.jpg"></a>
						</li>
					
						<li>
							<a href="#"><img style="width: 400px; height: 400px;" src="./shopimg/ddc5e8ba1569f41b61eaf9b0093dac65.jpg"></a>
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
							<a href="#"><img style="width: 400px; height: 400px;" src="./shopimg/6640b6e4b4db6a4f47db40865910e61b.jpg"></a>
						</li>

						<li>
							<a href="#"><img style="width: 400px; height: 400px;" src="./shopimg/캐리어2.jpg"></a>
						</li>
					
						<li>
							<a href="#"><img style="width: 400px; height: 400px;" src="./shopimg/2_afternoon_0823.jpg"></a>
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
				      <a href="#"><img style="width: 1920px; height: 200px;" src="./shopimg/midbn5.jpg"></a>
				    </li>
				
				    <li>
				      <a href="#"><img style="width: 1920px; height: 200px;" src="./shopimg/midbn6.jpg"></a>
				    </li>
				
				    <li>
				      <a href="#"><img style="width: 1920px; height: 200px;" src="./shopimg/midbn7.jpg"></a>
				    </li>
				
				   <!--  <li>
				      <a href="#"><img style="width: 1920px; height: 200px;" src=".\midbn4.jpg"></a>
				    </li> -->
				    
				  </ul>
				
				  <div class="btn">
				
				    <button type="button" id="prev"><</button>
				    <button type="button" id="next">></button>
				  </div>


		</div>





</div>


				<!-- /////////////////////////////2번째 광고 배너 -->

			<div id="curation_item">

				<p id="curation_txt">고객님을 위한 It Travel 추천상품</p>
			
				<div class="menu1">

					<ul class="img_ul" >
						
						<li>
							<a href="#"><img style="width: 300px; height: 300px;" src="./shopimg/캐리어8.jpg"></a>
						</li>

						<li>
							<a href="#"><img style="width: 300px; height: 300px;" src="./shopimg/plg39158_2679.jpg"></a>
						</li>
					
						<li>
							<a href="#"><img style="width: 300px; height: 300px;" src="./shopimg/plg57412_FP1287318_001.jpg"></a>
						</li>

						<li>
							<a href="#"><img style="width: 300px; height: 300px;" src="./shopimg/1f8bb0410cb513db002bcce7a144823d.jpg"></a>
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
							<a href="#"><img style="width: 300px; height: 300px;" src="./shopimg/캐리어.jpg"></a>
						</li>

						<li>
							<a href="#"><img style="width: 300px; height: 300px;" src="./shopimg/c8816a2b480b400b932513b53171f9fb.jpg"></a>
						</li>
					
						<li>
							<a href="#"><img style="width: 300px; height: 300px;" src="./shopimg/2525201721870054-d82127cc-889a-420e-9f10-ff02f2a1db7b.jpg"></a>
						</li>

						<li>
							<a href="#"><img style="width: 300px; height: 300px;" src="./shopimg/0a5912463c93468c3a7cfd81825aa8cbff69e1e2ed62bd5265d2948183e7.jpg"></a>
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
							<a href="#"><img style="width: 300px; height: 300px;" src="./shopimg/84af9dae741efa18dc18af0b9d8161c3f75b4d7ee99b004cab083c8830d7.jpg"></a>
						</li>

						<li>
							<a href="#"><img style="width: 300px; height: 300px;" src="./shopimg/e47050ea76f343deb83b9e11fbad5b65.jpg"></a>
						</li>
					
						<li>
							<a href="#"><img style="width: 300px; height: 300px;" src="./shopimg/4073653331555488-57fdf6f9-ecd8-4e70-9798-cb7a00ed22dd.jpg"></a>
						</li>

						<li>
							<a href="#"><img style="width: 300px; height: 300px;" src="./shopimg/3184297fff544806b4e83d6ae3d1ab83.jpg"></a>
						</li>
						
					</ul>

					<ul class="info_ul">
						<li>설명</li>
						<li>설명</li>
						<li>설명</li>
						<li>설명</li>
					</ul>

				</div>


			</div>



			<!-- ////////////////////////////////////// -->



			

				
		


		 <!-- allmenu 끝-->

	</section>



	<footer>
    	<jsp:include page="footer.jsp"/>
	</footer>


</div>
</body>

</html>