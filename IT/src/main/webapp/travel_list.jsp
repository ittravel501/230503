<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@page import="dto.*"%>
<%
request.setCharacterEncoding("utf-8");
%>
<%
ArrayList<TravelDTO> travelList = (ArrayList<TravelDTO>) request.getAttribute("travelList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>�� ���� ����</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="js/travel_plan.js"></script>
<link rel="stylesheet" href="css/travelList.css">
</head>
<body>

	<header>
		<jsp:include page="/header.jsp" />
	</header>
	<div class="picwrap1">
		<div class=title>
			<%
			String mem_nick = (String) session.getAttribute("mem_nick");
			%>
			<H2 style="width: 800px;"><%=mem_nick%>���� ����
			</H2>
			<h4>
				Ŭ���ϸ� �������� �������� �Ѿ�ϴ�.
				</h4>
		</div>
		<div class="awrap">
			<%
			if (travelList != null) {
				for (int i = 0; i < travelList.size(); i++) {
					int tra_num = travelList.get(i).getTra_num();
			%>
			<div class="pntwrap" style="display : inline-block;">
				<a href="/MngSchList.bo?tra_num=<%=tra_num%>"> <%=travelList.get(i).getTra_title()%>,
					<%=travelList.get(i).getTra_dday()%> ~ <%=travelList.get(i).getTra_aday()%>,
					<%=travelList.get(i).getTra_ppl()%>��
				</a>				
			</div>
			<div class="deletetravel" onclick="deleteTravel(this)" ">����</div>
			<%
			}
			}
			%>
		</div>
	</div>


	<footer>
		<jsp:include page="/footer.jsp" />
	</footer>
</body>

<script>
	$(document).ready(function() {
		$('.pntwrap a').click(function(e) {
			e.preventDefault(); // �⺻ ������ ��ũ �̵��� �����ϴ�.
			var url = $(this).attr('href'); // Ŭ���� ��ũ�� URL�� �����ɴϴ�.
			window.location.href = url; // URL�� ������ �̵��մϴ�.
		});
	});
	
	function deleteTravel(element) {
		var awrap = element.parentNode;
		  var pntwrap = element.previousElementSibling;
		  var aTag = pntwrap.querySelector("a");
		  var tra_num = aTag.getAttribute("href").split("=")[1];
		  
		  // AJAX ��û ������
		  $.ajax({
		    type: "POST",
		    url: "deleteTravel.bo",
		    data: JSON.stringify({ tra_num: tra_num }),
		    contentType: "application/json",
		    dataType: "json",
		    success: function(response) {
		    	 element.remove();
		         pntwrap.remove();
		         if (awrap.childElementCount === 0) {
		             awrap.textContent = "������ �����ϴ�.";
		           }
		    },
		    error: function(jqXHR, textStatus, errorThrown) {
		      console.error("���� �߻�:", textStatus, errorThrown);
		      alert("���� ���� �� ������ �߻��߽��ϴ�.");
		    }
		  });
		}
</script>
</html>