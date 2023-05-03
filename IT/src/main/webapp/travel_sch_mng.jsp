<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="UTf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.concurrent.TimeUnit" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>일정짜기</title>
<link rel="stylesheet" href="css/travel_sch_mng.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

</head>

<script>
	var cityName = sessionStorage.getItem("cityName");

	
</script>


<body>

	<header>
		<jsp:include page="header.jsp" />
	</header>

	<section>
<% String destination = (String) session.getAttribute("coouncity"); %>


<!-- /////////////메모팝업 시작	/////////////			 -->
<div class="background" id="memoback">
	<div class="window">
		<div class="popup" style="padding: 30px;">메모
			<div id="memo-modal" class="modal">
				<div class="modal-content" style="padding: 10px;">
					<textarea id="memo-textarea" style="margin: 10px 10px 10px 10px; border: none; width: 500px; height: 400px; top: 50%;"
					placeholder="잊기 쉬운 정보들을 메모하세요. " autofocus></textarea>
					<div class="confirmnclose">
						<div class="close" onclick="addMemo()" style="float: left; cursor: pointer;">확인</div>
						<div class="close" onclick="closeModal()" style="float: right; cursor : pointer;">취소</div>
<!-- 				confirmclose -->
					</div>
<!-- 			modal-content -->
				</div>
<!--		memo-modal -->
			</div>
<!--	popup -->
		</div>
<!-- window	 -->
	</div>
<!-- background	 -->
</div>
<!-- /////////////메모팝업 끝/////////////				 -->

<!--///////////// 가계부 팝업 시작/////////////				 -->
<div class="background" id="moneyback">
	<div class="window">
		<div class="popup" style="padding: 30px;">가계부
			<div id="money-modal" class="modal">
				<div class="modal-content" style="padding: 10px; display:flex;">
							<ul>
								<li>
									<select name="spendonwhere" style="height: 30px; display: flex;">
										<option>식사</option>
										<option>간식</option>
										<option>교통</option>
										<option>쇼핑</option>
										<option>항공</option>
										<option>투어</option>
									</select>									
								</li>
								<li>
									<div>날짜</div>
									<div>
										ㅠㅠ
									</div>
								<li>
								<li><textarea id="money-amount"
										style="background-color: light-grey; border: none; width: 200px; height: 100px; top: 50%;"
										placeholder="금액입력" autofocus></textarea></li>
								<li><textarea id="money_onwhere" placeholder="내용입력"></textarea></li>
								<li>
									<div class="paymentwrap">
										<div>결제수단</div>
										<select name="payment" style="height: 30px; display: flex;">
											<option>현금</option>
											<option>카드</option>
										</select>
									</div>
								</li>
								<li>
									<div class="confirmnclose">
										<div class="close" onclick="addMemo()" style="float: left;">확인</div>
										<div class="close" onclick="closeModal()"
											style="float: right;">취소</div>
<!-- 								confirmclose -->
									</div>
								<li>
							</ul>
<!-- 			modal-content	 -->
				</div>
<!-- 		money-modal	 -->
			</div>
<!-- 	popup -->
		</div>
<!--window	 -->
	</div>
<!--background		 -->
</div>				
<!-- /////////////가계부팝업 끝/////////////				 -->

<!--///////////// 장소팝업창 ////////// 	 -->
			<div class='gray_layer' id='background' onclick="closemodal()"></div>
			<div class='over_layer' id='front'>
				<div class="photocity" style="display: flex;">
					<div class="photo" style="display: flex;">
						<div class="photo2" id="photo2" style="z-index: 1500; width: 200px; height: 300px; background-size: cover; overflow: hidden;"></div>
<!-- 				photo -->
					</div>
					<div class="cityexplain">
						<div class="cityexplain2" style="padding: 15px;">
							<h2 style="letter-spacing: 2px; font-size:20px; font-weight: bold; color: #222222; display:block;" id="loc1">다낭</h2>
							<h3	style="margin-top: 5px; font-size: 12px; font-family: arial; font-weight: 400; letter-spacing: 2px;"id="loc2">BANGKOK</h3>
							<div class="fknexp" style="font-family: TheJamsil2Light; color: grey; font-size: 15px; margin-top: 5px;">
								<ul>
									<li id=description>떤딘 성당은 분홍색 예쁜 성당입니다.</li>
									<li id="category">투어</li>
									<li>
										<div>주소</div>
										<div id="addr" font-family: arial; font-weight: 400; ></div>
									</li>
									<li id="hour">
										<div>운영시간</div>
										<div class="hours">
											<ul>
												<li id="mon" style="font-size: 10px;">월</li>
												<li id="tue">화</li>
												<li id="wed">수</li>
												<li id="thur">목</li>
												<li id="fri">금</li>
												<li id="sat">토</li>
												<li id="sun">일</li>
											</ul>
										</div> 									
									</li>
									<li>
										<div>전화 : </div>
										<div id="phone"></div>
									</li>
									<li>
										<div>홈페이지 : </div>
										<div id="webp"> </div>
									</li>
								</ul>
							</div>
						<div>
								<button type="button" id="modalchoose" onclick="add">일정 추가하기</button>
								<div class="x" onclick="x()">X</div>
						</div>
<!--					 cityexplain2 -->
						</div>
						
<!-- 				cityexplain -->
					</div>
<!--			 photocity				 -->
				</div>
<!-- 		over_layer -->
			</div>

<!--///////////// 장소팝업창 끝 ////////// 	 -->


<!--///////////// 왼쪽 사이드 바 ////////// 	 -->
		<div class="mainwrap">
			<div class="leftsidebar">
				<div class="titleanaddate">
					<div class="destitle">
						<% // 세션 객체에서 저장된 날짜 값을 가져옴
  						;
    			 		out.println(destination);%>
					</div>
					<div class="destitle2">
						<% String city_eng = (String)session.getAttribute("city_eng"); 
						out.println(city_eng.toUpperCase()); %>
					</div>
					<div class="traveldate">
						<%	// 세션 객체에서 저장된 날짜 값을 가져옴
						String fromDate = (String)session.getAttribute("fromDate");
						String toDate = (String)session.getAttribute("toDate");
		    			 out.println(fromDate);%> ~ <% out.println(toDate); %>
					</div>
					<div style="margin : 0 auto; display: block; text-align:center;padding:20px;" >
						동행 : <%  Object howmanyObject = session.getAttribute("howmany");
						  int howmany = Integer.parseInt(howmanyObject.toString());
						  out.println(howmany); %>명
					</div>					
<!-- 			titleanddate -->
				</div>

				
				<div class="daysandedit">
					<div class="dayeditwiden">
						<div class="dayswrap">
							<% 	int diff = (int) session.getAttribute("diff");
 					 			for (int i = 0; i <= diff; i++) { %>
							<div class="Day<%= i %>" style="margin-bottom: 10px; width: 280px;">
								Day<%=i+1 %>
									<div class="widen"><a herf = "widenlist">펼쳐보기</a></div>
									<div class="edit">편집</div>
									<div class="schlistwrap" id="widenlist">
										<div class="schlist" id="schlist">
											<ul>
												<li>
													<div class="listtitlewrap" id="container">
														<div class="listtitle" id="hoianresort">실크센스 리조트 호이안 </div>
														<div class="listremove" id="remove" onclick="removeListItem(this)">삭제</div>
	<!-- 											listtitlewrap -->
													</div>
													<div class="details">
														<div class="categories">숙소 호이안</div>
														<div class="memos">
															<ul>
																<li>체크인 시간 15:00</li>
																<li>동행인 추가하고 리셉션에서 여권보여주기</li>
																<li>체크인하고 근처에서 반미먹기</li>
															</ul>
														</div>
														<div class="btns">
															<button id="addmemo1" style="float: left;" onclick="openModal()" class="addmemo100">메모추가</button>															
															<button class="addmoney" style="margin-left: 70px;" id="moneymodal" onclick="openMoneyModal()">가계부추가</button>																
		<!-- 											btns -->
														</div>
	<!-- 											details -->
													</div>
												</li>
											</ul>
											<ul>
												<li>반미맛집A</li>
											</ul>
											<ul>
												<li>반미맛집B</li>
											</ul>
											<ul>
												<li>쌀국수맛집A</li>
											</ul>
	<!-- 								schlist	 -->
										</div>
	<!-- 							schlistwrap	 -->
									</div>
			<!-- 				day		 -->
								</div>
		<!-- 				for문 닫음	 -->
							<% } %>
		<!-- 			dayswrap -->
						</div>
		<!-- 		dayeditwiden -->
					</div>
		<!-- 	daysandedit	 -->
				</div>
		<!-- leftsidebar -->
			</div>
				
			<div class="hideleft">
				<button class="hidesidebar" onclick="hidebar()">
					<img src="./schmngimgs/arrow_left_1x (1).png" class="leftarrow">
				</button>
			</div>		
				
<!--///////////// 왼쪽 사이드 바 끝 ////////// 	 -->			
			
<!--///////////// 오른쪽 사이드 바 시작 ////////// 	 -->			
			<div class="rightsidebar">
				<div class="rightsearchwrap">
					<div class="searchex">가고 싶은 장소를 검색해보세요</div>
					<div class="searchtnbtn">
						<input type="text" id="searchvalue" class="searcht" size="20">
						<button id="searchbtn" onclick="filter()">검색</button>
<!-- 				searchnbtn	 -->
					</div>
<!-- 			rightsearchwrap -->
				</div>

				<div class="rectitle">추천장소</div>
				<div class="recpicswrap">
					<ul>
						<li>
							<div class="recpicntwrap">
								<div class="locnameandpic" id = "danangcathedral" onclick="locinfo('다낭대성당')">
									<img src="./schmngimgs/다낭대성당.jpg">
									<div class="recinfo" name="다낭대성당">다낭 대성당</div>
									<button onclick="addlist('다낭대성당')" class="addbtn">추가하기</button>
								</div>	
							</div>
						</li>
						<li>
							<div class="recpicntwrap">
								<div class="locnameandpic" onclick="locinfo('라플라주')">
									<img src="./schmngimgs/라플라주.jpg">
									<div class="recinfo" name="라플라주">라플라주</div>
									<button onclick="addlist('라플라주')" class="addbtn">추가하기</button>
								</div>								
							</div>
						</li>

						<li>
							<div class="recpicntwrap">
								<div class="locnameandpic" onclick="locinfo('바나힐')">
									<img src="./schmngimgs/바나힐.jpg">
									<div class="recinfo" name="바나힐">바나힐</div>
									<button onclick="addlist('바나힐')" class="addbtn">추가하기</button>
								</div>								
							</div>
						</li>
						<li>
							<div class="recpicntwrap">
								<div class="locnameandpic" onclick="locinfo('로지스카페')">							
									<img src="./schmngimgs/로지스카페.jpg">
									<div class="recinfo" name="로지스카페">로지스카페</div>
									<button onclick="addlist('로지스카페')" class="addbtn">추가하기</button>
								</div>								
							</div>
						</li>
						<li>
							<div class="recpicntwrap">
								<div class="locnameandpic" onclick="locinfo('마담콴')">							
									<img src="./schmngimgs/마담콴.jpg">
									<div class="recinfo" name="마담콴">마담콴</div>
									<button onclick="addlist('마담콴')" class="addbtn">추가하기</button>
								</div>								
							</div>
						</li>
						<li>
							<div class="recpicntwrap">
								<div class="locnameandpic" onclick="locinfo('목해산물식당')">							
									<img src="./schmngimgs/목해산물식당.jpg">
									<div class="recinfo" name="목해산물식당">목해산물식당</div>
									<button onclick="addlist('목해산물식당')" class="addbtn">추가하기</button>
								</div>								
							</div>
						</li>
						<li>
							<div class="recpicntwrap">
								<div class="locnameandpic" onclick="locinfo('푸라마리조트')">							
									<img src="./schmngimgs/푸라마리조트.jpg">
									<div class="recinfo" name="푸라마리조트">푸라마리조트</div>
									<button onclick="addlist('푸라마리조트')" class="addbtn">추가하기</button>
								</div>								
							</div>
						</li>
					</ul>
<!-- 			recpicswrap -->
				</div>
<!-- 			rightsidebar -->
			</div>
<!-- 	mainwrap -->
		</div>
<!--///////////// 오른쪽 사이드 바 끝 ////////// 	 -->
			<div class="hideright">
				<button class="hidesidebar-right" onclick="hidebar-right()">
					<img src="./schmngimgs/arrow_left_1x (1).png" class="leftarrow">
				</button>
			</div>	


<!--///////////// 구글지도 시작 ////////// 	 -->
		<div id = "map" style="width: 100%; height: 100vh; z-index:0;"></div>
		<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDuNMOuY4ydQhCxU3_i4uMSs_jxhb1Qxk0&callback=initMap&region=kr"></script>
		<script src="js/travel_sch_mng.js"></script>


		
<!--///////////// 구글지도 끝 ////////// 	 -->		
	</section>
</body>
<script>

</script>

</html>