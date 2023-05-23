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
	    <title>호서대의 잇템을 찾다! 호잇마켓</title>
	</head>
	
	<body>
	    <div id="load_headers"></div>
		<div class="body_start">
			<h1 style="text-align:center; color: blue;"> <i style="color: #d49456;" class="fa-solid fa-store"></i>  Welcome to Ho It! Market!</h1>
	        <div class="index_logo">
	        	<img class="slide1" src="img/index_logo/index_logo_1.jpg">
				<img class="slide1" src="img/index_logo/index_logo_2.jpg">
				<img class="slide1" src="img/index_logo/index_logo_3.jpg">
				<img class="slide1" src="img/index_logo/index_logo_0.jpeg">
			</div>
			<script src="script/index_logo.js"></script>
	    </div>
	    <div id="load_footer"></div>
	</body>
</html>
