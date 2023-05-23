<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html>
<html lang="en">
	<head>
	    <meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link rel="stylesheet" href="style.css">
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
		
	    <title>(HoIt! Market) Password Search Section</title>
	</head>
	<body>
	    <div id="load_headers"></div>
	    <div class="body_start">
	    	<h1 style="text-align:center;">Ho It! Market</h1>
	    	<h3 style="text-align:center;">- 아이디/비밀번호 찾기 -</h3>
		    <hr>
			<div class="serach_form" align="center">
	            <form name="serachUserId" method="post" action="searchIdAction.jsp" style="width: 300px; border-bottom: 3px solid black;">
	            	<h4>아이디 찾기</h4>
	            	<div class="login-form">
	                	<input type="text" name="userName" class="text__field" placeholder="이름">
	                </div>
	                <div class="login-form">
	                	<input type="text" name="userStudentNumber" class="text__field" placeholder="학번">
	                </div>
	                <input type="submit" value="아이디 찾기" class="submit__btn">
	            </form>
	            
	            
	            
	            <form name="serachUswerPw" method="post" action="searchPwAction.jsp" style="width: 300px;">
	            	<h4>비밀번호 찾기</h4>
	            	<div class="login-form">
	                	<input type="text" name="userId" class="text__field" placeholder="아이디">
	                </div>
	                <div class="login-form">
	                	<input type="text" name="userName" class="text__field" placeholder="이름">
	                </div>
	                <div class="login-form">
	                	<input type="text" name="userStudentNumber" class="text__field" placeholder="학번">
	                </div>
	                <input type="submit" value="비밀번호 찾기" class="submit__btn">
	            </form>
	        </div>
	    </div>
	    <div id="load_footer"></div>
	</body>
</html>

