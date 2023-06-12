<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
    <%@page import="dto.Fli_luggage_DTO"%>
    <%@page import="dao.FlightDao"%>
<%@page import="java.util.Vector"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>수하물</title> 
        <link rel="stylesheet" href="./css/flight4.css">
        <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js">
        <link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
        <script src="//code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="//code.jquery.com/ui/1.13.0/jquery-ui.min.js"></script>
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/smoothness/jquery-ui.css">

        <script src="./js/flight4.js"></script>
    </head>
    <style type="text/css">
    </style>
<body>

<!-- 헤더 -->
<jsp:include page="header.jsp"></jsp:include>
<form action="flightAction5.jsp" method="post" id="flightForm">
<%
int fli_luggage_weight = 0; // 기본값 설정
if (session.getAttribute("fli_luggage_weight") != null) {
    fli_luggage_weight = (int) session.getAttribute("fli_luggage_weight");
}

int fli_luggage_price = 0; // 기본값 설정
if (session.getAttribute("fli_luggage_price") != null) {
    fli_luggage_price = (int) session.getAttribute("fli_luggage_price");
}

%>
<div class="divwrap1"> 
<div class="divwrap2"><!-- 수하물 제목 -->
<div class="divwrap3">
위탁 수하물
</div>
<div class="divwrap4">
추가 수하물로 마음까지 넉넉한 여행
</div>
</div>
<div class="divwrap5"><!-- 수하물 선택  -->


<div class="divwrap6">
<%
int selectedPrice2 = (Integer) request.getAttribute("selected_price");
/* flight2test 값  */
String air_deppt1 = (String)request.getAttribute("air_deppt1");
String air_arrpt1 = (String)request.getAttribute("air_arrpt1");
String air_dday1 = (String)request.getAttribute("air_dday1");
String air_aday1 = (String)request.getAttribute("air_aday1");
String air_model1 = (String)request.getAttribute("air_model1");
String air_fligname1 = (String)request.getAttribute("air_fligname1");
String air_dday_time1 = (String)request.getAttribute("air_dday_time1");
String air_aday_time1 = (String)request.getAttribute("air_aday_time1");
int air_time_minute1 = (Integer)request.getAttribute("air_time_minute1");
/* flight3_1 값 */
String air_deppt = (String)request.getAttribute("air_deppt");
String air_arrpt = (String)request.getAttribute("air_arrpt");
String air_dday = (String)request.getAttribute("air_dday");
String air_aday = (String)request.getAttribute("air_aday");
String air_model = (String)request.getAttribute("air_model");
String air_fligname = (String)request.getAttribute("air_fligname");
String air_dday_time = (String)request.getAttribute("air_dday_time");
String air_aday_time = (String)request.getAttribute("air_aday_time");
int air_time_minute = (Integer)request.getAttribute("air_time_minute");
%>
<%
    FlightDao fd = new FlightDao();
    Vector<Fli_luggage_DTO> listluggage = fd.luggage();
    for (int i = 0; i < listluggage.size(); i++) {
        Fli_luggage_DTO fl = listluggage.get(i);
%>
    <div class="divwrap7">
        <div class="divwrap8" onclick="selectLuggagePrice(
          '<%= selectedPrice2 %>'       
        ,'<%= fl.getFli_luggage_price() %>'
, '<%= air_deppt1 %>', 
'<%= air_arrpt1 %>', 
'<%= air_dday1 %>',
 '<%= air_aday1 %>', 
'<%= air_model1 %>',
 '<%= air_fligname1 %>',
 '<%= air_dday_time1 %>', 
'<%= air_aday_time1 %>', 
'<%= air_time_minute1 %>',
'<%= selectedPrice2 %>',
'<%= air_deppt %>',
'<%= air_arrpt %>',
'<%= air_dday %>',
'<%= air_aday %>',
'<%= air_model %>',
 '<%= air_fligname %>',
 '<%= air_dday_time %>', 
'<%= air_aday_time %>', 
'<%= air_time_minute %>')">
            <div class="divwrap9">
                <div class="divwrap10">
                    <%= fl.getFli_luggage_weight() %>KG
                </div>
            </div>
            <div class="divwrap12">
                <%= fl.getFli_luggage_price() %>원
            </div>
        </div>
    </div>
<%
    }
%>
</div>
</div>
</div>

<!-- flight2test에서 가져온 값 -->
<input type="hidden" id="air_deppt1" name="air_deppt1" value="<%= air_deppt1 %>" />
<input type="hidden" id="air_arrpt1" name="air_arrpt1" value="<%= air_arrpt1 %>" />
<input type="hidden" id="air_dday1" name="air_dday1" value="<%= air_dday1 %>" />
<input type="hidden" id="air_aday1" name="air_aday1" value="<%= air_aday1 %>" />
<input type="hidden" id="air_model1" name="air_model1" value="<%= air_model1 %>" />
<input type="hidden" id="air_fligname1" name="air_fligname1" value="<%= air_fligname1 %>" />
<input type="hidden" id="air_dday_time1" name="air_dday_time1" value="<%= air_dday_time1 %>" />
<input type="hidden" id="air_aday_time1" name="air_aday_time1" value="<%= air_aday_time1 %>" />
<input type="hidden" id="air_time_minute1" name="air_time_minute1" value="<%= air_time_minute1 %>" />

<!-- flight3_1에서 가져온 값 -->
<input type="hidden" id="selectedPrice2" name="selectedPrice2" value="<%= selectedPrice2 %>" />
<input type="hidden" id="air_deppt" name="air_deppt" value="<%= air_deppt %>" />
<input type="hidden" id="air_arrpt" name="air_arrpt" value="<%= air_arrpt %>" />
<input type="hidden" id="air_dday" name="air_dday" value="<%= air_dday %>" />
<input type="hidden" id="air_aday" name="air_aday" value="<%= air_aday %>" />
<input type="hidden" id="air_model" name="air_model" value="<%= air_model %>" />
<input type="hidden" id="air_fligname" name="air_fligname" value="<%= air_fligname %>" />
<input type="hidden" id="air_dday_time" name="air_dday_time" value="<%= air_dday_time %>" />
<input type="hidden" id="air_aday_time" name="air_aday_time" value="<%= air_aday_time %>" />
<input type="hidden" id="air_time_minute" name="air_time_minute" value="<%= air_time_minute %>" />

<!-- 항공창 예약 진행 하단 배너 -->
<div class="divbottom1">
<div class="divbottom2">
<div class="divbottom2_1">
<div class="divbottom2_1_1">
예상 결제 금액 
</div>
</div>
<div class="divbottom2_2">
<div>
</div>
<div class="divbottom2_2_1" id="selectedPrice" >
 <%= selectedPrice2 %><!-- 나중에 값 받아서 처리 -->
</div>
<input type="hidden" id="hiddenSelectedPrice" name="hiddenSelectedPrice">
<input type="hidden" id="selectedPrice2" name="selectedPrice2" value="<%= selectedPrice2 %>"> <!-- 운임비 -->
<input type="hidden" id="price" name="price">
<script>
var selectedPrice2 = <%= selectedPrice2 %>; // 기존에 선택된 가격 가져오기

function selectLuggagePrice
(selectedPrice2,price,air_deppt1,air_arrpt1,air_dday1,air_aday1,air_model1,air_fligname1,air_dday_time1,air_aday_time1,air_time_minute1,
		totalPrice,	air_deppt,air_arrpt,air_dday,air_aday,air_model,air_fligname,air_dday_time,air_aday_time,air_time_minute) {
/*     var selectedPriceElement = document.getElementById('selectedPrice');
    selectedPriceElement.innerText = selectedPrice2 + price; // 선택된 가격 더하기 */
    
    var selectedPriceElement = document.getElementById('selectedPrice');
    var selectedPrice = parseInt(selectedPriceElement.innerText);
    var sum = selectedPrice + parseInt(price);
    selectedPriceElement.innerText = sum; // Update the displayed sum
    console.log("운임값");
    console.log(selectedPrice2);
    console.log("수화물값");
    console.log(price);
    var lugweiinput = document.getElementById('price');
    lugweiinput.value = price;
	  var selectedPrice2input = document.getElementById('selectedPrice2').value;
	  selectedPrice2input.value = selectedPrice2;
    // Update the hidden input value
    var hiddenInput = document.getElementById('hiddenSelectedPrice');
    hiddenInput.value = sum;
    
    
	  /* flight2test 값 */
	  
	  var hiddenInput2_1 = document.getElementById('air_deppt1').value;
	  hiddenInput2_1.value = air_deppt1;
	  
	  var hiddenInput3_1 = document.getElementById('air_arrpt1').value;
	  hiddenInput3_1.value = air_arrpt1;
	  
	  var hiddenInput4_1 = document.getElementById('air_dday1').value;
	  hiddenInput4_1.value = air_dday1;
	  
	  var hiddenInput5_1 = document.getElementById('air_aday1').value;
	  hiddenInput5_1.value = air_aday1;
	  
	  var hiddenInput6_1 = document.getElementById('air_model1').value;
	  hiddenInput6_1.value = air_model1;
	  
	  var hiddenInput7_1 = document.getElementById('air_fligname1').value;
	  hiddenInput7_1.value = air_fligname1;
	  
	  var hiddenInput8_1 = document.getElementById('air_dday_time1').value;
	  hiddenInput8_1.value = air_dday_time1;
	  
	  var hiddenInput9_1 = document.getElementById('air_aday_time1').value;
	  hiddenInput9_1.value = air_aday_time1;
	  
	   var hiddenInput10_1 = document.getElementById('air_time_minute1').value;
	   hiddenInput10_1.value = air_time_minute1;
		
	   console.log("flight2test");
	  console.log(air_deppt1);
	  console.log(air_arrpt1);
	  console.log(air_dday1);
	  console.log(air_aday1);
	  console.log(air_model1);
	  console.log(air_fligname1);
	  console.log(air_dday_time1);
	  console.log(air_aday_time1);
	  console.log(air_time_minute1);
	  
	  
	  /* flight3_1 값 */
	   var hiddenInput1_2 = document.getElementById('selectedPrice2').value;
	  hiddenInput1_2.value = selectedPrice2; 
	  
	  var hiddenInput2_2 = document.getElementById('air_deppt').value;
	  hiddenInput2_2.value = air_deppt;
	  
	  var hiddenInput3_2 = document.getElementById('air_arrpt').value;
	  hiddenInput3_2.value = air_arrpt;
	  
	  var hiddenInput4_2 = document.getElementById('air_dday').value;
	  hiddenInput4_2.value = air_dday;
	  
	  var hiddenInput5_2 = document.getElementById('air_aday').value;
	  hiddenInput5_2.value = air_aday;
	  
	  var hiddenInput6_2 = document.getElementById('air_model').value;
	  hiddenInput6_2.value = air_model;
	  
	  var hiddenInput7_2 = document.getElementById('air_fligname').value;
	  hiddenInput7_2.value = air_fligname;
	  
	  var hiddenInput8_2 = document.getElementById('air_dday_time').value;
	  hiddenInput8_2.value = air_dday_time;
	  
	  var hiddenInput9_2 = document.getElementById('air_aday_time').value;
	  hiddenInput9_2.value = air_aday_time;
	  
	   var hiddenInput10_2 = document.getElementById('air_time_minute').value;
	   hiddenInput10_2.value = air_time_minute;
	   
	   console.log("flight3_1");
	  console.log(selectedPrice2);
	  console.log(air_deppt);
	  console.log(air_arrpt);
	  console.log(air_dday);
	  console.log(air_aday);
	  console.log(air_model);
	  console.log(air_fligname);
	  console.log(air_dday_time);
	  console.log(air_aday_time);
	  console.log(air_time_minute);
	  
	  console.log("수화물 더한 값");
	  console.log(sum);
}
</script>
<div class="divbottom2_2_2">
원
</div>
</div>
<div class="divbottom2_3" onclick="submitFlightForm()" >
<input type="submit" class="divbottom2_3_1" value="다음 여정" >
</div>

</div>
</div>
</form>
</body>
</html>