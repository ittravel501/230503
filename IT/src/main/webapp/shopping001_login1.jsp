<!DOCTYPE html>

<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTf-8"%>

<% request.setCharacterEncoding("utf-8"); %>

<link rel="stylesheet" href="css/it_login.css">

<html>
<head>
   <meta charset="utf-8">

   

   <title> it 로그인 </title>
</head>

<body>

<header>
   <jsp:include page="header.jsp" />
</header> 

   <section>

      <div class="login_box">
   
         <form action="shopping001_login2.jsp">
            <div> <p>ID</p><input type="text" name="mem_id"></div>
            <div> <p>PW</p><input type="password" name="mem_pw"> </div>
            <input type="submit" name="loginbt" value="로그인">
         </form>

      </div>

   </section>
   
   <footer>
   <jsp:include page="footer.jsp"/>
	</footer>
	
</body>
</html>
                                        