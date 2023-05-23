<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
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
		
	    <title>(HoIt! Market) Error Page!</title>
	</head>
	<body>
	    <div id="load_headers"></div>
	    <div class="body_start">
	    	<h1 style="text-align:center;">Ho It! Market</h1>
	    	<h3 style="text-align:center;">- Error Page -</h3>
		    <hr>
		    <div style="text-align:center;">
			  	<h2>죄송합니다, 처리중 문제가 발생하였습니다.</h2>
			  	<br>
			 	해당 페이지가 나타난 경우 하단 Error Code를 촬영후 제보해주세요.<br> 
			 	홈페이지 발전에 큰 도움이 됩니다.<br>
			 	또한 해당 페이지가 반복하여 나오게 된다면 다음 연락처로 연락해주세요.<br>
			 	빠른시일내 복구하도록 하겠습니다.<br>
			 	죄송합니다.<br>
			 	<br>
			 	<b>페이지 담당자 : </b> 20181137@vision.hoseo.edu<br>
		 	</div>
		 	<br>
		    <div align="center">
			    <div id="" style="border: 1px solid black; height: 200px; width: 600px; word-break:break-all;">
					<b style="color:red;">-Error Code-</b><br><%=exception %>
				</div>
			</div>
	    <div id="load_footer"></div>
	</body>
</html>

