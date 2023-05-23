<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ page import="java.io.PipedWriter" %>
<%@ page import="service.Notice" %>
<%@ page import="service.NoticeDAO" %>
<%@ page import="hoituser.HoitUser" %>
<%@ page import="hoituser.HoitUserDAO" %>
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
	<%
		int pageNumber = 1; //기본 페이지 넘버
		if (request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));}
		
		String userId = null;
		int userRank = 0;
		if(session.getAttribute("userId") != null){
			userId = (String)session.getAttribute("userId");
			HoitUserDAO hoituser = new HoitUserDAO();
			userRank = hoituser.userRankGet(userId);
		}
		
	%>
	    <div id="load_headers"></div>
		<div class="body_start">
			<h1 style="text-align:center;">Ho It! Market</h1>
		    <h3 style="text-align:center;">- 공지사항 -</h3>
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
						NoticeDAO noticeDAO = new NoticeDAO();
						ArrayList<Notice> list = noticeDAO.getList(pageNumber);
						for (int i = 0; i < list.size(); i++) {
						%>
					<tr>
						<td style="width: 50px;"><%=list.get(i).getNoticeId()%></td>
						<td style="width: 700px; text-align: left;"><a style="color: black;"href="service_notice_View.jsp?nId=<%=list.get(i).getNoticeId()%>">
						<%=list.get(i).getNoticeTitle()%></a></td>
						<td style="width: 150px;"><%=list.get(i).getUserId()%></td>
						<td style="width: 220px;"><%=list.get(i).getNoticeDate() %></td>
					</tr>
						<%
						}
						%>
					</tbody>
				</table>
				
				<%if (pageNumber == 1) {%>	
					<input type="button" value="이전" disabled style="background-color:#fbf1e2;" class="mypage_button" id="info_change_now" onclick="location.href='market.jsp?pageNumber=<%=pageNumber -1%>'">
			<%	} else {%>
					<input type="button" value="이전" class="mypage_button" id="info_change_now" onclick="location.href='market.jsp?pageNumber=<%=pageNumber -1%>'">
			<%  } if (noticeDAO.nextPage(pageNumber)) { %>
					<input type="button" value="다음" class="mypage_button" id="info_change_now" onclick="location.href='market.jsp?pageNumber=<%=pageNumber +1%>'">
				<%} else { %>
					<input type="button" value="다음" disabled style="background-color:#fbf1e2;" class="mypage_button" id="info_change_now" onclick="location.href='market.jsp?pageNumber=<%=pageNumber +1%>'">
				<%} %>
				<br>
				<br>
			<% if (userId != null && userRank == 1) {%>
				<div align="center">
					<input type="button" value="글쓰기" class="signUp__btn" onclick="location.href='service_notice_write.jsp'">
				</div>
			<%}%>
			</div>
		</div>
			
		
		
		</div>
		<div id="load_footer"></div>
	</body>
</html>
