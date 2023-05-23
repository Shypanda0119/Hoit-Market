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
			<header class="header">
	        <div class="header__hd" align="center">
	            <h1 class="" >Q&A게시판</h1>
	            <!-- <p class="">
	                <img src="" width="100%" height="300px">
	  
	            </p> -->
	        </div>
	    	</header>

		<div class="container">
			<div align="center">
				<form method="post" action="service_question_writeAction.jsp">
				<table align="center" class="container__table" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th style="background-color: #eeeeee; text-align: center;">게시판 글쓰기 양식</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" placeholder="글 제목" name="questionTitle"></td>
						</tr>
						<tr>
							<td><textarea placeholder="글 내용" name="questionContent" style="height:350px;width:300px;"></textarea></td>
						</tr>
					</tbody>
			</table>
			<div align="center">
				<input type="submit" value="글쓰기" class="signUp__btn">
			</div>
		</form>
	</div>
</div>
</div>
</body>
