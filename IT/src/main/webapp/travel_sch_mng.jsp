<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="UTf-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.concurrent.TimeUnit"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Calendar"%>
<%@page import="dto.*"%>
<%@page import="vo.*"%>
<%
ArrayList<TravelDTO> locList = (ArrayList<TravelDTO>) request.getAttribute("locList");
ArrayList<TravelSchMngVO> schdayList = (ArrayList<TravelSchMngVO>) request.getAttribute("sch_dayList");
ArrayList<TravelSchDTO> schDTO1 = (ArrayList<TravelSchDTO>) request.getAttribute("schDTO1");
ArrayList<TravelSchDTO> schdayListFromList = (ArrayList<TravelSchDTO>) request.getAttribute("sch_dayList1");
// 	// schdayList가 ArrayList<TravelSchMngVO>인 경우
// 	String minDate = schdayList.get(0).getSch_day();
// 	String maxDate = schdayList.get(0).getSch_day();

// 	for (TravelSchMngVO sch : schdayList) {
// 	    String currentDate = sch.getSch_day();
// 	    if (currentDate.compareTo(minDate) < 0) {
// 	        minDate = currentDate;
// 	    }
// 	    if (currentDate.compareTo(maxDate) > 0) {
// 	        maxDate = currentDate;
// 	    }
// 	}
%>
<%
TravelDTO tra_cityList = (TravelDTO) request.getAttribute("tra_cityList");
String tra_city = "";
String city_eng = "";
int tra_ppl = 0;
String tra_dday = "";
String tra_aday = "";
int tra_num = 0;

tra_num = tra_cityList.getTra_num();
tra_city = tra_cityList.getTra_city();
city_eng = tra_cityList.getCity_eng();
tra_ppl = tra_cityList.getTra_ppl();
tra_dday = tra_cityList.getTra_dday();
tra_aday = tra_cityList.getTra_aday();

int sch_tra_num = 0;
String sch_filter = "";
String sch_day = "";
String sch_pla = "";

// 시작일부터 종료일까지의 날짜 목록을 생성함
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
Date startDate = sdf.parse(tra_dday);
Date endDate = sdf.parse(tra_aday);
List<String> dateList = new ArrayList<String>();
Calendar cal = Calendar.getInstance();
cal.setTime(startDate);
while (!cal.getTime().after(endDate)) {
	dateList.add(sdf.format(cal.getTime()));
	cal.add(Calendar.DATE, 1);
}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>일정짜기</title>
<link rel="stylesheet" href="css/travel_sch_mng.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>

<body>
	<header>
		<jsp:include page="header.jsp" />
	</header>

	<section>
		<!-- 장소팝업 내에서 일정옵션을 추가하기 위함  -->


		<!-- /////////////메모팝업 시작	/////////////			 -->
		<div class="background" id="memoback">
			<div class="window">
				<div class="popup" style="padding: 30px;">
					메모
					<div id="memo-modal" class="modal">
						<div class="modal-content" style="padding: 10px;">
							<textarea id="memo-textarea"
								style="margin: 10px 10px 10px 10px; border: none; width: 500px; height: 400px; top: 50%;"
								placeholder="잊기 쉬운 정보들을 메모하세요. " autofocus></textarea>
							<div class="confirmnclose">
								<div class="close" class=addconfirm id="addconfirm" onclick="addMemo()" style="float: left; cursor: pointer; display: block;">확인</div>
								<div class="close" class=editconfirm id="editmemoconfirm" onclick="editMemoconfirm()" style="float: left; cursor: pointer; display: none;">수정</div>
								<div class="close" onclick="closeModal()" style="float: right; cursor: pointer;">취소</div>
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
				<div class="popup" style="padding: 30px;">
					가계부
					<div id="money-modal" class="modal">
						<div class="modal-content" style="padding: 10px; display: flex;">
							<ul>
								<li><select name="spendonwhere"
									style="height: 30px; display: flex;">
										<option>식사</option>
										<option>간식</option>
										<option>교통</option>
										<option>쇼핑</option>
										<option>항공</option>
										<option>투어</option>
								</select></li>
								<li>
									<div>날짜</div>
									<div>ㅠㅠ</div>
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


		<!--///////////// 왼쪽 사이드 바 ////////// 	 -->
		<div class="mainwrap">
			<div class="leftsidebar">
				<div class="titleanaddate">
					<div class="destitle">
						<%=tra_city%>
					</div>
					<div class="destitle2">
						<%=city_eng.toUpperCase()%>
					</div>
					<div class="traveldate">
						<%=// 세션 객체에서 저장된 날짜 값을 가져옴
		tra_dday%>
						~
						<%=tra_aday%>
					</div>
					<div
						style="margin: 0 auto; display: block; text-align: center; padding: 20px;">
						동행 :
						<%=tra_ppl%>명
					</div>
					<!-- 			titleanddate -->
				</div>


				<div class="daysandedit">
					<div class="dayeditwiden">
						<div class="dayswrap">
							<%
							long diffInMllies = Math.abs(startDate.getTime() - endDate.getTime());
							long diff = TimeUnit.DAYS.convert(diffInMllies, TimeUnit.MILLISECONDS);

							String formattedDate = "";
							// diff 만큼의 날짜 출력
							for (int i = 0; i <= diff; i++) {
								// i일 후의 날짜를 계산
								cal.setTime(startDate);
								cal.add(Calendar.DATE, i);
								Date currentDate = cal.getTime();

								// 날짜를 "yyyy-MM-dd" 형식으로 포맷팅하여 출력
								formattedDate = sdf.format(currentDate);
							%>
							<div class="Day<%=i%>" style="margin-bottom: 40px; width: 280px;">
								<%=formattedDate%>
								<div class="days" style="margin-right: 15px;">
									Day<%=i + 1%>
								</div>
								<div class="widen">
									<a href="widenlist">펼쳐보기</a>
								</div>
								<div class="edit">편집</div>
								<div class="schlistwrap" id="widenlist">
									<div class="schlist" id="schlist">
										<ul>
										<% if (schdayListFromList != null) {
											for (int j = 0; j < schdayListFromList.size(); j++) {
     											if (formattedDate.equals(schdayListFromList.get(j).getSch_day())) {%>     																	
											<li>
												<div class="listtitlewrap">
													<div class="listtitle"><%=schdayListFromList.get(j).getSch_pla()%></div>						
													<div class="listremove" onclick="deletememo(this)" style="cursor: pointer;">삭제</div>
												</div>
												<div class="details">
													<div class="categories" style="font-size: 13px; color: grey; margin: 10px; text-align: left; letter-spacing: 1px;"><%=schdayListFromList.get(j).getSch_filter()%> · </div>
													<div class="memos" id="memomemo"></div>
													<div class="btns">
														<button style="float: left; display : block;" onclick="openModal()" class="addmemo100">메모추가</button>
														<button style="float: left; display : none;" onclick="editModal()" class="editmemo100">메모수정</button>
														<button style="margin-left: 70px;" onclick="openMoneyModal()" class="addmoney">가계부추가</button>
													</div>
												</div>
											</li>
										 <% }}} %>	
										</ul>
										<!-- 								schlist	 -->
									</div>
									<!-- 							schlistwrap	 -->
								</div>
								<!-- 				day		 -->
							</div>
							<!-- 				for문 닫음	 -->
							<%
							}
							%>
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
					<img src="schmngimgs/arrow_left.png" class="leftarrow">
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
						<%
						if (locList != null) {
							for (int i = 0; i < locList.size(); i++) {
						%>
						<li>
							<div class="recpicntwrap">
								<div class="locnameandpic" id="danangcathedral"
									onclick="locinfo('<%=locList.get(i).getLoc2_num()%>','<%=locList.get(i).getLoc2_name()%>', '<%=locList.get(i).getLoc2_filter()%>', '<%=locList.get(i).getLoc2_name_lang()%>','<%=locList.get(i).getLoc2_addr()%>', '<%=locList.get(i).getLoc2_webp()%>', '<%=locList.get(i).getLoc2_hour()%>', '<%=locList.get(i).getLoc2_exp()%>', '<%=locList.get(i).getLoc2_phone()%>', '<%=locList.get(i).getLoc2_loc()%>',  '<%=locList.get(i).getLoc2_lat()%>',  '<%=locList.get(i).getLoc2_lng()%>' )">
									<img src="./schmngimgs/<%=locList.get(i).getLoc2_name()%>.jpg">
									<div class="recinfo" id="<%=locList.get(i).getLoc2_name()%>"
										name="<%=locList.get(i).getLoc2_name()%>"><%=locList.get(i).getLoc2_name()%></div>
									<button
										onclick="addlist('<%=locList.get(i).getLoc2_name()%>','<%=locList.get(i).getLoc2_filter()%>','<%=locList.get(i).getLoc2_loc()%>')"
										class="addbtn">추가하기</button>
								</div>
							</div>
						</li>
						<%
						}
						}
						%>
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
				<img src="./schmngimgs/arrow_left.png" class="leftarrow">
			</button>
		</div>


		<!--///////////// 구글지도 시작 ////////// 	 -->
		<div id="map" style="width: 100%; height: 100vh; z-index: 0;"></div>
		<script async defer
			src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDuNMOuY4ydQhCxU3_i4uMSs_jxhb1Qxk0&callback=initMap&region=kr"></script>
		<script src="js/travel_sch_mng.js"></script>
		<!--///////////// 구글지도 끝 ////////// 	 -->

		<!--///////////// 장소팝업창 ////////// 	 -->
		<!-- 			<form action = "insertSchedule.bo" method="post" onsubmit="callinfo()"> -->
		<div class='gray_layer' id='background' onclick="closemodal()"></div>
		<div class='over_layer' id='front'>
			<div class="photocity" style="display: flex;">
				<div class="photo" style="display: flex;">
					<div class="photo2" id="photo2"
						style="z-index: 1500; width: 200px; height: 300px; background-size: cover; overflow: hidden;"></div>
					<!-- 				photo -->
				</div>
				<div class="cityexplain">
					<div class="cityexplain2" style="padding: 15px;">
						<div class="nameandloc" display="display: flex;">
							<h2
								style="letter-spacing: 2px; font-size: 20px; font-weight: bold; color: #222222; display: block;"
								name="loc2_name" id="loc1">뽕따에이드</h2>
							<input type="hidden" name="loc2_num" id="loc_num" value="aa">
							<h2 style="float: right;" name="loc2_loc" id="loc">떡꼬치</h2>
						</div>
						<h3
							style="margin-top: 5px; font-size: 12px; font-family: arial; font-weight: 400; letter-spacing: 2px;"
							id="loc2">BANGKOK</h3>
						<div class="fknexp"
							style="font-family: TheJamsil2Light; color: grey; font-size: 15px; margin-top: 5px;">
							<ul>
								<li id=description>떤딘 성당은 분홍색 예쁜 성당입니다.</li>
								<li id="category" name="loc2_filter">투어</li>
								<li>
									<div>주소</div>
									<div id="addr"font-family:arial; font-weight: 400; ></div>
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
									<div>전화 :</div>
									<div id="phone"></div>
								</li>
								<li>
									<div>홈페이지 :</div>
									<div id="webp"></div>
								</li>
							</ul>
						</div>
						<div>
							<select id="selectedDate" name="sch_day"
								onchange="updateDataDate()">
								<%
								for (String date : dateList) {
								%>
								<option><%=date%></option>
								<%
								}
								%>
							</select> <input type="button" id="modalchoose" value="일정 추가하기"
								onclick="addsch()"></input>
							<div class="x" onclick="x()">X</div>
							<!-- 						</form> -->
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

	</section>
</body>
<script>

function updateDataDate() {
    var selectedDate = document.getElementById("selectedDate").value;
    var modalchoose = document.getElementById("modalchoose");
    modalchoose.setAttribute("data-date", selectedDate);
}

var loc2_num = "";
var loc2_name = "";
var loc2_filter = "";
var loc2_loc = "";
var sch_day = "";
var sch_tra_num= <%=tra_num%>;
var sch_memo = "";

function setPopupValue() {
	loc2_num = document.getElementById("loc_num").value;
	loc2_name = document.getElementById("loc1").innerText;
	loc2_filter = document.getElementById("category").innerText;
	if(loc2_filter == "식당"){
		loc2_filter = "1";			            				
	}
	else if(loc2_filter =="카페"){
		loc2_filter = "2";   		
	}
	else if(loc2_filter =="관광"){
		loc2_filter = "3";   		
	}
	else if(loc2_filter =="쇼핑"){
		loc2_filter = "4" ;   		
	}
	else if(loc2_filter =="숙소"){
		loc2_filter = "5" ;   		
	}   
	loc2_loc = document.getElementById("loc").innerText;
	sch_day = document.getElementById("selectedDate").value;	
}

function addsch() {
	
	setPopupValue();
	

	//sch_manage에 값을 넣는 ajax
	$.ajax({
        type: "POST",
        url: "insertSchedule.bo",
        data:JSON.stringify({
            "sch_day": sch_day,
            "loc2_num": loc2_num,
            "loc2_loc": loc2_loc,
            "loc2_name": loc2_name,
            "loc2_filter": loc2_filter,
            "sch_tra_num": sch_tra_num
        }),
        contentType: "application/json",
        dataType: "json",
        success: function(response) {
        	console.log(response); // 이미 JavaScript 객체로 인식되어 있으므로 추가적인 JSON 파싱이 필요 없음

        	// JavaScript 객체의 속성에 접근하여 필요한 값 추출
        	sch_day = response.sch_day;
        	var loc2_filter = response.loc2_filter;
        	var loc2_num = response.loc2_num;
        	var loc2_loc = response.loc2_loc;
        	var loc2_name = response.loc2_name;
        	
        	// 추가로 필요한 값을 response 객체에서 추출

        	var sch_num = response.sch_num;
        	
        	// 추출한 값들을 활용하여 원하는 동작 수행

			if(loc2_filter == "1"){
				loc2_filter = "식당";			            				
			}
			else if(loc2_filter =="2"){
				loc2_filter = "카페";   		
			}
			else if(loc2_filter =="3"){
				loc2_filter = "관광";   		
			}
			else if(loc2_filter =="4"){
				loc2_filter = "쇼핑" ;   		
			}
			else if(loc.loc2_filter =="5"){
				loc2_filter = "숙소" ;   		
			}
			else if(loc.loc2_filter =="6"){
				loc2_filter = "술집/바" ;   		
			}  
                 	
			var newItem = document.createElement("li");
			newItem.setAttribute("data-sch-num", sch_num); 
			newItem.innerHTML = `
				<div class="listtitlewrap">
					<div class="listtitle">`+loc2_name+`</div>						
						<div class="listremove" onclick="deletememo(this)" style="cursor: pointer;">삭제</div>
					</div>
					<div class="details">
						<div class="categories" style="font-size: 13px; color: grey; margin: 10px; text-align: left; letter-spacing: 1px;">`+ loc2_filter+` · `+ loc2_loc +`</div>
						<div class="memos" id="memomemo"></div>
						<div class="btns">
							<button style="float: left; display : block;" onclick="openModal()" class="addmemo100">메모추가</button>
							<button style="float: left; display : none;" onclick="editModal()" class="editmemo100">메모수정</button>
							<button style="margin-left: 70px;" onclick="openMoneyModal()" class="addmoney">가계부추가</button>
					</div>
				</div>
				`;

			var selectedDate = document.getElementById("selectedDate");

			var dateElements = document.querySelectorAll(".dayswrap > .schlistwrap > .schlist > ul");

				for (var i = 0; i < dateElements.length; i++) {
					var dateElement = dateElements[i];
					var dateLabel = dateElement.closest(".schlistwrap").previousElementSibling.querySelector(".days");
					var labelDate = dateLabel ? dateLabel.textContent.trim() : "";

					if (selectedDate.value === labelDate) {
						var ul = dateElement;
						ul.appendChild(newItem);
						return;
					}
				}

			var newUl = document.createElement("ul");
			newUl.appendChild(newItem);

			var dayElement = document.querySelector(".Day" + (selectedDate.selectedIndex));
			var schlistElement = dayElement.querySelector(".schlist");
			schlistElement.appendChild(newUl);
                   
//   메모 추가하는 부분() -----------------------------------------------	    
			var memoDivs = document.querySelectorAll(".memos");
			var addbtns = document.querySelectorAll(".addmemo100");
			var memoCount = 1;

				for (var i = 0; i < memoDivs.length; i++) {
					var memoDiv = memoDivs[i];
					var addbtn = addbtns[i];
					var memoId = memoDiv.id; // 현재 memoDiv의 id 가져오기
					var addbtnId = addbtn.id;
					var number = memoId.match(/\d+$/); // id에서 숫자 추출하기

					if (number) {
						var currentCount = parseInt(number[0]);
						memoCount = Math.max(memoCount, currentCount + 1);
					}
				}

			var newMemoId = "memomemo" + sch_num;
			var newAddId = "addmemo" + sch_num;
			var newEditId = "editmemo" + sch_num;
			var newAddMemoId = "addconfirm"+sch_num;         	    
			var newEditMemoConfirmId = "editmemoconfirm"+sch_num;
			newItem.querySelector(".memos").id = newMemoId;
			newItem.querySelector(".addmemo100").id = newAddId;
			newItem.querySelector(".addmemo100").onclick = function(id) {
				return function() {
					openModal(id);
				};
			}(newAddId);
			newItem.querySelector(".editmemo100").id = newEditId;
// 			newItem.querySelector(".editmemo100").onclick = function(id) {
// 				return function() {
// 					editModal();
// 				};
// 			}(newEditId);      	    	
			var dayElement = document.querySelector(".Day" + (selectedDate.selectedIndex));
			var schlistElement = dayElement.querySelector(".schlist");
			schlistElement.appendChild(newItem);   
		},
		error: function handleError2 (jqXHR, textStatus, errorThrown) {
			console.error("에러 발생:", textStatus, errorThrown);
			alert("데이터 저장 중 에러가 발생했습니다.");
		}
	});        
}

document.addEventListener("click", function(event) {
	  if (event.target && event.target.classList.contains("addmemo100")) {
   	    var clickedButton = event.target.closest(".addmemo100");
   	    var clickedButtonId = clickedButton.id;
   	    console.log(clickedButtonId); // 클릭한 버튼의 아이디 확인용
   	    openModal(clickedButtonId);
   	  }
   	});
   	
   	
function openModal(btnId) {
	var background = document.querySelector(".background");
	background.classList.add("show");
	var memoModal = document.getElementById("memo-modal");
	memoModal.dataset.buttonId = btnId; // 클릭한 버튼의 아이디를 데이터 속성에 저장
}

function addMemo() {
	var btnElement = document.getElementById("memo-modal");
	var clickedButtonId = btnElement.dataset.buttonId;
	var number1 = parseInt(clickedButtonId.match(/\d+$/)[0]);
	var memoInput = document.getElementById("memo-textarea").value;
	var memos = document.querySelectorAll(".memos");	  
	for (var i = 0; i < memos.length; i++) {
		var memo = memos[i];
		var memoId = memo.id;
		var number2 = parseInt(memoId.match(/\d+$/)[0]);
		if (number1 === number2) {
			var existingMemoItem = memo.querySelector("li");
			if (!existingMemoItem) {
				existingMemoItem = document.createElement("li");
				memo.appendChild(existingMemoItem);
			}
			existingMemoItem.textContent += "\n" + memoInput;
			break;
		}
	}			  
	var memoButton = document.getElementById("addmemo"+number1);
	memoButton.style.display = "none"; // 메모 추가 버튼 숨김
	var editButton = document.getElementById("editmemo" + number1);
	editButton.style.display = "block"; // 메모 수정 버튼 보이기
			  
	var sch_memo = memoInput;
	var sch_num = number1;
	$.ajax({
		type: "POST",
		url: "insertMemo.bo",
		data: JSON.stringify({
			"sch_memo" : sch_memo,
			"sch_num" : sch_num
		}),
		contentType: "application/json",
		dataType: "json",
		success: function(response) {
			console.log(response); // 이미 JavaScript 객체로 인식되어 있으므로 추가적인 JSON 파싱이 필요 없음

      	// JavaScript 객체의 속성에 접근하여 필요한 값 추출
			sch_memo = response.sch_memo;
			sch_num = response.sch_num; },
		error: function handleError2 (jqXHR, textStatus, errorThrown) {
			console.error("에러 발생:", textStatus, errorThrown);
			alert("데이터 저장 중 에러가 발생했습니다.");
		}
	});
	document.getElementById("memo-textarea").value = "";
	closeModal();
}
	  
function deletememo(el){
	var liElement = el.closest("li");
	var sch_num = liElement.getAttribute("data-sch-num");
	console.log(sch_num);
		  
	$.ajax({
		type: "POST",
		url: "deleteSchedule.bo",
		data: JSON.stringify({
			"sch_num": sch_num
		}),
		contentType: "application/json",
		dataType: "json",
		success: function(response) {
			console.log("데이터 삭제 성공"); // 이미 JavaScript 객체로 인식되어 있으므로 추가적인 JSON 파싱이 필요 없음
		},
		error: function handleError3 (jqXHR, textStatus, errorThrown) {
			console.error("에러 발생:", textStatus, errorThrown);
			alert("데이터 삭제 실패.");
		}
	});     
	var li = el.parentNode.parentNode; // 부모 노드(li)를 찾기 위해 두 번의 parentNode 호출
	li.parentNode.removeChild(li); // 부모 노드에서 해당 li를 삭제
}
	  
var neweditconfirmbtn; // 함수 외부에 변수 선언
var editconfirmbtn = document.getElementById("editmemoconfirm"); // 함수 외부에 변수 선언

function editModal() {
    var editButtons = document.querySelectorAll(".editmemo100");

    editButtons.forEach(function(button) {
        button.addEventListener("click", function() {
            var memoItem = button.closest("li");
            var memoText = memoItem.querySelector(".memos").textContent;

            // 모달 창에 textarea 추가 및 메모 내용 설정
            var memoModal = document.getElementById("memo-modal");
            var textarea = memoModal.querySelector("#memo-textarea");
            textarea.value = memoText;

            var btnElement = document.getElementById("memo-modal");
            var clickedButtonId = btnElement.dataset.buttonId;
            var sch_num = parseInt(clickedButtonId.match(/\d+$/)[0]);

            neweditconfirm = "editmemoconfirm" + sch_num;
            var addconfirm = document.getElementById("addconfirm");
            editconfirmbtn.id = neweditconfirm
            editconfirmbtn.style.display = "block"; // 메모 수정 버튼 보이기
            addconfirm.style.display = "none";
            
            // 모달 창 열기
            openModal(button.id);
        });
    });
}
		
function editMemoconfirm(){
	var btnElement = document.getElementById("memo-modal");
	var clickedButtonId = btnElement.dataset.buttonId;
	var sch_num = parseInt(clickedButtonId.match(/\d+$/)[0]);
	var memoItem = btnElement.closest("li");
	var sch_memo = "";
	var memoModal = document.getElementById("memo-modal");
	var textarea = memoModal.querySelector("#memo-textarea");
	sch_memo = textarea.value;
	
	$.ajax({
		type: "POST",
		url: "editMemo.bo",
		data:JSON.stringify({
			"sch_num": sch_num,
			"sch_memo":sch_memo
		}),
		contentType: "application/json",
		dataType: "json",
		success: function(response) {
			console.log("데이터 수정 성공"); // 이미 JavaScript 객체로 인식되어 있으므로 추가적인 JSON 파싱이 필요 없음
			sch_memo = response.sch_memo;

			var memos = document.querySelectorAll(".memos");	
			for (var i = 0; i < memos.length; i++) {
				var memo = memos[i];
				var memoId = memo.id;
				var number2 = parseInt(memoId.match(/\d+$/)[0]);
				if (sch_num === number2) {
					var existingMemoItem = memo.querySelector("li");
					if (!existingMemoItem) {
						existingMemoItem = document.createElement("li");
						memo.appendChild(existingMemoItem);
					}
					existingMemoItem.textContent = sch_memo;
					break;
				}
			}
			
			
			closeModal();
		},
		error: function handleError3 (jqXHR, textStatus, errorThrown) {
			console.error("에러 발생:", textStatus, errorThrown);
			alert("데이터 수정 실패.");
		}
	});     

}

//function addsch() {
//$.ajax({
//type: "POST",
//url: "insertSchedule.bo",
//data: data = {
//	  "loc2_name": loc2_name,
//	  "loc2_filter": loc2_filter,
//	  "loc2_loc": loc2_loc,
//	  "sch_day": sch_day,
//	  sch_tra_num
//},
//success: function(response) {
//  console.log("success");
//  console.log(response);

//    var newItem = document.createElement("li");
//    newItem.innerHTML = `
//      <div class="listtitlewrap">
//        <div class="listtitle">`+data.loc2_name+`</div>
//        <div class="listremove" onclick="removeListItem(this)" style="cursor: pointer;">삭제</div>
//      </div>
//      <div class="details">
//        <div class="categories" style="font-size: 13px; color: grey; margin: 10px; text-align: left; letter-spacing: 1px;">`+ data.loc2_filter+` · `+data.loc2_loc + `</div>
//        <div class="memos" id="memomemo">
//        	<ul>
//        	</ul>
//        </div>
//        <div class="btns">
//        <button style="float: left;" id="addmemo" onclick="openModal()" class="addmemo100">메모추가</button>
//          <button style="margin-left: 70px;" onclick="openMoneyModal()" class="addmoney">가계부추가</button>
//        </div>
//      </div>
//    `;

//    var selectedDate = document.getElementById("selectedDate");
//    var dateElements = document.querySelectorAll(".dayswrap  .schlistwrap > .schlist > ul");
//    console.log(dateElements);
//    for (var i = 0; i < dateElements.length; i++) {
//      var dateElement = dateElements[i];

//      var dateLabel = dateElement.closest(".schlistwrap").parentNode.querySelector(".days");
//      var labelDate = dateLabel ? dateLabel.textContent.trim() : "";

//      if (selectedDate.value === labelDate) {
   	 
         
// 		var ul = dateElement;
//  	ul.appendChild(newItem);
//      }
 
//}
//},
//error: function(xhr, textStatus, errorThrown) {
//  console.error("에러 발생:", errorThrown);
//  alert("에러가 발생했습니다.");
//}
//});
//};




//function addsch(){
  
//   var loc2_name = document.getElementById("loc1").innerText;
//   var loc2_filter = document.getElementById("category").innerText;
//   var loc2_loc =  document.getElementById("loc").innerText;
//   var sch_day = document.getElementById("selectedDate").value;
<%-- <%-- 	   var sch_tra_num = "<%= tra_num %>"; --%> 
<%-- <%-- 	   var formattedDate = "<%=formattedDate%>"; --%> 
//   console.log(sch_day);
//// 	   console.log(sch_tra_num);
  
//   if(loc2_filter == "식당"){
//		loc2_filter = "1";			            				
//	}
//	else if(loc2_filter =="카페"){
//		loc2_filter = "2";   		
//   	}
//   	else if(loc2_filter =="관광"){
//   		loc2_filter = "3";   		
//   	}
//   	else if(loc2_filter =="쇼핑"){
//   		loc2_filter = "4" ;   		
//   	}
//   	else if(loc2_filter =="숙소"){
//   		loc2_filter = "5" ;   		
//   	}   
  
//   if(loc2_filter == "1"){
//		loc2_filter = "식당";			            				
//	}
//	else if(loc2_filter =="2"){
//		loc2_filter = "카페";   		
//   	}
//   	else if(loc2_filter =="3"){
//   		loc2_filter = "관광";   		
//   	}
//   	else if(loc2_filter =="4"){
//   		loc2_filter = "쇼핑" ;   		
//   	}
//   	else if(loc2_filter =="5"){
//   		loc2_filter = "숙소" ;   		
//   	}   

//// 	   var data = {
//// 			   "loc2_name": loc2_name,
//// 			   "loc2_filter": loc2_filter,
//// 			   "loc2_loc" : loc2_loc,
//// 			   "sch_day" : sch_day,
<%-- <%-- 			   "sch_tra_num": <%=formattedDate%> --%>

//// 		 }; 
 	   
//    var newItem = document.createElement("li");
//    newItem.innerHTML = `
//      <div class="listtitlewrap">
//        <div class="listtitle">`+loc2_name+`</div>
//        <div class="listremove" onclick="removeListItem(this)" style="cursor: pointer;">삭제</div>
//      </div>
//      <div class="details">
//        <div class="categories" style="font-size: 13px; color: grey; margin: 10px; text-align: left; letter-spacing: 1px;">`+ loc2_filter+` · `+loc2_loc + `</div>
//        <div class="memos" id="memomemo">
//        	<ul>
//        	</ul>
//        </div>
//        <div class="btns">
//        <button style="float: left;" id="addmemo" onclick="openModal()" class="addmemo100">메모추가</button>
//          <button style="margin-left: 70px;" onclick="openMoneyModal()" class="addmoney">가계부추가</button>
//        </div>
//      </div>
//    `;

//    var selectedDate = document.getElementById("selectedDate");
//    var dateElements = document.querySelectorAll(".dayswrap  .schlistwrap > .schlist > ul");
//    console.log(dateElements);
//    for (var i = 0; i < dateElements.length; i++) {
//      var dateElement = dateElements[i];

//      var dateLabel = dateElement.closest(".schlistwrap").parentNode.querySelector(".days");
//      var labelDate = dateLabel ? dateLabel.textContent.trim() : "";

//      if (selectedDate.value === labelDate) {
   	 
         
//   		var ul = dateElement;
//    	ul.appendChild(newItem);
//      }
//    }

////   data: JSON.stringify(schbyDays),
////   dataType: "json",
////   contentType: "application/json; charset=utf-8", 
//success: function(response) {
//// 	    var jsonData = $.parseJSON(response);
//// 	    var loc2_name = jsonData.loc2_name;
//	    // 추출한 값(loc2_name)을 원하는 방식으로 처리
//	    console.log(loc2_name);
//  console.log("데이터가 성공적으로 저장되었습니다.");
//// 	console.log(JSON.stringify(data));
//  var newItem = document.createElement("li");
//  newItem.innerHTML = `
//    <div class="listtitlewrap">
//      <div class="listtitle">${loc2_name}</div>
//      <div class="listremove" onclick="removeListItem(this)" style="cursor: pointer;">삭제</div>
//    </div>
//    <div class="details">
//      <div class="categories" style="font-size: 13px; color: grey; margin: 10px; text-align: left; letter-spacing: 1px;"></div>
//      <div class="btns">
//        <button style="float: left;" onclick="openModal()" class="addmemo100">메모추가</button>
//        <button style="margin-left: 70px;" onclick="openMoneyModal()" class="addmoney">가계부추가</button>
//      </div>
//    </div>
//  `;

//  var selectedDate = document.getElementById("selectedDate");

//  var dateElements = document.querySelectorAll(".dayswrap > .schlistwrap > .schlist > ul");

//  for (var i = 0; i < dateElements.length; i++) {
//    var dateElement = dateElements[i];
//    var dateLabel = dateElement.closest(".schlistwrap").previousElementSibling.querySelector(".days");
//    var labelDate = dateLabel ? dateLabel.textContent.trim() : "";

//    if (selectedDate.value === labelDate) {
//      var ul = dateElement;
//      ul.appendChild(newItem);
//      return;
//    }
//  }

//  var newUl = document.createElement("ul");
//  newUl.appendChild(newItem);

//  var dayElement = document.querySelector(".Day" + (selectedDate.selectedIndex));
//  var schlistElement = dayElement.querySelector(".schlist");
//  schlistElement.appendChild(newUl);
//},
//error: function(jqXHR, textStatus, errorThrown) {
//	  console.error("에러 발생:", textStatus, errorThrown);
//  alert("데이터 저장 중 에러가 발생했습니다.");
//}
//});


   
  


   

   
   
</script>

</html>