<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html>
<html lang="en">
	<head>
	    <meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link rel="stylesheet" href="style.css">
	    <!-- <link rel="stylesheet "href="index.jsp"> -->
	    <link rel="preconnect" href="https://fonts.googleapis.com"> 
	    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@200&display=swap" rel="stylesheet">
	    <script
	        src="https://kit.fontawesome.com/b86cbc37dc.js"
	        crossorigin="anonymous"
	    ></script>
	    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	    <script type="text/javascript">
		$(document).ready( function() {
			$("#load_headers").load("header.jsp");  // Header Load
			$("#load_footer").load("footer.html");  // Footer Load
		});</script>
	    <title>(HoIt! Market) Login Section</title>
	</head>
	<body>
	    <div id="load_headers"></div>
		<div class="body_start">
		    <p class="">
		    	<h1 style="text-align:center;">Ho It! Market</h1>
		    	<h3 style="text-align:center;">- 로그인 -</h3>
		    	<hr>
		        <div class="login-form">
		          <form align="center" method="post" action="LoginAction.jsp">
		                <input type="text" name="userId" class="text__field" placeholder="아이디">
		                <input type="password" name="userPassword" class="text__field" placeholder="비밀번호"><br>
		                <input type="submit" value="로그인" class="submit__btn"><br>
		                <input type="button" value="회원가입" class="signUp__btn" onclick="location.href='signup.jsp'">
		            </form>
		            
		            <div class="links" align="center">
		                <a href="searchPassword.jsp">아이디 / 비밀번호를 잊어버리셨나요?</a>
		            </div>
		        </div>
		    </p>
	    </div>
	    <div id="load_footer"></div>
	</body>
</html>