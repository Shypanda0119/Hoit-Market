<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ page import="java.io.PipedWriter" %>
<!DOCTYPE html>
<html>
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
		<title>Header Load</title>
	</head>
	<body>
			<% 
			String userId = null;
			if(session.getAttribute("userId") != null){
				userId = (String)session.getAttribute("userId");
			}
			%>
		<nav class="navbar">
	        <div class="navbar__logo">
	            <i class="fa-solid fa-store"></i> 
	            <a href="index.jsp">Ho It! Market</a>
	        </div>
	
	        <ul class="navbar__menu">
	            <li>소개
	            	<ul class="navbar_menu_sub">
	            		<li><a href="intro_team.html">기업 소개</a>
	            		<li><a href="intro_org.html">조직도</a>
	            		<li><a href="intro_map.html">찾아오는 길</a>
	            	</ul>
	            </li>
	            <li>고객센터
	            	<ul class="navbar_menu_sub">
	            		<li><a href="service_notice.jsp">공지사항</a>
	            		<li><a href="service_report.jsp">신고하기</a>
	            		<li><a href="service_question.jsp">Q&A</a>
	            	</ul>
	            </li>
	            <li><a href="market.jsp">마켓</a></li>
	            <% if(userId == null){%>
	            <li><a href="login.jsp">로그인</a></li>
	        	<li><a href="signup.jsp">회원가입</a></li>
	        	<%
	            } else{
	        	%>
	        	<li><a href="myPage.jsp">마이페이지</a></li>
	        	<li><a href="LogoutAction.jsp">로그아웃</a></li>
	        	<%
	            }  
	        	%>
	        <ul>
	    </nav>
	</body>
</html>