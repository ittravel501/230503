<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>항공 예약</title> 
        <link rel="stylesheet" href="./css/flight_multi.css">
        <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js">
        
        </script> 
        <script src="./js/flight_multi.js">

        </script>

    </head>
    <style type="text/css">
    </style>
<body>
<!-- 헤더 -->
<jsp:include page="header.jsp"></jsp:include>

<div class="divwrap1"> 
<div class="divwrap2"><!-- 수하물 제목 -->
<div class="divwrap3">
다구간 항공편 예매✈
</div>
</div>
<div class="divwrap5">
<div class="divwrap6">
<form action="flightAction.jsp"  method="post">
<div class="divwrap7">
<!-- 출발지 / 도착지 선택  -->
         			<div class="select_area2">
         					<label class="come1"> 출발지1 </label>
                            <select class="select1" name="air_deppt">
                              <option value="0" selected> 선택 </option>
                              <option value="CJU">제주</option>
                              <option value="PUS">김해/부산</option>
                              <option value="GMP">김포</option>
                              <option value="ICN">인천</option>
                              <option value="KWJ">광주</option>
                              <option value="RSU">여수</option>
                              <option value="USN">울산</option>
                              <option value="YNY">양양</option>
                              <option value="OSA">오사카</option>
                              <option value="NRT">도쿄(나리타)</option>
                              <option value="HND">도쿄(하네다)</option>
                              <option value="FUK">후쿠오카</option>
                              <option value="OKA">오키나와</option>
                              <option value="SPK">삿포로</option>
                              <option value="DAD">다낭</option>
                              <option value="BKK">방콕</option>
                              <option value="HKG">홍콩</option>
                              <option value="TPE">타이베이</option>
                              <option value="SGN">호치민시</option>
                              <option value="MNL">마닐라</option>
                              <option value="CEB">세부</option>
                              <option value="HAN">하노이</option>
                              <option value="SIN">싱가포르</option>
                              <option value="BKI">코타키나발루</option>
                              <option value="NHA">나트랑</option>
                              <option value="KUL">쿠알라룸푸르</option>
                              <option value="SHA">상하이</option>
                              <option value="TAO">청도</option>
                              <option value="CAN">광저우</option>
                              <option value="PEK">베이징</option>
                              <option value="LAX">로스앤젤레스</option>
                              <option value="HNL">하와이(호놀룰루)</option>
                              <option value="JFK">뉴욕</option>
                              <option value="YVR">밴쿠버</option>
                              <option value="SFO">샌프란시스코</option>
                              <option value="YYZ">토론토</option>
                              <option value="CDG">파리</option>
                              <option value="LHR">런던</option>
                              <option value="VVO">블라디보스토크</option>
                              <option value="FCO">로마</option>
                              <option value="PRG">프라하</option>
                              <option value="BCN">바르셀로나</option>
                              <option value="GUM">괌</option>
                              <option value="SYD">시드니</option>
                              <option value="MEL">멜버른</option>
                              <option value="BNE">브리즈번</option>
                              <option value="SPN">사이판</option>
                              <option value="AKL">오클랜드</option>
                              </select>
                              
                              <label class="come2" > 도착지1 </label>
                              <select class="select2" name="air_arrpt">
                              <option value="0" selected> 선택 </option>
                              <option value="CJU">제주</option>
                              <option value="PUS">김해/부산</option>
                              <option value="GMP">김포</option>
                              <option value="ICN">인천</option>
                              <option value="KWJ">광주</option>
                              <option value="RSU">여수</option>
                              <option value="USN">울산</option>
                              <option value="YNY">양양</option>
                              <option value="OSA">오사카</option>
                              <option value="NRT">도쿄(나리타)</option>
                              <option value="HND">도쿄(하네다)</option>
                              <option value="FUK">후쿠오카</option>
                              <option value="OKA">오키나와</option>
                              <option value="SPK">삿포로</option>
                              <option value="DAD">다낭</option>
                              <option value="BKK">방콕</option>
                              <option value="HKG">홍콩</option>
                              <option value="TPE">타이베이</option>
                              <option value="SGN">호치민시</option>
                              <option value="MNL">마닐라</option>
                              <option value="CEB">세부</option>
                              <option value="HAN">하노이</option>
                              <option value="SIN">싱가포르</option>
                              <option value="BKI">코타키나발루</option>
                              <option value="NHA">나트랑</option>
                              <option value="KUL">쿠알라룸푸르</option>
                              <option value="SHA">상하이</option>
                              <option value="TAO">청도</option>
                              <option value="CAN">광저우</option>
                              <option value="PEK">베이징</option>
                              <option value="LAX">로스앤젤레스</option>
                              <option value="HNL">하와이(호놀룰루)</option>
                              <option value="JFK">뉴욕</option>
                              <option value="YVR">밴쿠버</option>
                              <option value="SFO">샌프란시스코</option>
                              <option value="YYZ">토론토</option>
                              <option value="CDG">파리</option>
                              <option value="LHR">런던</option>
                              <option value="VVO">블라디보스토크</option>
                              <option value="FCO">로마</option>
                              <option value="PRG">프라하</option>
                              <option value="BCN">바르셀로나</option>
                              <option value="GUM">괌</option>
                              <option value="SYD">시드니</option>
                              <option value="MEL">멜버른</option>
                              <option value="BNE">브리즈번</option>
                              <option value="SPN">사이판</option>
                              <option value="AKL">오클랜드</option>
                              </select>
                              
                             <label class="come3"> 가는날</label>
                              <input type="date" class="date1" name="air_dday">
                            </div>
                            
                            <!-- 2 -->
                            <div class="select_area2_1">
         					<label class="come1_1"> 출발지2 </label>
                            <select class="select1_1" name="air_deppt">
                              <option value="0" selected> 선택 </option>
                              <option value="CJU">제주</option>
                              <option value="PUS">김해/부산</option>
                              <option value="GMP">김포</option>
                              <option value="ICN">인천</option>
                              <option value="KWJ">광주</option>
                              <option value="RSU">여수</option>
                              <option value="USN">울산</option>
                              <option value="YNY">양양</option>
                              <option value="OSA">오사카</option>
                              <option value="NRT">도쿄(나리타)</option>
                              <option value="HND">도쿄(하네다)</option>
                              <option value="FUK">후쿠오카</option>
                              <option value="OKA">오키나와</option>
                              <option value="SPK">삿포로</option>
                              <option value="DAD">다낭</option>
                              <option value="BKK">방콕</option>
                              <option value="HKG">홍콩</option>
                              <option value="TPE">타이베이</option>
                              <option value="SGN">호치민시</option>
                              <option value="MNL">마닐라</option>
                              <option value="CEB">세부</option>
                              <option value="HAN">하노이</option>
                              <option value="SIN">싱가포르</option>
                              <option value="BKI">코타키나발루</option>
                              <option value="NHA">나트랑</option>
                              <option value="KUL">쿠알라룸푸르</option>
                              <option value="SHA">상하이</option>
                              <option value="TAO">청도</option>
                              <option value="CAN">광저우</option>
                              <option value="PEK">베이징</option>
                              <option value="LAX">로스앤젤레스</option>
                              <option value="HNL">하와이(호놀룰루)</option>
                              <option value="JFK">뉴욕</option>
                              <option value="YVR">밴쿠버</option>
                              <option value="SFO">샌프란시스코</option>
                              <option value="YYZ">토론토</option>
                              <option value="CDG">파리</option>
                              <option value="LHR">런던</option>
                              <option value="VVO">블라디보스토크</option>
                              <option value="FCO">로마</option>
                              <option value="PRG">프라하</option>
                              <option value="BCN">바르셀로나</option>
                              <option value="GUM">괌</option>
                              <option value="SYD">시드니</option>
                              <option value="MEL">멜버른</option>
                              <option value="BNE">브리즈번</option>
                              <option value="SPN">사이판</option>
                              <option value="AKL">오클랜드</option>
                              </select>
                              
                              <label class="come2_1" > 도착지2 </label>
                              <select class="select2_1" name="air_arrpt">
                              <option value="0" selected> 선택 </option>
                              <option value="CJU">제주</option>
                              <option value="PUS">김해/부산</option>
                              <option value="GMP">김포</option>
                              <option value="ICN">인천</option>
                              <option value="KWJ">광주</option>
                              <option value="RSU">여수</option>
                              <option value="USN">울산</option>
                              <option value="YNY">양양</option>
                              <option value="OSA">오사카</option>
                              <option value="NRT">도쿄(나리타)</option>
                              <option value="HND">도쿄(하네다)</option>
                              <option value="FUK">후쿠오카</option>
                              <option value="OKA">오키나와</option>
                              <option value="SPK">삿포로</option>
                              <option value="DAD">다낭</option>
                              <option value="BKK">방콕</option>
                              <option value="HKG">홍콩</option>
                              <option value="TPE">타이베이</option>
                              <option value="SGN">호치민시</option>
                              <option value="MNL">마닐라</option>
                              <option value="CEB">세부</option>
                              <option value="HAN">하노이</option>
                              <option value="SIN">싱가포르</option>
                              <option value="BKI">코타키나발루</option>
                              <option value="NHA">나트랑</option>
                              <option value="KUL">쿠알라룸푸르</option>
                              <option value="SHA">상하이</option>
                              <option value="TAO">청도</option>
                              <option value="CAN">광저우</option>
                              <option value="PEK">베이징</option>
                              <option value="LAX">로스앤젤레스</option>
                              <option value="HNL">하와이(호놀룰루)</option>
                              <option value="JFK">뉴욕</option>
                              <option value="YVR">밴쿠버</option>
                              <option value="SFO">샌프란시스코</option>
                              <option value="YYZ">토론토</option>
                              <option value="CDG">파리</option>
                              <option value="LHR">런던</option>
                              <option value="VVO">블라디보스토크</option>
                              <option value="FCO">로마</option>
                              <option value="PRG">프라하</option>
                              <option value="BCN">바르셀로나</option>
                              <option value="GUM">괌</option>
                              <option value="SYD">시드니</option>
                              <option value="MEL">멜버른</option>
                              <option value="BNE">브리즈번</option>
                              <option value="SPN">사이판</option>
                              <option value="AKL">오클랜드</option>
                              </select>
                               <label class="come3"> 가는날</label>
                              <input type="date" class="date1" name="air_dday">
                            </div>
                            
                            <!-- 3 -->
                                <div class="select_area2_2">
         					<label class="come1_2"> 출발지3 </label>
                            <select class="select1_2" name="air_deppt">
                              <option value="0" selected> 선택 </option>
                              <option value="CJU">제주</option>
                              <option value="PUS">김해/부산</option>
                              <option value="GMP">김포</option>
                              <option value="ICN">인천</option>
                              <option value="KWJ">광주</option>
                              <option value="RSU">여수</option>
                              <option value="USN">울산</option>
                              <option value="YNY">양양</option>
                              <option value="OSA">오사카</option>
                              <option value="NRT">도쿄(나리타)</option>
                              <option value="HND">도쿄(하네다)</option>
                              <option value="FUK">후쿠오카</option>
                              <option value="OKA">오키나와</option>
                              <option value="SPK">삿포로</option>
                              <option value="DAD">다낭</option>
                              <option value="BKK">방콕</option>
                              <option value="HKG">홍콩</option>
                              <option value="TPE">타이베이</option>
                              <option value="SGN">호치민시</option>
                              <option value="MNL">마닐라</option>
                              <option value="CEB">세부</option>
                              <option value="HAN">하노이</option>
                              <option value="SIN">싱가포르</option>
                              <option value="BKI">코타키나발루</option>
                              <option value="NHA">나트랑</option>
                              <option value="KUL">쿠알라룸푸르</option>
                              <option value="SHA">상하이</option>
                              <option value="TAO">청도</option>
                              <option value="CAN">광저우</option>
                              <option value="PEK">베이징</option>
                              <option value="LAX">로스앤젤레스</option>
                              <option value="HNL">하와이(호놀룰루)</option>
                              <option value="JFK">뉴욕</option>
                              <option value="YVR">밴쿠버</option>
                              <option value="SFO">샌프란시스코</option>
                              <option value="YYZ">토론토</option>
                              <option value="CDG">파리</option>
                              <option value="LHR">런던</option>
                              <option value="VVO">블라디보스토크</option>
                              <option value="FCO">로마</option>
                              <option value="PRG">프라하</option>
                              <option value="BCN">바르셀로나</option>
                              <option value="GUM">괌</option>
                              <option value="SYD">시드니</option>
                              <option value="MEL">멜버른</option>
                              <option value="BNE">브리즈번</option>
                              <option value="SPN">사이판</option>
                              <option value="AKL">오클랜드</option>
                              </select>
                              
                              <label class="come2_2" > 도착지3 </label>
                              <select class="select2_2" name="air_arrpt">
                              <option value="0" selected> 선택 </option>
                              <option value="CJU">제주</option>
                              <option value="PUS">김해/부산</option>
                              <option value="GMP">김포</option>
                              <option value="ICN">인천</option>
                              <option value="KWJ">광주</option>
                              <option value="RSU">여수</option>
                              <option value="USN">울산</option>
                              <option value="YNY">양양</option>
                              <option value="OSA">오사카</option>
                              <option value="NRT">도쿄(나리타)</option>
                              <option value="HND">도쿄(하네다)</option>
                              <option value="FUK">후쿠오카</option>
                              <option value="OKA">오키나와</option>
                              <option value="SPK">삿포로</option>
                              <option value="DAD">다낭</option>
                              <option value="BKK">방콕</option>
                              <option value="HKG">홍콩</option>
                              <option value="TPE">타이베이</option>
                              <option value="SGN">호치민시</option>
                              <option value="MNL">마닐라</option>
                              <option value="CEB">세부</option>
                              <option value="HAN">하노이</option>
                              <option value="SIN">싱가포르</option>
                              <option value="BKI">코타키나발루</option>
                              <option value="NHA">나트랑</option>
                              <option value="KUL">쿠알라룸푸르</option>
                              <option value="SHA">상하이</option>
                              <option value="TAO">청도</option>
                              <option value="CAN">광저우</option>
                              <option value="PEK">베이징</option>
                              <option value="LAX">로스앤젤레스</option>
                              <option value="HNL">하와이(호놀룰루)</option>
                              <option value="JFK">뉴욕</option>
                              <option value="YVR">밴쿠버</option>
                              <option value="SFO">샌프란시스코</option>
                              <option value="YYZ">토론토</option>
                              <option value="CDG">파리</option>
                              <option value="LHR">런던</option>
                              <option value="VVO">블라디보스토크</option>
                              <option value="FCO">로마</option>
                              <option value="PRG">프라하</option>
                              <option value="BCN">바르셀로나</option>
                              <option value="GUM">괌</option>
                              <option value="SYD">시드니</option>
                              <option value="MEL">멜버른</option>
                              <option value="BNE">브리즈번</option>
                              <option value="SPN">사이판</option>
                              <option value="AKL">오클랜드</option>
                              </select>
                               <label class="come3"> 가는날</label>
                              <input type="date" class="date1" name="air_dday">
                            </div>
                            <!-- 여정 추가 버튼 -->
                            <div class="plusbutton1">
                             <div class="plusbutton2" onclick="addSelectArea()">
                             + 여정추가
                            </div>
                            </div>
                            <!-- 인원선택  -->
                             <div class="select_area2">
                              <label > 탑승 인원 </label>
                              <select class="personwrap1">
                              <option value="0" selected> 성인</option>
                              <option value="성인1"> 성인 1명</option>
                              <option value="성인2"> 성인 2명 </option>
                              <option value="성인3"> 성인 3명 </option>
                              <option value="성인4"> 성인 4명</option>
                              <option value="성인5"> 성인 5명 </option>
                              <option value="성인6"> 성인 6명 </option>
                              <option value="성인7"> 성인 7명</option>
                              <option value="성인8"> 성인 8명 </option>
                              <option value="성인9"> 성인 9명 </option>
                      
                              </select>
                              <select class="personwrap2">
                              <option value="0" selected> 소아 </option>
                              <option value="소아1"> 소아 1명</option>
                              <option value="소아2"> 소아 2명 </option>
                              <option value="소아3"> 소아 3명 </option>
                              <option value="소아4"> 소아 4명</option>
                              <option value="소아5"> 소아 5명 </option>
                              <option value="소아6"> 소아 6명 </option>
                              <option value="소아7"> 소아 7명</option>
                              <option value="소아8"> 소아 8명 </option>
                              <option value="소아9"> 소아 9명 </option>
                        
                              </select>
                              <select class="personwrap2">
                              <option value="none" selected> 유아 </option>
                             <option value="유아1"> 유아 1명</option>
                              <option value="유아2"> 유아 2명 </option>
                              <option value="유아3"> 유아 3명 </option>
                              <option value="유아4"> 유아 4명</option>
                              <option value="유아5"> 유아 5명 </option>
                              <option value="유아6"> 유아 6명 </option>
                              <option value="유아7"> 유아 7명</option>
                              <option value="유아8"> 유아 8명 </option>
                              <option value="유아9"> 유아 9명 </option>
                          
                              </select>
                            </div>
                            
</div>
<div class="buttonwrap1">
<button  type="submit" class="buttonwrap2">
항공권 검색
</button>
</div>
</form>
</div>
</div> 
</div> 
</div>
</div>


</body>
</html>