<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html>
<html lang="en">
	<head>
	    <meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link rel="stylesheet" href="style.css">
		<!-- <link rel="stylesheet" href="index.jsp">
	    <link rel="stylesheet" href="login.jsp"> -->
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
	    <title>(HoIt! Market) Sign Up Section</title>
	    
	</head>
	<body>
	    <div id="load_headers"></div>
		<div class="body_start">
			<h1 style="text-align:center;">Ho It! Market</h1>
			<h3 style="text-align:center;">- 회원가입 -</h3>
		    <hr>
			<div class="login-form" align="center">
	            <form method="post" action="JoinAction.jsp">
	            	<div class="login-form">
	                	<input type="text" name="userId" class="text__field" placeholder="아이디">
	                </div>
	                <div class="login-form">
	                	<input type="password" name="userPassword" id="pw" class="text__field" placeholder="비밀번호">
	                </div>
	                <div class="login-form">
	                	<input type="password" name="userPassword_check" id="pw_check" class="text__field" onchange="isSame(this)" placeholder="비밀번호 재확인">
	                	<br>
	                	<span id="check_same"></span>
	                </div>
	                
	                <script>
						function isSame(obj) {
							var pw = document.getElementById('pw').value;
							var pw_check = document.getElementById('pw_check').value;
							if(pw != '' || pw_check != '') {
								if(pw == pw_check) {
									document.getElementById('check_same').innerHTML='비밀번호가 일치합니다.';
									document.getElementById('check_same').style.fontSize='13px';
									document.getElementById('check_same').style.color='blue';
									document.getElementById('pw_check').style.marginBottom='0px';
								} else {
									document.getElementById('check_same').innerHTML='비밀번호가 일치하지 않습니다.';
									document.getElementById('check_same').style.fontSize='13px';
									document.getElementById('check_same').style.color='red';
									document.getElementById('pw_check').style.marginBottom='0px';
									document.getElementById('pw_check').value=null;
								}
							}
						}
					</script>
	                
	                <div class="login-form">
	                	<input type="text" name="userName" class="text__field" placeholder="이름">
	                </div>
	                <div class="login-form">
	                	<input type="text" name="userDept" class="text__field" placeholder="학과">
	                </div>
	                <div class="login-form">
	                	<input type="text" name="userStudentNumber" class="text__field" placeholder="학번">
	                </div>
	                <div class="login-form">
	                	<label>
	                		<input type="radio" name="userGender" autocomplete="off" value="남자" checked>남자
	                	</label>
	                	<label>
	                		<input type="radio" name="userGender" autocomplete="off" value="여자" checked>여자
	                	</label>
	                </div>
	                <div class="login-form">
	                	<input type="text" name="userPhoneNumber" class="text__field" placeholder="전화번호">
	                </div>
	                <input type="submit" value="회원가입" class="submit__btn">
	            </form>
            </div>
		</div>
	    <div id="load_footer"></div>
	</body>
</html>