<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ page import="java.io.PipedWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %>
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
	<%request.setCharacterEncoding("utf-8"); %>
	<%
		int pageNumber = 1; //기본 페이지 넘버
		if (request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));}
	%>
	    <div id="load_headers"></div>
		<div class="body_start">
			<h1 style="text-align:center;">Ho It! Market</h1>
		    <h3 style="text-align:center;">- 검색결과 -</h3>
			<hr>
		<div class="container">
			<div class="" align="center">
				<table class="container__table" style="text-align: center;">
					<thead>
						<tr>
							<th style="background-color: #eeeeee; text-align: center; width: 50px; border: 1px solid #dddddd;">번호</th>
							<th style="background-color: #eeeeee; text-align: center; width: 700px; border: 1px solid #dddddd;">제목</th>
							<th style="background-color: #eeeeee; text-align: center; width: 150px; border: 1px solid #dddddd;">작성자</th>
							<th style="background-color: #eeeeee; text-align: center; width: 220px; border: 1px solid #dddddd;">작성일</th>
						</tr>
					</thead>
					<tbody>
						<%
						String SearchData = request.getParameter("SearchData");
						String SearchType = request.getParameter("SearchType");
						BbsDAO bbsDAO = new BbsDAO();
						ArrayList<Bbs> list = bbsDAO.searchList(pageNumber,SearchData, SearchType);
						for (int i = 0; i < list.size(); i++) {
						%>
					<tr>
						<td style="width: 50px;"><%=list.get(i).getBbsId()%></td>
						<td style="width: 700px; text-align: left;"><a style="color: black;"href="view.jsp?bbsID=<%=list.get(i).getBbsId()%>">
						<%=list.get(i).getBbsTitle()%></a></td>
						<td style="width: 150px;"><%=list.get(i).getUserId()%></td>
						<td style="width: 220px;"><%=list.get(i).getBbsDate() %></td>
					</tr>
						<%
						}
						%>
					</tbody>
				</table>
				<form method="post" action="marketSearch.jsp">
					<select name = "SearchType"style="height: 30px; border:1px solid grey; border-radius: 5px;">
						<option value="searchNumber">번호</option>
						<option value="searchName">이름</option>
						<option value="searchTitle">제목</option>
					</select>
					<input type="text" name="SearchData" class="info_page_edit" style="border:1px solid grey;"placeholder="검색어를 입력하세요.">
					<input type="submit" class="mypage_button" id="info_change_now" value="검색">
				</form>
				<br>
				<br>
			<%
				if (session.getAttribute("userID") != null) {
			%>
			<a href="write.jsp">글쓰기</a>
			<%
				} else {
			%>
				<div align="center">
					<input type="button" value="글쓰기" class="signUp__btn" onclick="location.href='write.jsp'">
				</div>
			<%
				}
			%>
			</div>
		</div>
			
		
		
		</div>
	</body>
</html>
